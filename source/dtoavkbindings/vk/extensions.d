module dtoavkbindings.vk.extensions;

import core.stdc.stdint;

import dtoavkbindings.vk;

extern (C):

PFN_vkGetAccelerationStructureMemoryRequirementsNV
  vkGetAccelerationStructureMemoryRequirements;
PFN_vkCreateAccelerationStructureNV
  vkCreateAccelerationStructure;
PFN_vkBindAccelerationStructureMemoryNV
  vkBindAccelerationStructureMemory;
PFN_vkGetAccelerationStructureHandleNV
  vkGetAccelerationStructureHandle;
PFN_vkCmdBuildAccelerationStructureNV
  vkCmdBuildAccelerationStructure;
PFN_vkCreateRayTracingPipelinesNV
  vkCreateRayTracingPipelines;
PFN_vkCmdTraceRaysNV
  vkCmdTraceRays;
PFN_vkGetRayTracingShaderGroupHandlesNV
  vkGetRayTracingShaderGroupHandles;
PFN_vkCreateDebugReportCallbackEXT
  vkCreateDebugReportCallback;

void LoadVkFunctionExtensions(ref VkDevice device) {
  vkGetAccelerationStructureMemoryRequirements =
    cast(typeof(vkGetAccelerationStructureMemoryRequirements))
    device.vkGetDeviceProcAddr(
      "vkGetAccelerationStructureMemoryRequirementsNV"
    );

  vkCreateAccelerationStructure =
    cast(typeof(vkCreateAccelerationStructure))
    device.vkGetDeviceProcAddr(
      "vkCreateAccelerationStructureNV"
    );

  vkBindAccelerationStructureMemory =
    cast(typeof(vkBindAccelerationStructureMemory  ))
    device.vkGetDeviceProcAddr(
      "vkBindAccelerationStructureMemoryNV"
    );

  vkGetAccelerationStructureHandle =
    cast(typeof(vkGetAccelerationStructureHandle))
    device.vkGetDeviceProcAddr(
      "vkGetAccelerationStructureHandleNV"
    );

  vkCmdBuildAccelerationStructure =
    cast(typeof(vkCmdBuildAccelerationStructure))
    device.vkGetDeviceProcAddr(
      "vkCmdBuildAccelerationStructureNV"
    );

  vkCreateRayTracingPipelines =
    cast(typeof(vkCreateRayTracingPipelines))
    device.vkGetDeviceProcAddr(
      "vkCreateRayTracingPipelinesNV"
    );

  vkCmdTraceRays =
    cast(typeof(vkCmdTraceRays))
    device.vkGetDeviceProcAddr(
      "vkCmdTraceRaysNV"
    );

  vkGetRayTracingShaderGroupHandles =
    cast(typeof(vkGetRayTracingShaderGroupHandles))
    device.vkGetDeviceProcAddr(
      "vkGetRayTracingShaderGroupHandlesNV"
    );

  vkCreateDebugReportCallback =
    cast(typeof(vkCreateDebugReportCallback))
    device.vkGetDeviceProcAddr(
      "vkCreateDebugReportCallbackEXT"
    );
}


extern(C) VkBool32 VkStandardDebugReportCallback(
  VkDebugReportFlagsEXT       flags,
  VkDebugReportObjectTypeEXT  objectType,
  uint64_t                    object,
  size_t                      location,
  int32_t                     messageCode,
  const char *                pLayerPrefix,
  const char *                pMessage,
  void *                      pUserData
) {
  import core.stdc.stdio;
  printf("%s: %s\n", pLayerPrefix, pMessage);
  return VK_FALSE;
}
