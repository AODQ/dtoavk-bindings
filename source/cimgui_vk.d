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

import vk;

import core.stdc.stdint;
import cimgui : ImDrawData;

enum IMGUI_VK_QUEUED_FRAMES =      2;

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
    const (VkAllocationCallbacks)*  Allocator;
    void function(VkResult err)CheckVkResultFn;
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
extern(C) void ImGui_ImplVulkan_InvalidateFontUploadObjects();
extern(C) bool ImGui_ImplVulkan_CreateDeviceObjects();
extern(C) void ImGui_ImplVulkan_InvalidateDeviceObjects();


//-------------------------------------------------------------------------
// Internal / Miscellaneous Vulkan Helpers
//-------------------------------------------------------------------------
// You probably do NOT need to use or care about those functions.  Those
// functions only exist because:
//   1) they facilitate the readability and maintenance of the multiple main.cpp
//   examples files.
//   2) the upcoming multi-viewport feature will need them internally.
// Generally we avoid exposing any kind of superfluous high-level helpers in the
// bindings, but it is too much code to duplicate everywhere so we exceptionally
// expose them.  Your application/engine will likely already have code to setup
// all that stuff (swap chain, render pass, frame buffers, etc.).  You may read
// this code to learn about Vulkan, but it is recommended you use you own custom
// tailored code to do equivalent work.  (those functions do not interact with
// any of the state used by the regular ImGui_ImplVulkan_XXX functions)
//-------------------------------------------------------------------------

extern(C) void ImGui_ImplVulkanH_CreateWindowDataCommandBuffers(
  VkPhysicalDevice physical_device, VkDevice device, uint32_t queue_family,
  ImGui_ImplVulkanH_WindowData* wd, const (VkAllocationCallbacks)* allocator
);
extern(C) void ImGui_ImplVulkanH_CreateWindowDataSwapChainAndFramebuffer(
  VkPhysicalDevice physical_device, VkDevice device,
  ImGui_ImplVulkanH_WindowData* wd, const (VkAllocationCallbacks)* allocator,
  int w, int h
);
extern(C) void ImGui_ImplVulkanH_DestroyWindowData(
  VkInstance instance, VkDevice device, ImGui_ImplVulkanH_WindowData* wd,
  const (VkAllocationCallbacks)* allocator
);
extern(C) VkSurfaceFormatKHR ImGui_ImplVulkanH_SelectSurfaceFormat(
  VkPhysicalDevice physical_device, VkSurfaceKHR surface,
  const (VkFormat)* request_formats, int request_formats_count,
  VkColorSpaceKHR request_color_space
);
extern(C) VkPresentModeKHR ImGui_ImplVulkanH_SelectPresentMode(
  VkPhysicalDevice physical_device, VkSurfaceKHR surface,
  const (VkPresentModeKHR)* request_modes, int request_modes_count
);
extern(C) int ImGui_ImplVulkanH_GetMinImageCountFromPresentMode(
  VkPresentModeKHR present_mode
);

// Helper structure to hold the data needed by one rendering frame
struct ImGui_ImplVulkanH_FrameData
{
    uint32_t            BackbufferIndex;
    VkCommandPool       CommandPool;
    VkCommandBuffer     CommandBuffer;
    VkFence             Fence;
    VkSemaphore         ImageAcquiredSemaphore;
    VkSemaphore         RenderCompleteSemaphore;

};

// Helper structure to hold the data needed by one rendering context into one OS
// window
struct ImGui_ImplVulkanH_WindowData
{
    int                 Width;
    int                 Height;
    VkSwapchainKHR      Swapchain;
    VkSurfaceKHR        Surface;
    VkSurfaceFormatKHR  SurfaceFormat;
    VkPresentModeKHR    PresentMode;
    VkRenderPass        RenderPass;
    bool                ClearEnable;
    VkClearValue        ClearValue;
    uint32_t            BackBufferCount;
    VkImage[16]             BackBuffer;
    VkImageView[16]         BackBufferView;
    VkFramebuffer[16]       Framebuffer;
    uint32_t            FrameIndex;
    ImGui_ImplVulkanH_FrameData[IMGUI_VK_QUEUED_FRAMES] Frames;
};
