module dtoavkbindings.cimgui_vk;
// dear imgui: Renderer for Vulkan
// This needs to be used along with a Platform Binding (e.g. GLFW, SDL, Win32,
// custom..)

// Missing features: [ ] Renderer: User texture binding. Changes of ImTextureID
// aren't supported by this binding! See
// https://github.com/ocornut/imgui/pull/914

// You can copy and use unmodified imgui_impl_* files in your project. See
// main.cpp for an example of using this.  If you are new to dear imgui, read
// examples/README.txt and read the documentation at the top of imgui.cpp.
// https://github.com/ocornut/imgui

// The aim of imgui_impl_vulkan.h/.cpp is to be usable in your engine without
// any modification.  IF YOU FEEL YOU NEED TO MAKE ANY CHANGE TO THIS CODE,
// please share them and your feedback at https://github.com/ocornut/imgui/

import dtoavkbindings.vk;

import core.stdc.stdint;
import dtoavkbindings.cimgui : ImDrawData;

// Please zero-clear before use.
struct ImGui_ImplVulkan_InitInfo
{
    VkInstance                      Instance;
    VkPhysicalDevice                PhysicalDevice;
    VkDevice                        Device;
    uint32_t                        QueueFamily;
    VkQueue                         Queue;
    VkPipelineCache                 PipelineCache;
    VkDescriptorPool                DescriptorPool;
    uint                            MinImageCount;  // >= 2
    uint                            ImageCount;     // >= MinImageCount
    VkSampleCountFlags              MSAASamples;    // >= VK_SAMPLE_COUNT_1_BIT
    const (VkAllocationCallbacks)*  Allocator;
    void function(VkResult err)     CheckVkResultFn;
};

// Called by user code
extern(C) bool ImGui_ImplVulkan_Init(
  ImGui_ImplVulkan_InitInfo* info, VkRenderPass render_pass
);
extern(C) void ImGui_ImplVulkan_Shutdown();
extern(C) void ImGui_ImplVulkan_NewFrame();
extern(C) void ImGui_ImplVulkan_RenderDrawData(
  ImDrawData* draw_data, VkCommandBuffer command_buffer
);
extern(C) bool ImGui_ImplVulkan_CreateFontsTexture(
  VkCommandBuffer command_buffer
);
extern(C) void ImGui_ImplVulkan_DestroyFontUploadObjects();
