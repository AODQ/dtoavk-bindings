module cimgui_impl_glfw_vulkan;
// ImGui GLFW binding with Vulkan + shaders

// Missing features:
//  [ ] User texture binding. Changes of ImTextureID aren't supported by this
//  binding! See https://github.com/ocornut/imgui/pull/914

// You can copy and use unmodified imgui_impl_* files in your project. See
// main.cpp for an example of using this.
// If you use this binding you'll need to call 5 functions:
// ImGui_ImplXXXX_Init(), ImGui_ImplXXX_CreateFontsTexture(),
// ImGui_ImplXXXX_NewFrame(), ImGui_ImplXXXX_Render() and
// ImGui_ImplXXXX_Shutdown().
// If you are new to ImGui, see examples/README.txt and documentation at the top
// of imgui.cpp.
// https://github.com/ocornut/imgui

// CHANGELOG
// (minor and older changes stripped away, please see git history for details)
//  2018-03-20: Misc: Setup io.BackendFlags ImGuiBackendFlags_HasMouseCursors flag + honor ImGuiConfigFlags_NoMouseCursorChange flag.
//  2018-02-20: Inputs: Added support for mouse cursors (ImGui::GetMouseCursor() value and WM_SETCURSOR message handling).
//  2018-02-20: Inputs: Renamed GLFW callbacks exposed in .h to not include Vulkan in their name.
//  2018-02-16: Misc: Obsoleted the io.RenderDrawListsFn callback, ImGui_ImplGlfwVulkan_Render() calls ImGui_ImplGlfwVulkan_RenderDrawData() itself.
//  2018-02-06: Misc: Removed call to ImGui::Shutdown() which is not available from 1.60 WIP, user needs to call CreateContext/DestroyContext themselves.
//  2018-02-06: Inputs: Added mapping for ImGuiKey_Space.
//  2018-01-20: Inputs: Added Horizontal Mouse Wheel support.
//  2018-01-18: Inputs: Added mapping for ImGuiKey_Insert.
//  2017-08-25: Inputs: MousePos set to -FLT_MAX,-FLT_MAX when mouse is unavailable/missing (instead of -1,-1).
//  2017-05-15: Vulkan: Fix scissor offset being negative. Fix new Vulkan validation warnings. Set required depth member for buffer image copy.
//  2016-11-13: Vulkan: Fix validation layer warnings and errors and redeclare gl_PerVertex.
//  2016-10-18: Vulkan: Add location decorators & change to use structs as in/out in glsl, update embedded spv (produced with glslangValidator -x). Null the released resources.
//  2016-10-15: Misc: Added a void* user_data parameter to Clipboard function handlers.
//  2016-08-27: Vulkan: Fix Vulkan example for use when a depth buffer is active.

import core.stdc.stdint;
import core.stdc.string;

import cimgui;
import glfw;
import vk;

enum ImguiVkQueuedFrames = 2;

struct ImGui_ImplGlfwVulkan_Init_Data
{
    VkAllocationCallbacks* allocator;
    VkPhysicalDevice       gpu;
    VkDevice               device;
    VkRenderPass           render_pass;
    VkPipelineCache        pipeline_cache;
    VkDescriptorPool       descriptor_pool;
    nothrow void function(VkResult err) check_vk_result;
};

private:

// GLFW data
GLFWwindow*  g_Window                = null;
double       g_Time                  = 0.0;
bool[3]      g_MouseJustPressed      = [ false, false, false ];
GLFWcursor*[ImGuiMouseCursor.count] g_MouseCursors;

// Vulkan data
VkAllocationCallbacks* g_Allocator      = null;
VkPhysicalDevice       g_Gpu            = null;
VkDevice               g_Device         = null;
VkRenderPass           g_RenderPass     = null;
VkPipelineCache        g_PipelineCache  = null;
VkDescriptorPool       g_DescriptorPool = null;
nothrow void function(VkResult err) g_CheckVkResult;

VkCommandBuffer        g_CommandBuffer         = null;
VkDeviceSize           g_BufferMemoryAlignment = 256;
VkPipelineCreateFlags  g_PipelineCreateFlags   = 0;
int                    g_FrameIndex            = 0;

VkDescriptorSetLayout  g_DescriptorSetLayout = null;
VkPipelineLayout       g_PipelineLayout      = null;
VkDescriptorSet        g_DescriptorSet       = null;
VkPipeline             g_Pipeline            = null;

VkSampler              g_FontSampler = null;
VkDeviceMemory         g_FontMemory  = null;
VkImage                g_FontImage   = null;
VkImageView            g_FontView    = null;

VkDeviceMemory[ImguiVkQueuedFrames] g_VertexBufferMemory ;
VkDeviceMemory[ImguiVkQueuedFrames] g_IndexBufferMemory  ;
VkDeviceSize[ImguiVkQueuedFrames]   g_VertexBufferSize   ;
VkDeviceSize[ImguiVkQueuedFrames]   g_IndexBufferSize    ;
VkBuffer[ImguiVkQueuedFrames]       g_VertexBuffer       ;
VkBuffer[ImguiVkQueuedFrames]       g_IndexBuffer        ;

VkDeviceMemory g_UploadBufferMemory = null;
VkBuffer       g_UploadBuffer       = null;

nothrow uint32_t ImGui_ImplGlfwVulkan_MemoryType(VkMemoryPropertyFlags properties, uint32_t type_bits)
{
    VkPhysicalDeviceMemoryProperties prop;
    vkGetPhysicalDeviceMemoryProperties(g_Gpu, &prop);
    for (uint32_t i = 0; i < prop.memoryTypeCount; i++)
        if ((prop.memoryTypes[i].propertyFlags & properties) == properties && type_bits & (1<<i))
            return i;
    return 0xffffffff; // Unable to find memoryType
}

nothrow void ImGui_ImplGlfwVulkan_VkResult(VkResult err)
{
    if (g_CheckVkResult)
        g_CheckVkResult(err);
}

// This is the main rendering function that you have to implement and provide to ImGui (via setting up 'RenderDrawListsFn' in the ImGuiIO structure)
nothrow void ImGui_ImplGlfwVulkan_RenderDrawData(ImDrawData* draw_data)
{
    VkResult err;
    ImGuiIO* io = igGetIO;
    if (draw_data.TotalVtxCount == 0)
        return;

    // Create the Vertex Buffer:
    size_t vertex_size = draw_data.TotalVtxCount * ImDrawVert.sizeof;
    if (!g_VertexBuffer[g_FrameIndex] || g_VertexBufferSize[g_FrameIndex] < vertex_size)
    {
        if (g_VertexBuffer[g_FrameIndex])
            vkDestroyBuffer(g_Device, g_VertexBuffer[g_FrameIndex], g_Allocator);
        if (g_VertexBufferMemory[g_FrameIndex])
            vkFreeMemory(g_Device, g_VertexBufferMemory[g_FrameIndex], g_Allocator);
        VkDeviceSize vertex_buffer_size = ((vertex_size-1) / g_BufferMemoryAlignment+1) * g_BufferMemoryAlignment;
        VkBufferCreateInfo buffer_info = {};
        buffer_info.sType = VkStructureType.bufferCreateInfo;
        buffer_info.size = vertex_buffer_size;
        buffer_info.usage = VkBufferUsageFlag.vertexBufferBit;
        buffer_info.sharingMode = VkSharingMode.exclusive;
        err = vkCreateBuffer(g_Device, &buffer_info, g_Allocator, &g_VertexBuffer[g_FrameIndex]);
        ImGui_ImplGlfwVulkan_VkResult(err);
        VkMemoryRequirements req;
        vkGetBufferMemoryRequirements(g_Device, g_VertexBuffer[g_FrameIndex], &req);
        g_BufferMemoryAlignment = (g_BufferMemoryAlignment > req.alignment) ? g_BufferMemoryAlignment : req.alignment;
        VkMemoryAllocateInfo alloc_info = {};
        alloc_info.sType = VkStructureType.memoryAllocateInfo;
        alloc_info.allocationSize = req.size;
        alloc_info.memoryTypeIndex = ImGui_ImplGlfwVulkan_MemoryType(VkMemoryPropertyFlag.hostVisibleBit, req.memoryTypeBits);
        err = vkAllocateMemory(g_Device, &alloc_info, g_Allocator, &g_VertexBufferMemory[g_FrameIndex]);
        ImGui_ImplGlfwVulkan_VkResult(err);
        err = vkBindBufferMemory(g_Device, g_VertexBuffer[g_FrameIndex], g_VertexBufferMemory[g_FrameIndex], 0);
        ImGui_ImplGlfwVulkan_VkResult(err);
        g_VertexBufferSize[g_FrameIndex] = vertex_buffer_size;
    }

    // Create the Index Buffer:
    size_t index_size = draw_data.TotalIdxCount * ImDrawIdx.sizeof;
    if (!g_IndexBuffer[g_FrameIndex] || g_IndexBufferSize[g_FrameIndex] < index_size)
    {
        if (g_IndexBuffer[g_FrameIndex])
            vkDestroyBuffer(g_Device, g_IndexBuffer[g_FrameIndex], g_Allocator);
        if (g_IndexBufferMemory[g_FrameIndex])
            vkFreeMemory(g_Device, g_IndexBufferMemory[g_FrameIndex], g_Allocator);
        VkDeviceSize index_buffer_size = ((index_size-1) / g_BufferMemoryAlignment+1) * g_BufferMemoryAlignment;
        VkBufferCreateInfo buffer_info = {};
        buffer_info.sType = VkStructureType.bufferCreateInfo;
        buffer_info.size = index_buffer_size;
        buffer_info.usage = VkBufferUsageFlag.indexBufferBit;
        buffer_info.sharingMode = VkSharingMode.exclusive;
        err = vkCreateBuffer(g_Device, &buffer_info, g_Allocator, &g_IndexBuffer[g_FrameIndex]);
        ImGui_ImplGlfwVulkan_VkResult(err);
        VkMemoryRequirements req;
        vkGetBufferMemoryRequirements(g_Device, g_IndexBuffer[g_FrameIndex], &req);
        g_BufferMemoryAlignment = (g_BufferMemoryAlignment > req.alignment) ? g_BufferMemoryAlignment : req.alignment;
        VkMemoryAllocateInfo alloc_info = {};
        alloc_info.sType = VkStructureType.memoryAllocateInfo;
        alloc_info.allocationSize = req.size;
        alloc_info.memoryTypeIndex = ImGui_ImplGlfwVulkan_MemoryType(VkMemoryPropertyFlag.hostVisibleBit, req.memoryTypeBits);
        err = vkAllocateMemory(g_Device, &alloc_info, g_Allocator, &g_IndexBufferMemory[g_FrameIndex]);
        ImGui_ImplGlfwVulkan_VkResult(err);
        err = vkBindBufferMemory(g_Device, g_IndexBuffer[g_FrameIndex], g_IndexBufferMemory[g_FrameIndex], 0);
        ImGui_ImplGlfwVulkan_VkResult(err);
        g_IndexBufferSize[g_FrameIndex] = index_buffer_size;
    }

    // Upload Vertex and index Data:
    {
        ImDrawVert* vtx_dst;
        ImDrawIdx* idx_dst;
        err = vkMapMemory(g_Device, g_VertexBufferMemory[g_FrameIndex], 0, vertex_size, 0, cast(void**)(&vtx_dst));
        ImGui_ImplGlfwVulkan_VkResult(err);
        err = vkMapMemory(g_Device, g_IndexBufferMemory[g_FrameIndex], 0, index_size, 0, cast(void**)(&idx_dst));
        ImGui_ImplGlfwVulkan_VkResult(err);
        for (int n = 0; n < draw_data.CmdListsCount; n++)
        {
            const (ImDrawList)* cmd_list = draw_data.CmdLists[n];
            memcpy(vtx_dst, cmd_list.VtxBuffer.Data, cmd_list.VtxBuffer.Size * ImDrawVert.sizeof);
            memcpy(idx_dst, cmd_list.IdxBuffer.Data, cmd_list.IdxBuffer.Size * ImDrawIdx.sizeof);
            vtx_dst += cmd_list.VtxBuffer.Size;
            idx_dst += cmd_list.IdxBuffer.Size;
        }
        VkMappedMemoryRange[2] range;
        range[0].sType = VkStructureType.mappedMemoryRange;
        range[0].memory = g_VertexBufferMemory[g_FrameIndex];
        range[0].size = VK_WHOLE_SIZE;
        range[1].sType = VkStructureType.mappedMemoryRange;
        range[1].memory = g_IndexBufferMemory[g_FrameIndex];
        range[1].size = VK_WHOLE_SIZE;
        err = vkFlushMappedMemoryRanges(g_Device, 2, range.ptr);
        ImGui_ImplGlfwVulkan_VkResult(err);
        vkUnmapMemory(g_Device, g_VertexBufferMemory[g_FrameIndex]);
        vkUnmapMemory(g_Device, g_IndexBufferMemory[g_FrameIndex]);
    }

    // Bind pipeline and descriptor sets:
    {
        vkCmdBindPipeline(g_CommandBuffer, VkPipelineBindPoint.graphics, g_Pipeline);
        VkDescriptorSet[1] desc_set = [g_DescriptorSet];
        vkCmdBindDescriptorSets(g_CommandBuffer, VkPipelineBindPoint.graphics, g_PipelineLayout, 0, 1, desc_set.ptr, 0, null);
    }

    // Bind Vertex And Index Buffer:
    {
        VkBuffer[1] vertex_buffers = [g_VertexBuffer[g_FrameIndex]];
        VkDeviceSize[1] vertex_offset = [0];
        vkCmdBindVertexBuffers(g_CommandBuffer, 0, 1, vertex_buffers.ptr, vertex_offset.ptr);
        vkCmdBindIndexBuffer(g_CommandBuffer, g_IndexBuffer[g_FrameIndex], 0, VkIndexType.uint16);
    }

    // Setup viewport:
    {
        VkViewport viewport;
        viewport.x = 0;
        viewport.y = 0;
        viewport.width = igGetIO.DisplaySize.x;
        viewport.height = igGetIO.DisplaySize.y;
        viewport.minDepth = 0.0f;
        viewport.maxDepth = 1.0f;
        vkCmdSetViewport(g_CommandBuffer, 0, 1, &viewport);
    }

    // Setup scale and translation:
    {
        float[2] scale;
        scale[0] = 2.0f/io.DisplaySize.x;
        scale[1] = 2.0f/io.DisplaySize.y;
        float[2] translate;
        translate[0] = -1.0f;
        translate[1] = -1.0f;
        vkCmdPushConstants(g_CommandBuffer, g_PipelineLayout, VkShaderStageFlag.vertexBit, float.sizeof * 0, float.sizeof * 2, scale.ptr);
        vkCmdPushConstants(g_CommandBuffer, g_PipelineLayout, VkShaderStageFlag.vertexBit, float.sizeof * 2, float.sizeof * 2, translate.ptr);
    }

    // Render the command lists:
    int vtx_offset = 0;
    int idx_offset = 0;
    for (int n = 0; n < draw_data.CmdListsCount; n++)
    {
        const (ImDrawList)* cmd_list = draw_data.CmdLists[n];
        for (int cmd_i = 0; cmd_i < cmd_list.CmdBuffer.Size; cmd_i++)
        {
            const (ImDrawCmd)* pcmd = &cmd_list.CmdBuffer.Data[cmd_i];
            if (pcmd.UserCallback)
            {
                pcmd.UserCallback(cmd_list, pcmd);
            }
            else
            {
                VkRect2D scissor;
                scissor.offset.x = cast(int32_t)(pcmd.ClipRect.x) > 0 ? cast(int32_t)(pcmd.ClipRect.x) : 0;
                scissor.offset.y = cast(int32_t)(pcmd.ClipRect.y) > 0 ? cast(int32_t)(pcmd.ClipRect.y) : 0;
                scissor.extent.width = cast(uint32_t)(pcmd.ClipRect.z - pcmd.ClipRect.x);
                scissor.extent.height = cast(uint32_t)(pcmd.ClipRect.w - pcmd.ClipRect.y + 1); // FIXME: Why +1 here?
                vkCmdSetScissor(g_CommandBuffer, 0, 1, &scissor);
                vkCmdDrawIndexed(g_CommandBuffer, pcmd.ElemCount, 1, idx_offset, vtx_offset, 0);
            }
            idx_offset += pcmd.ElemCount;
        }
        vtx_offset += cmd_list.VtxBuffer.Size;
    }
}

extern(C) const(char)* ImGui_ImplGlfwVulkan_GetClipboardText(void* user_data)
{
    return glfwGetClipboardString(cast(GLFWwindow*)user_data);
}

extern(C) nothrow void ImGui_ImplGlfwVulkan_SetClipboardText(void* user_data, const(char)* text)
{
    glfwSetClipboardString(cast(GLFWwindow*)user_data, text);
}

extern(C) nothrow void ImGui_ImplGlfw_MouseButtonCallback(GLFWwindow*, int button, int action, int /*mods*/)
{
    if (action == GLFW_PRESS && button >= 0 && button < 3)
        g_MouseJustPressed[button] = true;
}

extern(C) nothrow void ImGui_ImplGlfw_ScrollCallback(GLFWwindow*, double xoffset, double yoffset)
{
    ImGuiIO* io = igGetIO;
    io.MouseWheelH += cast(float)xoffset;
    io.MouseWheel += cast(float)yoffset;
}

extern(C) nothrow void ImGui_ImplGlfw_KeyCallback(GLFWwindow*, int key, int, int action, int mods)
{
    ImGuiIO* io = igGetIO;
    if (action == GLFW_PRESS)
        io.KeysDown[key] = true;
    if (action == GLFW_RELEASE)
        io.KeysDown[key] = false;

    io.KeyCtrl = io.KeysDown[GLFW_KEY_LEFT_CONTROL] || io.KeysDown[GLFW_KEY_RIGHT_CONTROL];
    io.KeyShift = io.KeysDown[GLFW_KEY_LEFT_SHIFT] || io.KeysDown[GLFW_KEY_RIGHT_SHIFT];
    io.KeyAlt = io.KeysDown[GLFW_KEY_LEFT_ALT] || io.KeysDown[GLFW_KEY_RIGHT_ALT];
    io.KeySuper = io.KeysDown[GLFW_KEY_LEFT_SUPER] || io.KeysDown[GLFW_KEY_RIGHT_SUPER];
}

extern(C) nothrow void ImGui_ImplGlfw_CharCallback(GLFWwindow*, uint c)
{
    ImGuiIO* io = igGetIO;
    if (c > 0 && c < 0x10000)
        io.ImGuiIO_AddInputCharacter (cast(ushort)c);
}

extern(C) nothrow bool ImGui_ImplGlfwVulkan_CreateFontsTexture(VkCommandBuffer command_buffer)
{
    ImGuiIO* io = igGetIO;

    uint8_t* pixels;
    int width, height, bpp;
    io.Fonts.ImFontAtlas_GetTexDataAsAlpha8 (&pixels, &width, &height, &bpp);
    size_t upload_size = width*height*4*char.sizeof;

    VkResult err;

    // Create the Image:
    {
        VkImageCreateInfo info = {};
        info.sType = VkStructureType.imageCreateInfo;
        info.imageType = VkImageType.i2D;
        info.format = VkFormat.r8g8b8a8Unorm;
        info.extent.width = width;
        info.extent.height = height;
        info.extent.depth = 1;
        info.mipLevels = 1;
        info.arrayLayers = 1;
        info.samples = VkSampleCountFlag.i1Bit;
        info.tiling = VkImageTiling.optimal;
        info.usage = VkImageUsageFlag.sampledBit | VkImageUsageFlag.transferDstBit;
        info.sharingMode = VkSharingMode.exclusive;
        info.initialLayout = VkImageLayout.undefined;
        err = vkCreateImage(g_Device, &info, g_Allocator, &g_FontImage);
        ImGui_ImplGlfwVulkan_VkResult(err);
        VkMemoryRequirements req;
        vkGetImageMemoryRequirements(g_Device, g_FontImage, &req);
        VkMemoryAllocateInfo alloc_info = {};
        alloc_info.sType = VkStructureType.memoryAllocateInfo;
        alloc_info.allocationSize = req.size;
        alloc_info.memoryTypeIndex = ImGui_ImplGlfwVulkan_MemoryType(VkMemoryPropertyFlag.deviceLocalBit, req.memoryTypeBits);
        err = vkAllocateMemory(g_Device, &alloc_info, g_Allocator, &g_FontMemory);
        ImGui_ImplGlfwVulkan_VkResult(err);
        err = vkBindImageMemory(g_Device, g_FontImage, g_FontMemory, 0);
        ImGui_ImplGlfwVulkan_VkResult(err);
    }

    // Create the Image View:
    {
        VkImageViewCreateInfo info = {};
        info.sType = VkStructureType.imageViewCreateInfo;
        info.image = g_FontImage;
        info.viewType = VkImageViewType.i2D;
        info.format = VkFormat.r8g8b8a8Unorm;
        info.subresourceRange.aspectMask = VkImageAspectFlag.colorBit;
        info.subresourceRange.levelCount = 1;
        info.subresourceRange.layerCount = 1;
        err = vkCreateImageView(g_Device, &info, g_Allocator, &g_FontView);
        ImGui_ImplGlfwVulkan_VkResult(err);
    }

    // Update the Descriptor Set:
    {
        VkDescriptorImageInfo[1] desc_image;
        desc_image[0].sampler = g_FontSampler;
        desc_image[0].imageView = g_FontView;
        desc_image[0].imageLayout = VkImageLayout.shaderReadOnlyOptimal;
        VkWriteDescriptorSet[1] write_desc;
        write_desc[0].sType = VkStructureType.writeDescriptorSet;
        write_desc[0].dstSet = g_DescriptorSet;
        write_desc[0].descriptorCount = 1;
        write_desc[0].descriptorType = VkDescriptorType.combinedImageSampler;
        write_desc[0].pImageInfo = desc_image.ptr;
        vkUpdateDescriptorSets(g_Device, 1, write_desc.ptr, 0, null);
    }

    // Create the Upload Buffer:
    {
        VkBufferCreateInfo buffer_info = {};
        buffer_info.sType = VkStructureType.bufferCreateInfo;
        buffer_info.size = upload_size;
        buffer_info.usage = VkBufferUsageFlag.transferSrcBit;
        buffer_info.sharingMode = VkSharingMode.exclusive;
        err = vkCreateBuffer(g_Device, &buffer_info, g_Allocator, &g_UploadBuffer);
        ImGui_ImplGlfwVulkan_VkResult(err);
        VkMemoryRequirements req;
        vkGetBufferMemoryRequirements(g_Device, g_UploadBuffer, &req);
        g_BufferMemoryAlignment = (g_BufferMemoryAlignment > req.alignment) ? g_BufferMemoryAlignment : req.alignment;
        VkMemoryAllocateInfo alloc_info = {};
        alloc_info.sType = VkStructureType.memoryAllocateInfo;
        alloc_info.allocationSize = req.size;
        alloc_info.memoryTypeIndex = ImGui_ImplGlfwVulkan_MemoryType(VkMemoryPropertyFlag.hostVisibleBit, req.memoryTypeBits);
        err = vkAllocateMemory(g_Device, &alloc_info, g_Allocator, &g_UploadBufferMemory);
        ImGui_ImplGlfwVulkan_VkResult(err);
        err = vkBindBufferMemory(g_Device, g_UploadBuffer, g_UploadBufferMemory, 0);
        ImGui_ImplGlfwVulkan_VkResult(err);
    }

    // Upload to Buffer:
    {
        char* map = null;
        err = vkMapMemory(g_Device, g_UploadBufferMemory, 0, upload_size, 0, cast(void**)(&map));
        ImGui_ImplGlfwVulkan_VkResult(err);
        memcpy(map, pixels, upload_size);
        VkMappedMemoryRange[1] range;
        range[0].sType = VkStructureType.mappedMemoryRange;
        range[0].memory = g_UploadBufferMemory;
        range[0].size = upload_size;
        err = vkFlushMappedMemoryRanges(g_Device, 1, range.ptr);
        ImGui_ImplGlfwVulkan_VkResult(err);
        vkUnmapMemory(g_Device, g_UploadBufferMemory);
    }
    // Copy to Image:
    {
        VkImageMemoryBarrier[1] copy_barrier;
        copy_barrier[0].sType = VkStructureType.imageMemoryBarrier;
        copy_barrier[0].dstAccessMask = VkAccessFlag.transferWriteBit;
        copy_barrier[0].oldLayout = VkImageLayout.undefined;
        copy_barrier[0].newLayout = VkImageLayout.transferDstOptimal;
        copy_barrier[0].srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
        copy_barrier[0].dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
        copy_barrier[0].image = g_FontImage;
        copy_barrier[0].subresourceRange.aspectMask = VkImageAspectFlag.colorBit;
        copy_barrier[0].subresourceRange.levelCount = 1;
        copy_barrier[0].subresourceRange.layerCount = 1;
        vkCmdPipelineBarrier(command_buffer, VkPipelineStageFlag.hostBit, VkPipelineStageFlag.transferBit, 0, 0, null, 0, null, 1, copy_barrier.ptr);

        VkBufferImageCopy region = {};
        region.imageSubresource.aspectMask = VkImageAspectFlag.colorBit;
        region.imageSubresource.layerCount = 1;
        region.imageExtent.width = width;
        region.imageExtent.height = height;
        region.imageExtent.depth = 1;
        vkCmdCopyBufferToImage(command_buffer, g_UploadBuffer, g_FontImage, VkImageLayout.transferDstOptimal, 1, &region);

        VkImageMemoryBarrier[1] use_barrier;
        use_barrier[0].sType = VkStructureType.imageMemoryBarrier;
        use_barrier[0].srcAccessMask = VkAccessFlag.transferWriteBit;
        use_barrier[0].dstAccessMask = VkAccessFlag.shaderReadBit;
        use_barrier[0].oldLayout = VkImageLayout.transferDstOptimal;
        use_barrier[0].newLayout = VkImageLayout.shaderReadOnlyOptimal;
        use_barrier[0].srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
        use_barrier[0].dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
        use_barrier[0].image = g_FontImage;
        use_barrier[0].subresourceRange.aspectMask = VkImageAspectFlag.colorBit;
        use_barrier[0].subresourceRange.levelCount = 1;
        use_barrier[0].subresourceRange.layerCount = 1;
        vkCmdPipelineBarrier(command_buffer, VkPipelineStageFlag.transferBit, VkPipelineStageFlag.fragmentShaderBit, 0, 0, null, 0, null, 1, use_barrier.ptr);
    }

    // Store our identifier
    io.Fonts.TexID = cast(void *)cast(intptr_t)g_FontImage;

    return true;
}

bool ImGui_ImplGlfwVulkan_CreateDeviceObjects()
{
    VkResult err;
    VkShaderModule vert_module;
    VkShaderModule frag_module;

    // Create The Shader Modules:
    {
        VkShaderModuleCreateInfo vert_info = {};
        vert_info.sType = VkStructureType.shaderModuleCreateInfo;
        vert_info.codeSize = __glsl_shader_vert_spv.length * __glsl_shader_vert_spv[0].sizeof;
        vert_info.pCode = cast(uint32_t*)__glsl_shader_vert_spv;
        err = vkCreateShaderModule(g_Device, &vert_info, g_Allocator, &vert_module);
        ImGui_ImplGlfwVulkan_VkResult(err);
        VkShaderModuleCreateInfo frag_info = {};
        frag_info.sType = VkStructureType.shaderModuleCreateInfo;
        frag_info.codeSize = __glsl_shader_frag_spv.length * __glsl_shader_frag_spv[0].sizeof;
        frag_info.pCode = cast(uint32_t*)__glsl_shader_frag_spv;
        err = vkCreateShaderModule(g_Device, &frag_info, g_Allocator, &frag_module);
        ImGui_ImplGlfwVulkan_VkResult(err);
    }

    if (!g_FontSampler)
    {
        VkSamplerCreateInfo info = {};
        info.sType = VkStructureType.samplerCreateInfo;
        info.magFilter = VkFilter.linear;
        info.minFilter = VkFilter.linear;
        info.mipmapMode = VkSamplerMipmapMode.linear;
        info.addressModeU = VkSamplerAddressMode.repeat;
        info.addressModeV = VkSamplerAddressMode.repeat;
        info.addressModeW = VkSamplerAddressMode.repeat;
        info.minLod = -1000;
        info.maxLod = 1000;
        info.maxAnisotropy = 1.0f;
        err = vkCreateSampler(g_Device, &info, g_Allocator, &g_FontSampler);
        ImGui_ImplGlfwVulkan_VkResult(err);
    }

    if (!g_DescriptorSetLayout)
    {
        VkSampler[1] sampler = [g_FontSampler];
        VkDescriptorSetLayoutBinding[1] binding;
        binding[0].descriptorType = VkDescriptorType.combinedImageSampler;
        binding[0].descriptorCount = 1;
        binding[0].stageFlags = VkShaderStageFlag.fragmentBit;
        binding[0].pImmutableSamplers = sampler.ptr;
        VkDescriptorSetLayoutCreateInfo info = {};
        info.sType = VkStructureType.descriptorSetLayoutCreateInfo;
        info.bindingCount = 1;
        info.pBindings = binding.ptr;
        err = vkCreateDescriptorSetLayout(g_Device, &info, g_Allocator, &g_DescriptorSetLayout);
        ImGui_ImplGlfwVulkan_VkResult(err);
    }

    // Create Descriptor Set:
    {
        VkDescriptorSetAllocateInfo alloc_info = {};
        alloc_info.sType = VkStructureType.descriptorSetAllocateInfo;
        alloc_info.descriptorPool = g_DescriptorPool;
        alloc_info.descriptorSetCount = 1;
        alloc_info.pSetLayouts = &g_DescriptorSetLayout;
        err = vkAllocateDescriptorSets(g_Device, &alloc_info, &g_DescriptorSet);
        ImGui_ImplGlfwVulkan_VkResult(err);
    }

    if (!g_PipelineLayout)
    {
        VkPushConstantRange[1] push_constants;
        push_constants[0].stageFlags = VkShaderStageFlag.vertexBit;
        push_constants[0].offset = float.sizeof * 0;
        push_constants[0].size = float.sizeof * 4;
        VkDescriptorSetLayout[1] set_layout = [g_DescriptorSetLayout];
        VkPipelineLayoutCreateInfo layout_info = {};
        layout_info.sType = VkStructureType.pipelineLayoutCreateInfo;
        layout_info.setLayoutCount = 1;
        layout_info.pSetLayouts = set_layout.ptr;
        layout_info.pushConstantRangeCount = 1;
        layout_info.pPushConstantRanges = push_constants.ptr;
        err = vkCreatePipelineLayout(g_Device, &layout_info, g_Allocator, &g_PipelineLayout);
        ImGui_ImplGlfwVulkan_VkResult(err);
    }

    VkPipelineShaderStageCreateInfo[2] stage;
    stage[0].sType = VkStructureType.pipelineShaderStageCreateInfo;
    stage[0].stage = VkShaderStageFlag.vertexBit;
    stage[0].module_ = vert_module;
    stage[0].pName = "main";
    stage[1].sType = VkStructureType.pipelineShaderStageCreateInfo;
    stage[1].stage = VkShaderStageFlag.fragmentBit;
    stage[1].module_ = frag_module;
    stage[1].pName = "main";

    VkVertexInputBindingDescription[1] binding_desc;
    binding_desc[0].stride = ImDrawVert.sizeof;
    binding_desc[0].inputRate = VkVertexInputRate.vertex;

    VkVertexInputAttributeDescription[3] attribute_desc;
    attribute_desc[0].location = 0;
    attribute_desc[0].binding = binding_desc[0].binding;
    attribute_desc[0].format = VkFormat.r32g32Sfloat;
    attribute_desc[0].offset = cast(uint32_t)(&(cast(ImDrawVert*)0).pos);
    attribute_desc[1].location = 1;
    attribute_desc[1].binding = binding_desc[0].binding;
    attribute_desc[1].format = VkFormat.r32g32Sfloat;
    attribute_desc[1].offset = cast(uint32_t)(&(cast(ImDrawVert*)0).uv);
    attribute_desc[2].location = 2;
    attribute_desc[2].binding = binding_desc[0].binding;
    attribute_desc[2].format = VkFormat.r8g8b8a8Unorm;
    attribute_desc[2].offset = cast(uint32_t)(&(cast(ImDrawVert*)0).col);

    VkPipelineVertexInputStateCreateInfo vertex_info = {};
    vertex_info.sType = VkStructureType.pipelineVertexInputStateCreateInfo;
    vertex_info.vertexBindingDescriptionCount = 1;
    vertex_info.pVertexBindingDescriptions = binding_desc.ptr;
    vertex_info.vertexAttributeDescriptionCount = 3;
    vertex_info.pVertexAttributeDescriptions = attribute_desc.ptr;

    VkPipelineInputAssemblyStateCreateInfo ia_info = {};
    ia_info.sType = VkStructureType.pipelineInputAssemblyStateCreateInfo;
    ia_info.topology = VkPrimitiveTopology.triangleList;

    VkPipelineViewportStateCreateInfo viewport_info = {};
    viewport_info.sType = VkStructureType.pipelineViewportStateCreateInfo;
    viewport_info.viewportCount = 1;
    viewport_info.scissorCount = 1;

    VkPipelineRasterizationStateCreateInfo raster_info = {};
    raster_info.sType = VkStructureType.pipelineRasterizationStateCreateInfo;
    raster_info.polygonMode = VkPolygonMode.fill;
    raster_info.cullMode = VkCullModeFlag.none;
    raster_info.frontFace = VkFrontFace.counterClockwise;
    raster_info.lineWidth = 1.0f;

    VkPipelineMultisampleStateCreateInfo ms_info = {};
    ms_info.sType = VkStructureType.pipelineMultisampleStateCreateInfo;
    ms_info.rasterizationSamples = VkSampleCountFlag.i1Bit;

    VkPipelineColorBlendAttachmentState[1] color_attachment;
    color_attachment[0].blendEnable = VK_TRUE;
    color_attachment[0].srcColorBlendFactor = VkBlendFactor.srcAlpha;
    color_attachment[0].dstColorBlendFactor = VkBlendFactor.oneMinusSrcAlpha;
    color_attachment[0].colorBlendOp = VkBlendOp.add;
    color_attachment[0].srcAlphaBlendFactor = VkBlendFactor.oneMinusSrcAlpha;
    color_attachment[0].dstAlphaBlendFactor = VkBlendFactor.zero;
    color_attachment[0].alphaBlendOp = VkBlendOp.add;
    color_attachment[0].colorWriteMask = VkColorComponentFlag.rBit | VkColorComponentFlag.gBit | VkColorComponentFlag.bBit | VkColorComponentFlag.aBit;

    VkPipelineDepthStencilStateCreateInfo depth_info = {};
    depth_info.sType = VkStructureType.pipelineDepthStencilStateCreateInfo;

    VkPipelineColorBlendStateCreateInfo blend_info = {};
    blend_info.sType = VkStructureType.pipelineColorBlendStateCreateInfo;
    blend_info.attachmentCount = 1;
    blend_info.pAttachments = color_attachment.ptr;

    VkDynamicState[2] dynamic_states = [ VkDynamicState.viewport, VkDynamicState.scissor ];
    VkPipelineDynamicStateCreateInfo dynamic_state = {};
    dynamic_state.sType = VkStructureType.pipelineDynamicStateCreateInfo;
    dynamic_state.dynamicStateCount = 2;
    dynamic_state.pDynamicStates = dynamic_states.ptr;

    VkGraphicsPipelineCreateInfo info = {};
    info.sType = VkStructureType.graphicsPipelineCreateInfo;
    info.flags = g_PipelineCreateFlags;
    info.stageCount = 2;
    info.pStages = stage.ptr;
    info.pVertexInputState = &vertex_info;
    info.pInputAssemblyState = &ia_info;
    info.pViewportState = &viewport_info;
    info.pRasterizationState = &raster_info;
    info.pMultisampleState = &ms_info;
    info.pDepthStencilState = &depth_info;
    info.pColorBlendState = &blend_info;
    info.pDynamicState = &dynamic_state;
    info.layout = g_PipelineLayout;
    info.renderPass = g_RenderPass;
    err = vkCreateGraphicsPipelines(g_Device, g_PipelineCache, 1, &info, g_Allocator, &g_Pipeline);
    ImGui_ImplGlfwVulkan_VkResult(err);

    vkDestroyShaderModule(g_Device, vert_module, g_Allocator);
    vkDestroyShaderModule(g_Device, frag_module, g_Allocator);

    return true;
}

nothrow void    ImGui_ImplGlfwVulkan_InvalidateFontUploadObjects()
{
    if (g_UploadBuffer)
    {
        vkDestroyBuffer(g_Device, g_UploadBuffer, g_Allocator);
        g_UploadBuffer = null;
    }
    if (g_UploadBufferMemory)
    {
        vkFreeMemory(g_Device, g_UploadBufferMemory, g_Allocator);
        g_UploadBufferMemory = null;
    }
}

nothrow void    ImGui_ImplGlfwVulkan_InvalidateDeviceObjects()
{
    ImGui_ImplGlfwVulkan_InvalidateFontUploadObjects();

    for (int i = 0; i < ImguiVkQueuedFrames; i++)
    {
        if (g_VertexBuffer[i])          { vkDestroyBuffer(g_Device, g_VertexBuffer[i], g_Allocator); g_VertexBuffer[i] = null; }
        if (g_VertexBufferMemory[i])    { vkFreeMemory(g_Device, g_VertexBufferMemory[i], g_Allocator); g_VertexBufferMemory[i] = null; }
        if (g_IndexBuffer[i])           { vkDestroyBuffer(g_Device, g_IndexBuffer[i], g_Allocator); g_IndexBuffer[i] = null; }
        if (g_IndexBufferMemory[i])     { vkFreeMemory(g_Device, g_IndexBufferMemory[i], g_Allocator); g_IndexBufferMemory[i] = null; }
    }

    if (g_FontView)             { vkDestroyImageView(g_Device, g_FontView, g_Allocator); g_FontView = null; }
    if (g_FontImage)            { vkDestroyImage(g_Device, g_FontImage, g_Allocator); g_FontImage = null; }
    if (g_FontMemory)           { vkFreeMemory(g_Device, g_FontMemory, g_Allocator); g_FontMemory = null; }
    if (g_FontSampler)          { vkDestroySampler(g_Device, g_FontSampler, g_Allocator); g_FontSampler = null; }
    if (g_DescriptorSetLayout)  { vkDestroyDescriptorSetLayout(g_Device, g_DescriptorSetLayout, g_Allocator); g_DescriptorSetLayout = null; }
    if (g_PipelineLayout)       { vkDestroyPipelineLayout(g_Device, g_PipelineLayout, g_Allocator); g_PipelineLayout = null; }
    if (g_Pipeline)             { vkDestroyPipeline(g_Device, g_Pipeline, g_Allocator); g_Pipeline = null; }
}

nothrow void ImGui_ImplGlfw_InstallCallbacks(GLFWwindow* window)
{
    glfwSetMouseButtonCallback(window, &ImGui_ImplGlfw_MouseButtonCallback);
    glfwSetScrollCallback(window,      &ImGui_ImplGlfw_ScrollCallback);
    glfwSetKeyCallback(window,         &ImGui_ImplGlfw_KeyCallback);
    glfwSetCharCallback(window,        &ImGui_ImplGlfw_CharCallback);
}

bool    ImGui_ImplGlfwVulkan_Init(GLFWwindow* window, bool install_callbacks, ImGui_ImplGlfwVulkan_Init_Data *init_data)
{
    g_Allocator = init_data.allocator;
    g_Gpu = init_data.gpu;
    g_Device = init_data.device;
    g_RenderPass = init_data.render_pass;
    g_PipelineCache = init_data.pipeline_cache;
    g_DescriptorPool = init_data.descriptor_pool;
    g_CheckVkResult = init_data.check_vk_result;

    g_Window = window;
    g_Time = 0.0;

    // Setup back-end capabilities flags
    ImGuiIO* io = igGetIO;
    io.BackendFlags |= ImGuiBackendFlags.hasMouseCursors;   // We can honor GetMouseCursor() values (optional)

    // Keyboard mapping. ImGui will use those indices to peek into the io.KeysDown[] array.
    io.KeyMap[ImGuiKey.tab] = GLFW_KEY_TAB;
    io.KeyMap[ImGuiKey.leftArrow] = GLFW_KEY_LEFT;
    io.KeyMap[ImGuiKey.rightArrow] = GLFW_KEY_RIGHT;
    io.KeyMap[ImGuiKey.upArrow] = GLFW_KEY_UP;
    io.KeyMap[ImGuiKey.downArrow] = GLFW_KEY_DOWN;
    io.KeyMap[ImGuiKey.pageUp] = GLFW_KEY_PAGE_UP;
    io.KeyMap[ImGuiKey.pageDown] = GLFW_KEY_PAGE_DOWN;
    io.KeyMap[ImGuiKey.home] = GLFW_KEY_HOME;
    io.KeyMap[ImGuiKey.end] = GLFW_KEY_END;
    io.KeyMap[ImGuiKey.insert] = GLFW_KEY_INSERT;
    io.KeyMap[ImGuiKey.delete_] = GLFW_KEY_DELETE;
    io.KeyMap[ImGuiKey.backspace] = GLFW_KEY_BACKSPACE;
    io.KeyMap[ImGuiKey.space] = GLFW_KEY_SPACE;
    io.KeyMap[ImGuiKey.enter] = GLFW_KEY_ENTER;
    io.KeyMap[ImGuiKey.escape] = GLFW_KEY_ESCAPE;
    io.KeyMap[ImGuiKey.a] = GLFW_KEY_A;
    io.KeyMap[ImGuiKey.c] = GLFW_KEY_C;
    io.KeyMap[ImGuiKey.v] = GLFW_KEY_V;
    io.KeyMap[ImGuiKey.x] = GLFW_KEY_X;
    io.KeyMap[ImGuiKey.y] = GLFW_KEY_Y;
    io.KeyMap[ImGuiKey.z] = GLFW_KEY_Z;

    io.SetClipboardTextFn = &ImGui_ImplGlfwVulkan_SetClipboardText;
    io.GetClipboardTextFn = &ImGui_ImplGlfwVulkan_GetClipboardText;
    io.ClipboardUserData = g_Window;

version(Windows) {
    io.ImeWindowHandle = glfwGetWin32Window(g_Window);
}


    // Load cursors
    // FIXME: GLFW doesn't expose suitable cursors for ResizeAll, ResizeNESW, ResizeNWSE. We revert to arrow cursor for those.
    g_MouseCursors[ImGuiMouseCursor.arrow] = glfwCreateStandardCursor(GLFW_ARROW_CURSOR);
    g_MouseCursors[ImGuiMouseCursor.textInput] = glfwCreateStandardCursor(GLFW_IBEAM_CURSOR);
    g_MouseCursors[ImGuiMouseCursor.resizeAll] = glfwCreateStandardCursor(GLFW_ARROW_CURSOR);
    g_MouseCursors[ImGuiMouseCursor.resizeNS] = glfwCreateStandardCursor(GLFW_VRESIZE_CURSOR);
    g_MouseCursors[ImGuiMouseCursor.resizeEW] = glfwCreateStandardCursor(GLFW_HRESIZE_CURSOR);
    g_MouseCursors[ImGuiMouseCursor.resizeNESW] = glfwCreateStandardCursor(GLFW_ARROW_CURSOR);
    g_MouseCursors[ImGuiMouseCursor.resizeNWSE] = glfwCreateStandardCursor(GLFW_ARROW_CURSOR);

    if (install_callbacks)
        ImGui_ImplGlfw_InstallCallbacks(window);

    ImGui_ImplGlfwVulkan_CreateDeviceObjects();

    return true;
}

nothrow void ImGui_ImplGlfwVulkan_Shutdown()
{
    // Destroy GLFW mouse cursors
    for (ImGuiMouseCursor cursor_n = cast(ImGuiMouseCursor)0; cursor_n < ImGuiMouseCursor.count; cursor_n++)
        glfwDestroyCursor(g_MouseCursors[cursor_n]);
    memset(cast(void*)g_MouseCursors.ptr, 0, g_MouseCursors[0].sizeof * g_MouseCursors.length);

    // Destroy Vulkan objects
    ImGui_ImplGlfwVulkan_InvalidateDeviceObjects();
}

nothrow void ImGui_ImplGlfwVulkan_NewFrame()
{
    ImGuiIO* io = igGetIO;

    // Setup display size (every frame to accommodate for window resizing)
    int w, h;
    int display_w, display_h;
    glfwGetWindowSize(g_Window, &w, &h);
    glfwGetFramebufferSize(g_Window, &display_w, &display_h);
    io.DisplaySize = ImVec2(cast(float)w, cast(float)h);
    io.DisplayFramebufferScale = ImVec2(w > 0 ? (cast(float)display_w / w) : 0, h > 0 ? (cast(float)display_h / h) : 0);

    // Setup time step
    double current_time =  glfwGetTime();
    io.DeltaTime = g_Time > 0.0 ? cast(float)(current_time - g_Time) : cast(float)(1.0f/60.0f);
    g_Time = current_time;

    // Setup inputs
    // (we already got mouse wheel, keyboard keys & characters from glfw callbacks polled in glfwPollEvents())
    if (glfwGetWindowAttrib(g_Window, GLFW_FOCUSED))
    {
        double mouse_x, mouse_y;
        glfwGetCursorPos(g_Window, &mouse_x, &mouse_y);
        io.MousePos = ImVec2(cast(float)mouse_x, cast(float)mouse_y);
    }
    else
    {
        io.MousePos = ImVec2(-float.max,-float.max);
    }

    for (int i = 0; i < 3; i++)
    {
        io.MouseDown[i] = g_MouseJustPressed[i] || glfwGetMouseButton(g_Window, i) != 0;    // If a mouse press event came, always pass it as "mouse held this frame", so we don't miss click-release events that are shorter than 1 frame.
        g_MouseJustPressed[i] = false;
    }

    // Update OS/hardware mouse cursor if imgui isn't drawing a software cursor
    if ((io.ConfigFlags & ImGuiConfigFlags.noMouseCursorChange) == 0)
    {
        ImGuiMouseCursor cursor = igGetMouseCursor;
        if (io.MouseDrawCursor || cursor == ImGuiMouseCursor.none)
        {
            glfwSetInputMode(g_Window, GLFW_CURSOR, GLFW_CURSOR_HIDDEN);
        }
        else
        {
            glfwSetCursor(g_Window, g_MouseCursors[cursor] ? g_MouseCursors[cursor] : g_MouseCursors[ImGuiMouseCursor.arrow]);
            glfwSetInputMode(g_Window, GLFW_CURSOR, GLFW_CURSOR_NORMAL);
        }
    }

    // Start the frame. This call will update the io.WantCaptureMouse, io.WantCaptureKeyboard flag that you can use to dispatch inputs (or not) to your application.
    igNewFrame;
}

nothrow void ImGui_ImplGlfwVulkan_Render(VkCommandBuffer command_buffer)
{
    g_CommandBuffer = command_buffer;
    igRender;
    ImGui_ImplGlfwVulkan_RenderDrawData(igGetDrawData);
    g_CommandBuffer = null;
    g_FrameIndex = (g_FrameIndex + 1) % ImguiVkQueuedFrames;
}

uint32_t[] __glsl_shader_vert_spv = [
  0x07230203, 0x00010000, 0x00080001, 0x0000002e, 0x00000000, 0x00020011,
  0x00000001, 0x0006000b, 0x00000001, 0x4c534c47, 0x6474732e, 0x3035342e,
  0x00000000, 0x0003000e, 0x00000000, 0x00000001, 0x000a000f, 0x00000000,
  0x00000004, 0x6e69616d, 0x00000000, 0x0000000b, 0x0000000f, 0x00000015,
  0x0000001b, 0x0000001c, 0x00030003, 0x00000002, 0x000001c2, 0x00040005,
  0x00000004, 0x6e69616d, 0x00000000, 0x00030005, 0x00000009, 0x00000000,
  0x00050006, 0x00000009, 0x00000000, 0x6f6c6f43, 0x00000072, 0x00040006,
  0x00000009, 0x00000001, 0x00005655, 0x00030005, 0x0000000b, 0x0074754f,
  0x00040005, 0x0000000f, 0x6c6f4361, 0x0000726f, 0x00030005, 0x00000015,
  0x00565561, 0x00060005, 0x00000019, 0x505f6c67, 0x65567265, 0x78657472,
  0x00000000, 0x00060006, 0x00000019, 0x00000000, 0x505f6c67, 0x7469736f,
  0x006e6f69, 0x00030005, 0x0000001b, 0x00000000, 0x00040005, 0x0000001c,
  0x736f5061, 0x00000000, 0x00060005, 0x0000001e, 0x73755075, 0x6e6f4368,
  0x6e617473, 0x00000074, 0x00050006, 0x0000001e, 0x00000000, 0x61635375,
  0x0000656c, 0x00060006, 0x0000001e, 0x00000001, 0x61725475, 0x616c736e,
  0x00006574, 0x00030005, 0x00000020, 0x00006370, 0x00040047, 0x0000000b,
  0x0000001e, 0x00000000, 0x00040047, 0x0000000f, 0x0000001e, 0x00000002,
  0x00040047, 0x00000015, 0x0000001e, 0x00000001, 0x00050048, 0x00000019,
  0x00000000, 0x0000000b, 0x00000000, 0x00030047, 0x00000019, 0x00000002,
  0x00040047, 0x0000001c, 0x0000001e, 0x00000000, 0x00050048, 0x0000001e,
  0x00000000, 0x00000023, 0x00000000, 0x00050048, 0x0000001e, 0x00000001,
  0x00000023, 0x00000008, 0x00030047, 0x0000001e, 0x00000002, 0x00020013,
  0x00000002, 0x00030021, 0x00000003, 0x00000002, 0x00030016, 0x00000006,
  0x00000020, 0x00040017, 0x00000007, 0x00000006, 0x00000004, 0x00040017,
  0x00000008, 0x00000006, 0x00000002, 0x0004001e, 0x00000009, 0x00000007,
  0x00000008, 0x00040020, 0x0000000a, 0x00000003, 0x00000009, 0x0004003b,
  0x0000000a, 0x0000000b, 0x00000003, 0x00040015, 0x0000000c, 0x00000020,
  0x00000001, 0x0004002b, 0x0000000c, 0x0000000d, 0x00000000, 0x00040020,
  0x0000000e, 0x00000001, 0x00000007, 0x0004003b, 0x0000000e, 0x0000000f,
  0x00000001, 0x00040020, 0x00000011, 0x00000003, 0x00000007, 0x0004002b,
  0x0000000c, 0x00000013, 0x00000001, 0x00040020, 0x00000014, 0x00000001,
  0x00000008, 0x0004003b, 0x00000014, 0x00000015, 0x00000001, 0x00040020,
  0x00000017, 0x00000003, 0x00000008, 0x0003001e, 0x00000019, 0x00000007,
  0x00040020, 0x0000001a, 0x00000003, 0x00000019, 0x0004003b, 0x0000001a,
  0x0000001b, 0x00000003, 0x0004003b, 0x00000014, 0x0000001c, 0x00000001,
  0x0004001e, 0x0000001e, 0x00000008, 0x00000008, 0x00040020, 0x0000001f,
  0x00000009, 0x0000001e, 0x0004003b, 0x0000001f, 0x00000020, 0x00000009,
  0x00040020, 0x00000021, 0x00000009, 0x00000008, 0x0004002b, 0x00000006,
  0x00000028, 0x00000000, 0x0004002b, 0x00000006, 0x00000029, 0x3f800000,
  0x00050036, 0x00000002, 0x00000004, 0x00000000, 0x00000003, 0x000200f8,
  0x00000005, 0x0004003d, 0x00000007, 0x00000010, 0x0000000f, 0x00050041,
  0x00000011, 0x00000012, 0x0000000b, 0x0000000d, 0x0003003e, 0x00000012,
  0x00000010, 0x0004003d, 0x00000008, 0x00000016, 0x00000015, 0x00050041,
  0x00000017, 0x00000018, 0x0000000b, 0x00000013, 0x0003003e, 0x00000018,
  0x00000016, 0x0004003d, 0x00000008, 0x0000001d, 0x0000001c, 0x00050041,
  0x00000021, 0x00000022, 0x00000020, 0x0000000d, 0x0004003d, 0x00000008,
  0x00000023, 0x00000022, 0x00050085, 0x00000008, 0x00000024, 0x0000001d,
  0x00000023, 0x00050041, 0x00000021, 0x00000025, 0x00000020, 0x00000013,
  0x0004003d, 0x00000008, 0x00000026, 0x00000025, 0x00050081, 0x00000008,
  0x00000027, 0x00000024, 0x00000026, 0x00050051, 0x00000006, 0x0000002a,
  0x00000027, 0x00000000, 0x00050051, 0x00000006, 0x0000002b, 0x00000027,
  0x00000001, 0x00070050, 0x00000007, 0x0000002c, 0x0000002a, 0x0000002b,
  0x00000028, 0x00000029, 0x00050041, 0x00000011, 0x0000002d, 0x0000001b,
  0x0000000d, 0x0003003e, 0x0000002d, 0x0000002c, 0x000100fd, 0x00010038
];

uint32_t[] __glsl_shader_frag_spv = [
  0x07230203, 0x00010000, 0x00080001, 0x0000001e, 0x00000000, 0x00020011,
  0x00000001, 0x0006000b, 0x00000001, 0x4c534c47, 0x6474732e, 0x3035342e,
  0x00000000, 0x0003000e, 0x00000000, 0x00000001, 0x0007000f, 0x00000004,
  0x00000004, 0x6e69616d, 0x00000000, 0x00000009, 0x0000000d, 0x00030010,
  0x00000004, 0x00000007, 0x00030003, 0x00000002, 0x000001c2, 0x00040005,
  0x00000004, 0x6e69616d, 0x00000000, 0x00040005, 0x00000009, 0x6c6f4366,
  0x0000726f, 0x00030005, 0x0000000b, 0x00000000, 0x00050006, 0x0000000b,
  0x00000000, 0x6f6c6f43, 0x00000072, 0x00040006, 0x0000000b, 0x00000001,
  0x00005655, 0x00030005, 0x0000000d, 0x00006e49, 0x00050005, 0x00000016,
  0x78655473, 0x65727574, 0x00000000, 0x00040047, 0x00000009, 0x0000001e,
  0x00000000, 0x00040047, 0x0000000d, 0x0000001e, 0x00000000, 0x00040047,
  0x00000016, 0x00000022, 0x00000000, 0x00040047, 0x00000016, 0x00000021,
  0x00000000, 0x00020013, 0x00000002, 0x00030021, 0x00000003, 0x00000002,
  0x00030016, 0x00000006, 0x00000020, 0x00040017, 0x00000007, 0x00000006,
  0x00000004, 0x00040020, 0x00000008, 0x00000003, 0x00000007, 0x0004003b,
  0x00000008, 0x00000009, 0x00000003, 0x00040017, 0x0000000a, 0x00000006,
  0x00000002, 0x0004001e, 0x0000000b, 0x00000007, 0x0000000a, 0x00040020,
  0x0000000c, 0x00000001, 0x0000000b, 0x0004003b, 0x0000000c, 0x0000000d,
  0x00000001, 0x00040015, 0x0000000e, 0x00000020, 0x00000001, 0x0004002b,
  0x0000000e, 0x0000000f, 0x00000000, 0x00040020, 0x00000010, 0x00000001,
  0x00000007, 0x00090019, 0x00000013, 0x00000006, 0x00000001, 0x00000000,
  0x00000000, 0x00000000, 0x00000001, 0x00000000, 0x0003001b, 0x00000014,
  0x00000013, 0x00040020, 0x00000015, 0x00000000, 0x00000014, 0x0004003b,
  0x00000015, 0x00000016, 0x00000000, 0x0004002b, 0x0000000e, 0x00000018,
  0x00000001, 0x00040020, 0x00000019, 0x00000001, 0x0000000a, 0x00050036,
  0x00000002, 0x00000004, 0x00000000, 0x00000003, 0x000200f8, 0x00000005,
  0x00050041, 0x00000010, 0x00000011, 0x0000000d, 0x0000000f, 0x0004003d,
  0x00000007, 0x00000012, 0x00000011, 0x0004003d, 0x00000014, 0x00000017,
  0x00000016, 0x00050041, 0x00000019, 0x0000001a, 0x0000000d, 0x00000018,
  0x0004003d, 0x0000000a, 0x0000001b, 0x0000001a, 0x00050057, 0x00000007,
  0x0000001c, 0x00000017, 0x0000001b, 0x00050085, 0x00000007, 0x0000001d,
  0x00000012, 0x0000001c, 0x0003003e, 0x00000009, 0x0000001d, 0x000100fd,
  0x00010038
];

