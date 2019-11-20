module dtoavkbindings.imgui_impl_vulkan;
// dear imgui: Renderer for Vulkan
// This needs to be used along with a Platform Binding (e.g. GLFW, SDL, Win32, custom..)

// Implemented features:
//  [X] Renderer: Support for large meshes (64k+ vertices) with 16-bits indices.
// Missing features:
//  [ ] Renderer: User texture binding. Changes of ImTextureID aren't supported by this binding! See https://github.com/ocornut/imgui/pull/914

// You can copy and use unmodified imgui_impl_* files in your project. See main.cpp for an example of using this.
// If you are new to dear imgui, read examples/README.txt and read the documentation at the top of imgui.cpp.
// https://github.com/ocornut/imgui

// The aim of imgui_impl_vulkan.h/.cpp is to be usable in your engine without any modification.
// IF YOU FEEL YOU NEED TO MAKE ANY CHANGE TO THIS CODE, please share them and your feedback at https://github.com/ocornut/imgui/

// Important note to the reader who wish to integrate imgui_impl_vulkan.cpp/.h in their own engine/app.
// - Common ImGui_ImplVulkan_XXX functions and structures are used to interface with imgui_impl_vulkan.cpp/.h.
//   You will use those if you want to use this rendering back-end in your engine/app.
// - Helper ImGui_ImplVulkanH_XXX functions and structures are only used by this example (main.cpp) and by
//   the back-end itself (imgui_impl_vulkan.cpp), but should PROBABLY NOT be used by your own engine/app code.
// Read comments in imgui_impl_vulkan.h.

// CHANGELOG
// (minor and older changes stripped away, please see git history for details)
//  2019-08-01: Vulkan: Added support for specifying multisample count. Set ImGui_ImplVulkan_InitInfo::MSAASamples to one of the VkSampleCountFlagBits values to use, default is non-multisampled as before.
//  2019-05-29: Vulkan: Added support for large mesh (64K+ vertices), enable ImGuiBackendFlags_RendererHasVtxOffset flag.
//  2019-04-30: Vulkan: Added support for special ImDrawCallback_ResetRenderState callback to reset render state.
//  2019-04-04: *BREAKING CHANGE*: Vulkan: Added ImageCount/MinImageCount fields in ImGui_ImplVulkan_InitInfo, required for initialization (was previously a hard #define IMGUI_VK_QUEUED_FRAMES 2). Added ImGui_ImplVulkan_SetMinImageCount().
//  2019-04-04: Vulkan: Added VkInstance argument to ImGui_ImplVulkanH_CreateWindow() optional helper.
//  2019-04-04: Vulkan: Avoid passing negative coordinates to vkCmdSetScissor, which debug validation layers do not like.
//  2019-04-01: Vulkan: Support for 32-bit index buffer (#define ImDrawIdx unsigned int).
//  2019-02-16: Vulkan: Viewport and clipping rectangles correctly using
//  draw_data.FramebufferScale to allow retina display.
//  2018-11-30: Misc: Setting up io.BackendRendererName so it can be displayed in the About Window.
//  2018-08-25: Vulkan: Fixed mishandled VkSurfaceCapabilitiesKHR::maxImageCount=0 case.
//  2018-06-22: Inverted the parameters to ImGui_ImplVulkan_RenderDrawData() to be consistent with other bindings.
//  2018-06-08: Misc: Extracted imgui_impl_vulkan.cpp/.h away from the old combined GLFW+Vulkan example.
//  2018-06-08: Vulkan: Use draw_data.DisplayPos and draw_data.DisplaySize to setup projection matrix and clipping rectangle.
//  2018-03-03: Vulkan: Various refactor, created a couple of ImGui_ImplVulkanH_XXX helper that the example can use and that viewport support will use.
//  2018-03-01: Vulkan: Renamed ImGui_ImplVulkan_Init_Info to ImGui_ImplVulkan_InitInfo and fields to match more closely Vulkan terminology.
//  2018-02-16: Misc: Obsoleted the io.RenderDrawListsFn callback, ImGui_ImplVulkan_Render() calls ImGui_ImplVulkan_RenderDrawData() itself.
//  2018-02-06: Misc: Removed call to ImGui::Shutdown() which is not available from 1.60 WIP, user needs to call CreateContext/DestroyContext themselves.
//  2017-05-15: Vulkan: Fix scissor offset being negative. Fix new Vulkan validation warnings. Set required depth member for buffer image copy.
//  2016-11-13: Vulkan: Fix validation layer warnings and errors and redeclare gl_PerVertex.
//  2016-10-18: Vulkan: Add location decorators & change to use structs as in/out in glsl, update embedded spv (produced with glslangValidator -x). Null the released resources.
//  2016-08-27: Vulkan: Fix Vulkan example for use when a depth buffer is active.

import dtoavkbindings.cimgui;
import dtoavkbindings.vk;
import core.stdc.stdint;
import core.stdc.stdlib;
import core.stdc.string;

struct ImGui_ImplVulkan_InitInfo
{
  VkInstance          Instance;
  VkPhysicalDevice    PhysicalDevice;
  VkDevice            Device;
  uint32_t            QueueFamily;
  VkQueue             Queue;
  VkPipelineCache     PipelineCache;
  VkDescriptorPool    DescriptorPool;
  uint32_t            MinImageCount;          // >= 2
  uint32_t            ImageCount;             // >= MinImageCount
  VkSampleCountFlags        MSAASamples;   // >= VK_SAMPLE_COUNT_1_BIT
  const(VkAllocationCallbacks)* Allocator;
  void function(VkResult err) CheckVkResultFn;
}

private alias IM_ALLOC = malloc;

private void IM_ASSERT(bool cond) {
  import core.stdc.stdio;
  if (!cond)
  {
    printf("imgui assertion failed fuck\n");
    exit(0);
  }
}

private struct ImGui_ImplVulkanH_FrameRenderBuffers
{
    VkDeviceMemory      VertexBufferMemory;
    VkDeviceMemory      IndexBufferMemory;
    VkDeviceSize        VertexBufferSize;
    VkDeviceSize        IndexBufferSize;
    VkBuffer            VertexBuffer;
    VkBuffer            IndexBuffer;
}

private struct ImGui_ImplVulkanH_WindowRenderBuffers
{
  uint32_t Index;
  uint32_t Count;
  ImGui_ImplVulkanH_FrameRenderBuffers* FrameRenderBuffers;
}

// Vulkan data
private static ImGui_ImplVulkan_InitInfo g_VulkanInitInfo = {};
private static VkRenderPass             g_RenderPass = null;
private static VkDeviceSize             g_BufferMemoryAlignment = 256;
private static VkPipelineCreateFlags    g_PipelineCreateFlags = 0x00;
private static VkDescriptorSetLayout    g_DescriptorSetLayout = null;
private static VkPipelineLayout         g_PipelineLayout = null;
private static VkDescriptorSet          g_DescriptorSet = null;
private static VkPipeline               g_Pipeline = null;

// Font data
private static VkSampler                g_FontSampler = null;
private static VkDeviceMemory           g_FontMemory = null;
private static VkImage                  g_FontImage = null;
private static VkImageView              g_FontView = null;
private static VkDeviceMemory           g_UploadBufferMemory = null;
private static VkBuffer                 g_UploadBuffer = null;

// Render buffers
private static ImGui_ImplVulkanH_WindowRenderBuffers g_MainWindowRenderBuffers;

// Forward Declarations
bool ImGui_ImplVulkan_CreateDeviceObjects();
void ImGui_ImplVulkan_DestroyDeviceObjects();

//-----------------------------------------------------------------------------
// SHADERS
//-----------------------------------------------------------------------------

// glsl_shader.vert, compiled with:
// # glslangValidator -V -x -o glsl_shader.vert.u32 glsl_shader.vert
/*
#version 450 core
layout(location = 0) in vec2 aPos;
layout(location = 1) in vec2 aUV;
layout(location = 2) in vec4 aColor;
layout(push_constant) uniform uPushConstant { vec2 uScale; vec2 uTranslate; } pc;

out gl_PerVertex { vec4 gl_Position; };
layout(location = 0) out struct { vec4 Color; vec2 UV; } Out;

void main()
{
    Out.Color = aColor;
    Out.UV = aUV;
    gl_Position = vec4(aPos * pc.uScale + pc.uTranslate, 0, 1);
}
*/
static uint32_t[] __glsl_shader_vert_spv =
[
    0x07230203,0x00010000,0x00080001,0x0000002e,0x00000000,0x00020011,0x00000001,0x0006000b,
    0x00000001,0x4c534c47,0x6474732e,0x3035342e,0x00000000,0x0003000e,0x00000000,0x00000001,
    0x000a000f,0x00000000,0x00000004,0x6e69616d,0x00000000,0x0000000b,0x0000000f,0x00000015,
    0x0000001b,0x0000001c,0x00030003,0x00000002,0x000001c2,0x00040005,0x00000004,0x6e69616d,
    0x00000000,0x00030005,0x00000009,0x00000000,0x00050006,0x00000009,0x00000000,0x6f6c6f43,
    0x00000072,0x00040006,0x00000009,0x00000001,0x00005655,0x00030005,0x0000000b,0x0074754f,
    0x00040005,0x0000000f,0x6c6f4361,0x0000726f,0x00030005,0x00000015,0x00565561,0x00060005,
    0x00000019,0x505f6c67,0x65567265,0x78657472,0x00000000,0x00060006,0x00000019,0x00000000,
    0x505f6c67,0x7469736f,0x006e6f69,0x00030005,0x0000001b,0x00000000,0x00040005,0x0000001c,
    0x736f5061,0x00000000,0x00060005,0x0000001e,0x73755075,0x6e6f4368,0x6e617473,0x00000074,
    0x00050006,0x0000001e,0x00000000,0x61635375,0x0000656c,0x00060006,0x0000001e,0x00000001,
    0x61725475,0x616c736e,0x00006574,0x00030005,0x00000020,0x00006370,0x00040047,0x0000000b,
    0x0000001e,0x00000000,0x00040047,0x0000000f,0x0000001e,0x00000002,0x00040047,0x00000015,
    0x0000001e,0x00000001,0x00050048,0x00000019,0x00000000,0x0000000b,0x00000000,0x00030047,
    0x00000019,0x00000002,0x00040047,0x0000001c,0x0000001e,0x00000000,0x00050048,0x0000001e,
    0x00000000,0x00000023,0x00000000,0x00050048,0x0000001e,0x00000001,0x00000023,0x00000008,
    0x00030047,0x0000001e,0x00000002,0x00020013,0x00000002,0x00030021,0x00000003,0x00000002,
    0x00030016,0x00000006,0x00000020,0x00040017,0x00000007,0x00000006,0x00000004,0x00040017,
    0x00000008,0x00000006,0x00000002,0x0004001e,0x00000009,0x00000007,0x00000008,0x00040020,
    0x0000000a,0x00000003,0x00000009,0x0004003b,0x0000000a,0x0000000b,0x00000003,0x00040015,
    0x0000000c,0x00000020,0x00000001,0x0004002b,0x0000000c,0x0000000d,0x00000000,0x00040020,
    0x0000000e,0x00000001,0x00000007,0x0004003b,0x0000000e,0x0000000f,0x00000001,0x00040020,
    0x00000011,0x00000003,0x00000007,0x0004002b,0x0000000c,0x00000013,0x00000001,0x00040020,
    0x00000014,0x00000001,0x00000008,0x0004003b,0x00000014,0x00000015,0x00000001,0x00040020,
    0x00000017,0x00000003,0x00000008,0x0003001e,0x00000019,0x00000007,0x00040020,0x0000001a,
    0x00000003,0x00000019,0x0004003b,0x0000001a,0x0000001b,0x00000003,0x0004003b,0x00000014,
    0x0000001c,0x00000001,0x0004001e,0x0000001e,0x00000008,0x00000008,0x00040020,0x0000001f,
    0x00000009,0x0000001e,0x0004003b,0x0000001f,0x00000020,0x00000009,0x00040020,0x00000021,
    0x00000009,0x00000008,0x0004002b,0x00000006,0x00000028,0x00000000,0x0004002b,0x00000006,
    0x00000029,0x3f800000,0x00050036,0x00000002,0x00000004,0x00000000,0x00000003,0x000200f8,
    0x00000005,0x0004003d,0x00000007,0x00000010,0x0000000f,0x00050041,0x00000011,0x00000012,
    0x0000000b,0x0000000d,0x0003003e,0x00000012,0x00000010,0x0004003d,0x00000008,0x00000016,
    0x00000015,0x00050041,0x00000017,0x00000018,0x0000000b,0x00000013,0x0003003e,0x00000018,
    0x00000016,0x0004003d,0x00000008,0x0000001d,0x0000001c,0x00050041,0x00000021,0x00000022,
    0x00000020,0x0000000d,0x0004003d,0x00000008,0x00000023,0x00000022,0x00050085,0x00000008,
    0x00000024,0x0000001d,0x00000023,0x00050041,0x00000021,0x00000025,0x00000020,0x00000013,
    0x0004003d,0x00000008,0x00000026,0x00000025,0x00050081,0x00000008,0x00000027,0x00000024,
    0x00000026,0x00050051,0x00000006,0x0000002a,0x00000027,0x00000000,0x00050051,0x00000006,
    0x0000002b,0x00000027,0x00000001,0x00070050,0x00000007,0x0000002c,0x0000002a,0x0000002b,
    0x00000028,0x00000029,0x00050041,0x00000011,0x0000002d,0x0000001b,0x0000000d,0x0003003e,
    0x0000002d,0x0000002c,0x000100fd,0x00010038
];

// glsl_shader.frag, compiled with:
// # glslangValidator -V -x -o glsl_shader.frag.u32 glsl_shader.frag
/*
#version 450 core
layout(location = 0) out vec4 fColor;
layout(set=0, binding=0) uniform sampler2D sTexture;
layout(location = 0) in struct { vec4 Color; vec2 UV; } In;
void main()
{
    fColor = In.Color * texture(sTexture, In.UV.st);
}
*/
static uint32_t[] __glsl_shader_frag_spv =
[
    0x07230203,0x00010000,0x00080001,0x0000001e,0x00000000,0x00020011,0x00000001,0x0006000b,
    0x00000001,0x4c534c47,0x6474732e,0x3035342e,0x00000000,0x0003000e,0x00000000,0x00000001,
    0x0007000f,0x00000004,0x00000004,0x6e69616d,0x00000000,0x00000009,0x0000000d,0x00030010,
    0x00000004,0x00000007,0x00030003,0x00000002,0x000001c2,0x00040005,0x00000004,0x6e69616d,
    0x00000000,0x00040005,0x00000009,0x6c6f4366,0x0000726f,0x00030005,0x0000000b,0x00000000,
    0x00050006,0x0000000b,0x00000000,0x6f6c6f43,0x00000072,0x00040006,0x0000000b,0x00000001,
    0x00005655,0x00030005,0x0000000d,0x00006e49,0x00050005,0x00000016,0x78655473,0x65727574,
    0x00000000,0x00040047,0x00000009,0x0000001e,0x00000000,0x00040047,0x0000000d,0x0000001e,
    0x00000000,0x00040047,0x00000016,0x00000022,0x00000000,0x00040047,0x00000016,0x00000021,
    0x00000000,0x00020013,0x00000002,0x00030021,0x00000003,0x00000002,0x00030016,0x00000006,
    0x00000020,0x00040017,0x00000007,0x00000006,0x00000004,0x00040020,0x00000008,0x00000003,
    0x00000007,0x0004003b,0x00000008,0x00000009,0x00000003,0x00040017,0x0000000a,0x00000006,
    0x00000002,0x0004001e,0x0000000b,0x00000007,0x0000000a,0x00040020,0x0000000c,0x00000001,
    0x0000000b,0x0004003b,0x0000000c,0x0000000d,0x00000001,0x00040015,0x0000000e,0x00000020,
    0x00000001,0x0004002b,0x0000000e,0x0000000f,0x00000000,0x00040020,0x00000010,0x00000001,
    0x00000007,0x00090019,0x00000013,0x00000006,0x00000001,0x00000000,0x00000000,0x00000000,
    0x00000001,0x00000000,0x0003001b,0x00000014,0x00000013,0x00040020,0x00000015,0x00000000,
    0x00000014,0x0004003b,0x00000015,0x00000016,0x00000000,0x0004002b,0x0000000e,0x00000018,
    0x00000001,0x00040020,0x00000019,0x00000001,0x0000000a,0x00050036,0x00000002,0x00000004,
    0x00000000,0x00000003,0x000200f8,0x00000005,0x00050041,0x00000010,0x00000011,0x0000000d,
    0x0000000f,0x0004003d,0x00000007,0x00000012,0x00000011,0x0004003d,0x00000014,0x00000017,
    0x00000016,0x00050041,0x00000019,0x0000001a,0x0000000d,0x00000018,0x0004003d,0x0000000a,
    0x0000001b,0x0000001a,0x00050057,0x00000007,0x0000001c,0x00000017,0x0000001b,0x00050085,
    0x00000007,0x0000001d,0x00000012,0x0000001c,0x0003003e,0x00000009,0x0000001d,0x000100fd,
    0x00010038
];

//-----------------------------------------------------------------------------
// FUNCTIONS
//-----------------------------------------------------------------------------

static uint32_t ImGui_ImplVulkan_MemoryType(VkMemoryPropertyFlags properties, uint32_t type_bits)
{
    ImGui_ImplVulkan_InitInfo* v = &g_VulkanInitInfo;
    VkPhysicalDeviceMemoryProperties prop;
    vkGetPhysicalDeviceMemoryProperties(v.PhysicalDevice, &prop);
    for (uint32_t i = 0; i < prop.memoryTypeCount; i++)
        if ((prop.memoryTypes[i].propertyFlags & properties) == properties && type_bits & (1<<i))
            return i;
    return 0xFFFFFFFF; // Unable to find memoryType
}

static void check_vk_result(VkResult err)
{
    ImGui_ImplVulkan_InitInfo* v = &g_VulkanInitInfo;
    if (v.CheckVkResultFn)
        v.CheckVkResultFn(err);
}

static void CreateOrResizeBuffer(ref VkBuffer buffer, ref VkDeviceMemory buffer_memory, ref VkDeviceSize p_buffer_size, size_t new_size, VkBufferUsageFlags usage)
{
    ImGui_ImplVulkan_InitInfo* v = &g_VulkanInitInfo;
    VkResult err;
    if (buffer != null)
        vkDestroyBuffer(v.Device, buffer, v.Allocator);
    if (buffer_memory != null)
        vkFreeMemory(v.Device, buffer_memory, v.Allocator);

    VkDeviceSize vertex_buffer_size_aligned = ((new_size - 1) / g_BufferMemoryAlignment + 1) * g_BufferMemoryAlignment;
    VkBufferCreateInfo buffer_info = {};
    buffer_info.sType = VkStructureType.bufferCreateInfo;
    buffer_info.size = vertex_buffer_size_aligned;
    buffer_info.usage = usage;
    buffer_info.sharingMode = VkSharingMode.exclusive;
    err = vkCreateBuffer(v.Device, &buffer_info, v.Allocator, &buffer);
    check_vk_result(err);

    VkMemoryRequirements req;
    vkGetBufferMemoryRequirements(v.Device, buffer, &req);
    g_BufferMemoryAlignment = (g_BufferMemoryAlignment > req.alignment) ? g_BufferMemoryAlignment : req.alignment;
    VkMemoryAllocateInfo alloc_info = {};
    alloc_info.sType = VkStructureType.memoryAllocateInfo;
    alloc_info.allocationSize = req.size;
    alloc_info.memoryTypeIndex = ImGui_ImplVulkan_MemoryType(VkMemoryPropertyFlag.hostVisibleBit, req.memoryTypeBits);
    err = vkAllocateMemory(v.Device, &alloc_info, v.Allocator, &buffer_memory);
    check_vk_result(err);

    err = vkBindBufferMemory(v.Device, buffer, buffer_memory, 0);
    check_vk_result(err);
    p_buffer_size = new_size;
}

static void ImGui_ImplVulkan_SetupRenderState(ImDrawData* draw_data, VkCommandBuffer command_buffer, ImGui_ImplVulkanH_FrameRenderBuffers* rb, int fb_width, int fb_height)
{
    // Bind pipeline and descriptor sets:
    {
        vkCmdBindPipeline(command_buffer, VkPipelineBindPoint.graphics, g_Pipeline);
        VkDescriptorSet desc_set = g_DescriptorSet;
        vkCmdBindDescriptorSets(command_buffer, VkPipelineBindPoint.graphics, g_PipelineLayout, 0, 1, &desc_set, 0, null);
    }

    // Bind Vertex And Index Buffer:
    {
        VkBuffer vertex_buffers = rb.VertexBuffer;
        VkDeviceSize vertex_offset = 0;
        vkCmdBindVertexBuffers(command_buffer, 0, 1, &vertex_buffers, &vertex_offset);
        vkCmdBindIndexBuffer(command_buffer, rb.IndexBuffer, 0, ImDrawIdx.sizeof == 2 ? VkIndexType.uint16 : VkIndexType.uint32);
    }

    // Setup viewport:
    {
        VkViewport viewport;
        viewport.x = 0;
        viewport.y = 0;
        viewport.width = cast(float)fb_width;
        viewport.height = cast(float)fb_height;
        viewport.minDepth = 0.0f;
        viewport.maxDepth = 1.0f;
        vkCmdSetViewport(command_buffer, 0, 1, &viewport);
    }

    // Setup scale and translation:
    // Our visible imgui space lies from draw_data.DisplayPps (top left) to
    // draw_data.DisplayPos+data_data.DisplaySize (bottom right). DisplayPos is (0,0) for single viewport apps.
    {
        static float[2] scale;
        scale[0] = 2.0f / draw_data.DisplaySize.x;
        scale[1] = 2.0f / draw_data.DisplaySize.y;
        static float[2] translate;
        translate[0] = -1.0f - draw_data.DisplayPos.x * scale[0];
        translate[1] = -1.0f - draw_data.DisplayPos.y * scale[1];
        vkCmdPushConstants(command_buffer, g_PipelineLayout, VkShaderStageFlag.vertexBit, float.sizeof * 0, float.sizeof * 2, scale.ptr);
        vkCmdPushConstants(command_buffer, g_PipelineLayout, VkShaderStageFlag.vertexBit, float.sizeof * 2, float.sizeof * 2, translate.ptr);
    }
}

// Render function
// (this used to be set in io.RenderDrawListsFn and called by ImGui::Render(), but you can now call this directly from your main loop)
void ImGui_ImplVulkan_RenderDrawData(ImDrawData* draw_data, VkCommandBuffer command_buffer)
{
    // Avoid rendering when minimized, scale coordinates for retina displays (screen coordinates != framebuffer coordinates)
    int fb_width = cast(int)(draw_data.DisplaySize.x * draw_data.FramebufferScale.x);
    int fb_height = cast(int)(draw_data.DisplaySize.y * draw_data.FramebufferScale.y);
    if (fb_width <= 0 || fb_height <= 0 || draw_data.TotalVtxCount == 0)
        return;

    ImGui_ImplVulkan_InitInfo* v = &g_VulkanInitInfo;

    // Allocate array to store enough vertex/index buffers
    ImGui_ImplVulkanH_WindowRenderBuffers* wrb = &g_MainWindowRenderBuffers;
    if (wrb.FrameRenderBuffers == null)
    {
        wrb.Index = 0;
        wrb.Count = v.ImageCount;
        wrb.FrameRenderBuffers = cast(ImGui_ImplVulkanH_FrameRenderBuffers*)IM_ALLOC(ImGui_ImplVulkanH_FrameRenderBuffers.sizeof * wrb.Count);
        memset(wrb.FrameRenderBuffers, 0, ImGui_ImplVulkanH_FrameRenderBuffers.sizeof * wrb.Count);
    }
    IM_ASSERT(wrb.Count == v.ImageCount);
    wrb.Index = (wrb.Index + 1) % wrb.Count;
    ImGui_ImplVulkanH_FrameRenderBuffers* rb = &wrb.FrameRenderBuffers[wrb.Index];

    VkResult err;

    // Create or resize the vertex/index buffers
    size_t vertex_size = draw_data.TotalVtxCount * ImDrawVert.sizeof;
    size_t index_size = draw_data.TotalIdxCount * ImDrawIdx.sizeof;
    if (rb.VertexBuffer == null || rb.VertexBufferSize < vertex_size)
        CreateOrResizeBuffer(rb.VertexBuffer, rb.VertexBufferMemory, rb.VertexBufferSize, vertex_size, VkBufferUsageFlag.vertexBufferBit);
    if (rb.IndexBuffer == null || rb.IndexBufferSize < index_size)
        CreateOrResizeBuffer(rb.IndexBuffer, rb.IndexBufferMemory, rb.IndexBufferSize, index_size, VkBufferUsageFlag.indexBufferBit);

    // Upload vertex/index data into a single contiguous GPU buffer
    {
        ImDrawVert* vtx_dst = null;
        ImDrawIdx* idx_dst = null;
        err = vkMapMemory(v.Device, rb.VertexBufferMemory, 0, vertex_size, 0, cast(void**)(&vtx_dst));
        check_vk_result(err);
        err = vkMapMemory(v.Device, rb.IndexBufferMemory, 0, index_size, 0, cast(void**)(&idx_dst));
        check_vk_result(err);
        for (int n = 0; n < draw_data.CmdListsCount; n++)
        {
            const ImDrawList* cmd_list = draw_data.CmdLists[n];
            memcpy(vtx_dst, cmd_list.VtxBuffer.Data, cmd_list.VtxBuffer.Size * ImDrawVert.sizeof);
            memcpy(idx_dst, cmd_list.IdxBuffer.Data, cmd_list.IdxBuffer.Size * ImDrawIdx.sizeof);
            vtx_dst += cmd_list.VtxBuffer.Size;
            idx_dst += cmd_list.IdxBuffer.Size;
        }
        VkMappedMemoryRange[2] range = {};
        range[0].sType = VkStructureType.mappedMemoryRange;
        range[0].memory = rb.VertexBufferMemory;
        range[0].size = VK_WHOLE_SIZE;
        range[1].sType = VkStructureType.mappedMemoryRange;
        range[1].memory = rb.IndexBufferMemory;
        range[1].size = VK_WHOLE_SIZE;
        err = vkFlushMappedMemoryRanges(v.Device, 2, range.ptr);
        check_vk_result(err);
        vkUnmapMemory(v.Device, rb.VertexBufferMemory);
        vkUnmapMemory(v.Device, rb.IndexBufferMemory);
    }

    // Setup desired Vulkan state
    ImGui_ImplVulkan_SetupRenderState(draw_data, command_buffer, rb, fb_width, fb_height);

    // Will project scissor/clipping rectangles into framebuffer space
    ImVec2 clip_off = draw_data.DisplayPos;         // (0,0) unless using multi-viewports
    ImVec2 clip_scale = draw_data.FramebufferScale; // (1,1) unless using retina display which are often (2,2)

    // Render command lists
    // (Because we merged all buffers into a single one, we maintain our own offset into them)
    int global_vtx_offset = 0;
    int global_idx_offset = 0;
    for (int n = 0; n < draw_data.CmdListsCount; n++)
    {
        const ImDrawList* cmd_list = draw_data.CmdLists[n];
        for (int cmd_i = 0; cmd_i < cmd_list.CmdBuffer.Size; cmd_i++)
        {
            const ImDrawCmd* pcmd = cmd_list.CmdBuffer.Data + cmd_i;
            if (pcmd.UserCallback != null)
            {
                // User callback, registered via ImDrawList::AddCallback()
                // (ImDrawCallback_ResetRenderState is a special callback value used by the user to request the renderer to reset render state.)
                if (pcmd.UserCallback == ImDrawCallback_ResetRenderState)
                    ImGui_ImplVulkan_SetupRenderState(draw_data, command_buffer, rb, fb_width, fb_height);
                else
                    pcmd.UserCallback(cmd_list, pcmd);
            }
            else
            {
                // Project scissor/clipping rectangles into framebuffer space
                ImVec4 clip_rect;
                clip_rect.x = (pcmd.ClipRect.x - clip_off.x) * clip_scale.x;
                clip_rect.y = (pcmd.ClipRect.y - clip_off.y) * clip_scale.y;
                clip_rect.z = (pcmd.ClipRect.z - clip_off.x) * clip_scale.x;
                clip_rect.w = (pcmd.ClipRect.w - clip_off.y) * clip_scale.y;

                if (clip_rect.x < fb_width && clip_rect.y < fb_height && clip_rect.z >= 0.0f && clip_rect.w >= 0.0f)
                {
                    // Negative offsets are illegal for vkCmdSetScissor
                    if (clip_rect.x < 0.0f)
                        clip_rect.x = 0.0f;
                    if (clip_rect.y < 0.0f)
                        clip_rect.y = 0.0f;

                    // Apply scissor/clipping rectangle
                    VkRect2D scissor;
                    scissor.offset.x = cast(int32_t)(clip_rect.x);
                    scissor.offset.y = cast(int32_t)(clip_rect.y);
                    scissor.extent.width = cast(uint32_t)(clip_rect.z - clip_rect.x);
                    scissor.extent.height = cast(uint32_t)(clip_rect.w - clip_rect.y);
                    vkCmdSetScissor(command_buffer, 0, 1, &scissor);

                    // Draw
                    vkCmdDrawIndexed(command_buffer, pcmd.ElemCount, 1, pcmd.IdxOffset + global_idx_offset, pcmd.VtxOffset + global_vtx_offset, 0);
                }
            }
        }
        global_idx_offset += cmd_list.IdxBuffer.Size;
        global_vtx_offset += cmd_list.VtxBuffer.Size;
    }
}

bool ImGui_ImplVulkan_CreateFontsTexture(VkCommandBuffer command_buffer)
{
    ImGui_ImplVulkan_InitInfo* v = &g_VulkanInitInfo;
    auto io = igGetIO;

    ubyte* pixels;
    int width, height;
    int bpp;
    ImFontAtlas_GetTexDataAsRGBA32(io.Fonts, &pixels, &width, &height, &bpp);
    size_t upload_size = width*height*4*ubyte.sizeof;

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
        err = vkCreateImage(v.Device, &info, v.Allocator, &g_FontImage);
        check_vk_result(err);
        VkMemoryRequirements req;
        vkGetImageMemoryRequirements(v.Device, g_FontImage, &req);
        VkMemoryAllocateInfo alloc_info = {};
        alloc_info.sType = VkStructureType.memoryAllocateInfo;
        alloc_info.allocationSize = req.size;
        alloc_info.memoryTypeIndex = ImGui_ImplVulkan_MemoryType(VkMemoryPropertyFlag.deviceLocalBit, req.memoryTypeBits);
        err = vkAllocateMemory(v.Device, &alloc_info, v.Allocator, &g_FontMemory);
        check_vk_result(err);
        err = vkBindImageMemory(v.Device, g_FontImage, g_FontMemory, 0);
        check_vk_result(err);
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
        err = vkCreateImageView(v.Device, &info, v.Allocator, &g_FontView);
        check_vk_result(err);
    }

    // Update the Descriptor Set:
    {
        VkDescriptorImageInfo[1] desc_image = {};
        desc_image[0].sampler = g_FontSampler;
        desc_image[0].imageView = g_FontView;
        desc_image[0].imageLayout = VkImageLayout.shaderReadOnlyOptimal;
        VkWriteDescriptorSet[1] write_desc = {};
        write_desc[0].sType = VkStructureType.writeDescriptorSet;
        write_desc[0].dstSet = g_DescriptorSet;
        write_desc[0].descriptorCount = 1;
        write_desc[0].descriptorType = VkDescriptorType.combinedImageSampler;
        write_desc[0].pImageInfo = desc_image.ptr;
        vkUpdateDescriptorSets(v.Device, 1, write_desc.ptr, 0, null);
    }

    // Create the Upload Buffer:
    {
        VkBufferCreateInfo buffer_info = {};
        buffer_info.sType = VkStructureType.bufferCreateInfo;
        buffer_info.size = upload_size;
        buffer_info.usage = VkBufferUsageFlag.transferSrcBit;
        buffer_info.sharingMode = VkSharingMode.exclusive;
        err = vkCreateBuffer(v.Device, &buffer_info, v.Allocator, &g_UploadBuffer);
        check_vk_result(err);
        VkMemoryRequirements req;
        vkGetBufferMemoryRequirements(v.Device, g_UploadBuffer, &req);
        g_BufferMemoryAlignment = (g_BufferMemoryAlignment > req.alignment) ? g_BufferMemoryAlignment : req.alignment;
        VkMemoryAllocateInfo alloc_info = {};
        alloc_info.sType = VkStructureType.memoryAllocateInfo;
        alloc_info.allocationSize = req.size;
        alloc_info.memoryTypeIndex = ImGui_ImplVulkan_MemoryType(VkMemoryPropertyFlag.hostVisibleBit, req.memoryTypeBits);
        err = vkAllocateMemory(v.Device, &alloc_info, v.Allocator, &g_UploadBufferMemory);
        check_vk_result(err);
        err = vkBindBufferMemory(v.Device, g_UploadBuffer, g_UploadBufferMemory, 0);
        check_vk_result(err);
    }

    // Upload to Buffer:
    {
        char* map = null;
        err = vkMapMemory(v.Device, g_UploadBufferMemory, 0, upload_size, 0, cast(void**)(&map));
        check_vk_result(err);
        memcpy(map, pixels, upload_size);
        VkMappedMemoryRange[1] range = {};
        range[0].sType = VkStructureType.mappedMemoryRange;
        range[0].memory = g_UploadBufferMemory;
        range[0].size = upload_size;
        err = vkFlushMappedMemoryRanges(v.Device, 1, range.ptr);
        check_vk_result(err);
        vkUnmapMemory(v.Device, g_UploadBufferMemory);
    }

    // Copy to Image:
    {
        VkImageMemoryBarrier[1] copy_barrier = {};
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

        VkImageMemoryBarrier[1] use_barrier = {};
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
    io.Fonts.TexID = cast(ImTextureID)cast(intptr_t)g_FontImage;

    return true;
}

bool ImGui_ImplVulkan_CreateDeviceObjects()
{
    ImGui_ImplVulkan_InitInfo* v = &g_VulkanInitInfo;
    VkResult err;
    VkShaderModule vert_module;
    VkShaderModule frag_module;

    // Create The Shader Modules:
    {
        VkShaderModuleCreateInfo vert_info = {};
        vert_info.sType = VkStructureType.shaderModuleCreateInfo;
        vert_info.codeSize =
          __glsl_shader_vert_spv.length * uint32_t.sizeof;
        vert_info.pCode = cast(uint32_t*)__glsl_shader_vert_spv;
        err = vkCreateShaderModule(v.Device, &vert_info, v.Allocator, &vert_module);
        check_vk_result(err);
        VkShaderModuleCreateInfo frag_info = {};
        frag_info.sType = VkStructureType.shaderModuleCreateInfo;
        frag_info.codeSize = __glsl_shader_frag_spv.length * uint32_t.sizeof;
        frag_info.pCode = cast(uint32_t*)__glsl_shader_frag_spv;
        err = vkCreateShaderModule(v.Device, &frag_info, v.Allocator, &frag_module);
        check_vk_result(err);
    }

    if (!g_FontSampler)
    {
        VkSamplerCreateInfo info = {};
        info.sType = VkStructureType.samplerCreateInfo;
        info.magFilter = VkFilter.linear;
        info.minFilter = VkFilter.linear;
        info.mipmapMode =  VkSamplerMipmapMode.linear;
        info.addressModeU = VkSamplerAddressMode.repeat;
        info.addressModeV = VkSamplerAddressMode.repeat;
        info.addressModeW = VkSamplerAddressMode.repeat;
        info.minLod = -1000;
        info.maxLod = 1000;
        info.maxAnisotropy = 1.0f;
        err = vkCreateSampler(v.Device, &info, v.Allocator, &g_FontSampler);
        check_vk_result(err);
    }

    if (!g_DescriptorSetLayout)
    {
        VkSampler[1] sampler = [g_FontSampler];
        VkDescriptorSetLayoutBinding[1] binding = {};
        binding[0].descriptorType = VkDescriptorType.combinedImageSampler;
        binding[0].descriptorCount = 1;
        binding[0].stageFlags = VkShaderStageFlag.fragmentBit;
        binding[0].pImmutableSamplers = sampler.ptr;
        VkDescriptorSetLayoutCreateInfo info = {};
        info.sType = VkStructureType.descriptorSetLayoutCreateInfo;
        info.bindingCount = 1;
        info.pBindings = binding.ptr;
        err = vkCreateDescriptorSetLayout(v.Device, &info, v.Allocator, &g_DescriptorSetLayout);
        check_vk_result(err);
    }

    // Create Descriptor Set:
    {
        VkDescriptorSetAllocateInfo alloc_info = {};
        alloc_info.sType = VkStructureType.descriptorSetAllocateInfo;
        alloc_info.descriptorPool = v.DescriptorPool;
        alloc_info.descriptorSetCount = 1;
        alloc_info.pSetLayouts = &g_DescriptorSetLayout;
        err = vkAllocateDescriptorSets(v.Device, &alloc_info, &g_DescriptorSet);
        check_vk_result(err);
    }

    if (!g_PipelineLayout)
    {
        // Constants: we are using 'vec2 offset' and 'vec2 scale' instead of a full 3d projection matrix
        VkPushConstantRange[1] push_constants = {};
        push_constants[0].stageFlags = VkShaderStageFlag.vertexBit;
        push_constants[0].offset = float.sizeof * 0;
        push_constants[0].size = float.sizeof * 4;
        VkDescriptorSetLayout[1] set_layout = [ g_DescriptorSetLayout ];
        VkPipelineLayoutCreateInfo layout_info = {};
        layout_info.sType = VkStructureType.pipelineLayoutCreateInfo;
        layout_info.setLayoutCount = 1;
        layout_info.pSetLayouts = set_layout.ptr;
        layout_info.pushConstantRangeCount = 1;
        layout_info.pPushConstantRanges = push_constants.ptr;
        err = vkCreatePipelineLayout(v.Device, &layout_info, v.Allocator, &g_PipelineLayout);
        check_vk_result(err);
    }

    VkPipelineShaderStageCreateInfo[2] stage = {};
    stage[0].sType = VkStructureType.pipelineShaderStageCreateInfo;
    stage[0].stage = VkShaderStageFlag.vertexBit;
    stage[0].module_ = vert_module;
    stage[0].pName = "main";
    stage[1].sType = VkStructureType.pipelineShaderStageCreateInfo;
    stage[1].stage = VkShaderStageFlag.fragmentBit;
    stage[1].module_ = frag_module;
    stage[1].pName = "main";

    VkVertexInputBindingDescription[1] binding_desc = {};
    binding_desc[0].stride = ImDrawVert.sizeof;
    binding_desc[0].inputRate = VkVertexInputRate.vertex;

    VkVertexInputAttributeDescription[3] attribute_desc = {};
    attribute_desc[0].location = 0;
    attribute_desc[0].binding = binding_desc[0].binding;
    attribute_desc[0].format = VkFormat.r32g32Sfloat;
    attribute_desc[0].offset = ImDrawVert.pos.offsetof;
    attribute_desc[1].location = 1;
    attribute_desc[1].binding = binding_desc[0].binding;
    attribute_desc[1].format = VkFormat.r32g32Sfloat;
    attribute_desc[1].offset = ImDrawVert.uv.offsetof;
    attribute_desc[2].location = 2;
    attribute_desc[2].binding = binding_desc[0].binding;
    attribute_desc[2].format = VkFormat.r8g8b8a8Unorm;
    attribute_desc[2].offset = ImDrawVert.col.offsetof;

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
    if (v.MSAASamples != 0)
        ms_info.rasterizationSamples = cast(VkSampleCountFlag)v.MSAASamples;
    else
        ms_info.rasterizationSamples = VkSampleCountFlag.i1Bit;

    VkPipelineColorBlendAttachmentState[1] color_attachment = {};
    color_attachment[0].blendEnable = VK_TRUE;
    color_attachment[0].srcColorBlendFactor = VkBlendFactor.srcAlpha;
    color_attachment[0].dstColorBlendFactor = VkBlendFactor.oneMinusSrcAlpha;
    color_attachment[0].colorBlendOp = VkBlendOp.add;
    color_attachment[0].srcAlphaBlendFactor = VkBlendFactor.oneMinusSrcAlpha;
    color_attachment[0].dstAlphaBlendFactor = VkBlendFactor.zero;
    color_attachment[0].alphaBlendOp = VkBlendOp.add;
    color_attachment[0].colorWriteMask =
        VkColorComponentFlag.rBit
      | VkColorComponentFlag.gBit
      | VkColorComponentFlag.bBit
      | VkColorComponentFlag.aBit;

    VkPipelineDepthStencilStateCreateInfo depth_info = {};
    depth_info.sType = VkStructureType.pipelineDepthStencilStateCreateInfo;

    VkPipelineColorBlendStateCreateInfo blend_info = {};
    blend_info.sType = VkStructureType.pipelineColorBlendStateCreateInfo;
    blend_info.attachmentCount = 1;
    blend_info.pAttachments = color_attachment.ptr;

    VkDynamicState[2] dynamic_states = [ VkDynamicState.viewport, VkDynamicState.scissor ];
    VkPipelineDynamicStateCreateInfo dynamic_state = {};
    dynamic_state.sType = VkStructureType.pipelineDynamicStateCreateInfo;
    dynamic_state.dynamicStateCount = cast(uint32_t)(dynamic_states.length);
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
    err = vkCreateGraphicsPipelines(v.Device, v.PipelineCache, 1, &info, v.Allocator, &g_Pipeline);
    check_vk_result(err);

    vkDestroyShaderModule(v.Device, vert_module, v.Allocator);
    vkDestroyShaderModule(v.Device, frag_module, v.Allocator);

    return true;
}

void    ImGui_ImplVulkan_DestroyFontUploadObjects()
{
    ImGui_ImplVulkan_InitInfo* v = &g_VulkanInitInfo;
    if (g_UploadBuffer)
    {
        vkDestroyBuffer(v.Device, g_UploadBuffer, v.Allocator);
        g_UploadBuffer = null;
    }
    if (g_UploadBufferMemory)
    {
        vkFreeMemory(v.Device, g_UploadBufferMemory, v.Allocator);
        g_UploadBufferMemory = null;
    }
}

void    ImGui_ImplVulkan_DestroyDeviceObjects()
{
    ImGui_ImplVulkan_InitInfo* v = &g_VulkanInitInfo;
    // ImGui_ImplVulkanH_DestroyWindowRenderBuffers(v.Device, &g_MainWindowRenderBuffers, v.Allocator); -----------------------------------------------------
    ImGui_ImplVulkan_DestroyFontUploadObjects();

    if (g_FontView)             { vkDestroyImageView(v.Device, g_FontView, v.Allocator); g_FontView = null; }
    if (g_FontImage)            { vkDestroyImage(v.Device, g_FontImage, v.Allocator); g_FontImage = null; }
    if (g_FontMemory)           { vkFreeMemory(v.Device, g_FontMemory, v.Allocator); g_FontMemory = null; }
    if (g_FontSampler)          { vkDestroySampler(v.Device, g_FontSampler, v.Allocator); g_FontSampler = null; }
    if (g_DescriptorSetLayout)  { vkDestroyDescriptorSetLayout(v.Device, g_DescriptorSetLayout, v.Allocator); g_DescriptorSetLayout = null; }
    if (g_PipelineLayout)       { vkDestroyPipelineLayout(v.Device, g_PipelineLayout, v.Allocator); g_PipelineLayout = null; }
    if (g_Pipeline)             { vkDestroyPipeline(v.Device, g_Pipeline, v.Allocator); g_Pipeline = null; }
}

bool    ImGui_ImplVulkan_Init(ImGui_ImplVulkan_InitInfo* info, VkRenderPass render_pass)
{
    // Setup back-end capabilities flags
    auto io = igGetIO;
    io.BackendRendererName = "imgui_impl_vulkan";
    io.BackendFlags |= ImGuiBackendFlags_RendererHasVtxOffset;  // We can honor the ImDrawCmd::VtxOffset field, allowing for large meshes.

    IM_ASSERT(info.Instance != null);
    IM_ASSERT(info.PhysicalDevice != null);
    IM_ASSERT(info.Device != null);
    IM_ASSERT(info.Queue != null);
    IM_ASSERT(info.DescriptorPool != null);
    IM_ASSERT(info.MinImageCount >= 2);
    IM_ASSERT(info.ImageCount >= info.MinImageCount);
    IM_ASSERT(render_pass != null);

    g_VulkanInitInfo = *info;
    g_RenderPass = render_pass;
    ImGui_ImplVulkan_CreateDeviceObjects();

    return true;
}

void ImGui_ImplVulkan_Shutdown()
{
    // ImGui_ImplVulkan_DestroyDeviceObjects();
}

void ImGui_ImplVulkan_NewFrame()
{
}

void ImGui_ImplVulkan_SetMinImageCount(uint32_t min_image_count)
{
    IM_ASSERT(min_image_count >= 2);
    if (g_VulkanInitInfo.MinImageCount == min_image_count)
        return;

    ImGui_ImplVulkan_InitInfo* v = &g_VulkanInitInfo;
    VkResult err = vkDeviceWaitIdle(v.Device);
    check_vk_result(err);
    // ImGui_ImplVulkanH_DestroyWindowRenderBuffers(v.Device,
    // &g_MainWindowRenderBuffers, v.Allocator); asdf asdf asdf asdf asdf asdf
    // asdf asdf asdf asdf asdf asdf 
    g_VulkanInitInfo.MinImageCount = min_image_count;
}
