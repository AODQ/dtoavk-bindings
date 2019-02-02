module vk;

public import vk.extensions;

import core.stdc.config;

extern (C):

enum VULKAN_CORE_H_ = 1;

enum VK_VERSION_1_0 = 1;

extern (D) auto VK_MAKE_VERSION(T0, T1, T2)(auto ref T0 major, auto ref T1 minor, auto ref T2 patch)
{
    return (major << 22) | (minor << 12) | patch;
}

enum VK_API_VERSION_1_0 = VK_MAKE_VERSION(1, 0, 0);

extern (D) auto VK_VERSION_MAJOR(T)(auto ref T _version)
{
    return cast(uint) _version >> 22;
}

extern (D) auto VK_VERSION_MINOR(T)(auto ref T _version)
{
    return (cast(uint) _version >> 12) & 0x3ff;
}

extern (D) auto VK_VERSION_PATCH(T)(auto ref T _version)
{
    return cast(uint) _version & 0xfff;
}

enum VK_HEADER_VERSION = 92;

enum VK_NULL_HANDLE = 0;

alias VkFlags = uint;
alias VkBool32 = uint;
alias VkDeviceSize = c_ulong;
alias VkSampleMask = uint;

struct VkInstance_T;
alias VkInstance = VkInstance_T*;
struct VkPhysicalDevice_T;
alias VkPhysicalDevice = VkPhysicalDevice_T*;
struct VkDevice_T;
alias VkDevice = VkDevice_T*;
struct VkQueue_T;
alias VkQueue = VkQueue_T*;
struct VkSemaphore_T;
alias VkSemaphore = VkSemaphore_T*;
struct VkCommandBuffer_T;
alias VkCommandBuffer = VkCommandBuffer_T*;
struct VkFence_T;
alias VkFence = VkFence_T*;
struct VkDeviceMemory_T;
alias VkDeviceMemory = VkDeviceMemory_T*;
struct VkBuffer_T;
alias VkBuffer = VkBuffer_T*;
struct VkImage_T;
alias VkImage = VkImage_T*;
struct VkEvent_T;
alias VkEvent = VkEvent_T*;
struct VkQueryPool_T;
alias VkQueryPool = VkQueryPool_T*;
struct VkBufferView_T;
alias VkBufferView = VkBufferView_T*;
struct VkImageView_T;
alias VkImageView = VkImageView_T*;
struct VkShaderModule_T;
alias VkShaderModule = VkShaderModule_T*;
struct VkPipelineCache_T;
alias VkPipelineCache = VkPipelineCache_T*;
struct VkPipelineLayout_T;
alias VkPipelineLayout = VkPipelineLayout_T*;
struct VkRenderPass_T;
alias VkRenderPass = VkRenderPass_T*;
struct VkPipeline_T;
alias VkPipeline = VkPipeline_T*;
struct VkDescriptorSetLayout_T;
alias VkDescriptorSetLayout = VkDescriptorSetLayout_T*;
struct VkSampler_T;
alias VkSampler = VkSampler_T*;
struct VkDescriptorPool_T;
alias VkDescriptorPool = VkDescriptorPool_T*;
struct VkDescriptorSet_T;
alias VkDescriptorSet = VkDescriptorSet_T*;
struct VkFramebuffer_T;
alias VkFramebuffer = VkFramebuffer_T*;
struct VkCommandPool_T;
alias VkCommandPool = VkCommandPool_T*;

enum VK_LOD_CLAMP_NONE = 1000.0f;
enum VK_REMAINING_MIP_LEVELS = ~0U;
enum VK_REMAINING_ARRAY_LAYERS = ~0U;
enum VK_WHOLE_SIZE = ~0;
enum VK_ATTACHMENT_UNUSED = ~0U;
enum VK_TRUE = 1;
enum VK_FALSE = 0;
enum VK_QUEUE_FAMILY_IGNORED = ~0U;
enum VK_SUBPASS_EXTERNAL = ~0U;
enum VK_MAX_PHYSICAL_DEVICE_NAME_SIZE = 256;
enum VK_UUID_SIZE = 16;
enum VK_MAX_MEMORY_TYPES = 32;
enum VK_MAX_MEMORY_HEAPS = 16;
enum VK_MAX_EXTENSION_NAME_SIZE = 256;
enum VK_MAX_DESCRIPTION_SIZE = 256;

enum VkPipelineCacheHeaderVersion
{
    one = 1,
    beginRange = 1,
    endRange = 1,
    rangeSize = 1,
    maxEnum = 2147483647
}

enum VkResult
{
    success = 0,
    notReady = 1,
    timeout = 2,
    eventSet = 3,
    eventReset = 4,
    incomplete = 5,
    errorOutOfHostMemory = -1,
    errorOutOfDeviceMemory = -2,
    errorInitializationFailed = -3,
    errorDeviceLost = -4,
    errorMemoryMapFailed = -5,
    errorLayerNotPresent = -6,
    errorExtensionNotPresent = -7,
    errorFeatureNotPresent = -8,
    errorIncompatibleDriver = -9,
    errorTooManyObjects = -10,
    errorFormatNotSupported = -11,
    errorFragmentedPool = -12,
    errorOutOfPoolMemory = -1000069000,
    errorInvalidExternalHandle = -1000072003,
    errorSurfaceLostKhr = -1000000000,
    errorNativeWindowInUseKhr = -1000000001,
    suboptimalKhr = 1000001003,
    errorOutOfDateKhr = -1000001004,
    errorIncompatibleDisplayKhr = -1000003001,
    errorValidationFailedExt = -1000011001,
    errorInvalidShaderNv = -1000012000,
    errorInvalidDrmFormatModifierPlaneLayoutExt = -1000158000,
    errorFragmentationExt = -1000161000,
    errorNotPermittedExt = -1000174001,
    errorOutOfPoolMemoryKhr = -1000069000,
    errorInvalidExternalHandleKhr = -1000072003,
    resultBeginRange = -12,
    resultEndRange = 5,
    resultRangeSize = 18,
    resultMaxEnum = 2147483647
}

enum VkStructureType
{
    applicationInfo = 0,
    instanceCreateInfo = 1,
    deviceQueueCreateInfo = 2,
    deviceCreateInfo = 3,
    submitInfo = 4,
    memoryAllocateInfo = 5,
    mappedMemoryRange = 6,
    bindSparseInfo = 7,
    fenceCreateInfo = 8,
    semaphoreCreateInfo = 9,
    eventCreateInfo = 10,
    queryPoolCreateInfo = 11,
    bufferCreateInfo = 12,
    bufferViewCreateInfo = 13,
    imageCreateInfo = 14,
    imageViewCreateInfo = 15,
    shaderModuleCreateInfo = 16,
    pipelineCacheCreateInfo = 17,
    pipelineShaderStageCreateInfo = 18,
    pipelineVertexInputStateCreateInfo = 19,
    pipelineInputAssemblyStateCreateInfo = 20,
    pipelineTessellationStateCreateInfo = 21,
    pipelineViewportStateCreateInfo = 22,
    pipelineRasterizationStateCreateInfo = 23,
    pipelineMultisampleStateCreateInfo = 24,
    pipelineDepthStencilStateCreateInfo = 25,
    pipelineColorBlendStateCreateInfo = 26,
    pipelineDynamicStateCreateInfo = 27,
    graphicsPipelineCreateInfo = 28,
    computePipelineCreateInfo = 29,
    pipelineLayoutCreateInfo = 30,
    samplerCreateInfo = 31,
    descriptorSetLayoutCreateInfo = 32,
    descriptorPoolCreateInfo = 33,
    descriptorSetAllocateInfo = 34,
    writeDescriptorSet = 35,
    copyDescriptorSet = 36,
    framebufferCreateInfo = 37,
    renderPassCreateInfo = 38,
    commandPoolCreateInfo = 39,
    commandBufferAllocateInfo = 40,
    commandBufferInheritanceInfo = 41,
    commandBufferBeginInfo = 42,
    renderPassBeginInfo = 43,
    bufferMemoryBarrier = 44,
    imageMemoryBarrier = 45,
    memoryBarrier = 46,
    loaderInstanceCreateInfo = 47,
    loaderDeviceCreateInfo = 48,
    physicalDeviceSubgroupProperties = 1000094000,
    bindBufferMemoryInfo = 1000157000,
    bindImageMemoryInfo = 1000157001,
    physicalDevice16bitStorageFeatures = 1000083000,
    memoryDedicatedRequirements = 1000127000,
    memoryDedicatedAllocateInfo = 1000127001,
    memoryAllocateFlagsInfo = 1000060000,
    deviceGroupRenderPassBeginInfo = 1000060003,
    deviceGroupCommandBufferBeginInfo = 1000060004,
    deviceGroupSubmitInfo = 1000060005,
    deviceGroupBindSparseInfo = 1000060006,
    bindBufferMemoryDeviceGroupInfo = 1000060013,
    bindImageMemoryDeviceGroupInfo = 1000060014,
    physicalDeviceGroupProperties = 1000070000,
    deviceGroupDeviceCreateInfo = 1000070001,
    bufferMemoryRequirementsInfo2 = 1000146000,
    imageMemoryRequirementsInfo2 = 1000146001,
    imageSparseMemoryRequirementsInfo2 = 1000146002,
    memoryRequirements2 = 1000146003,
    sparseImageMemoryRequirements2 = 1000146004,
    physicalDeviceFeatures2 = 1000059000,
    physicalDeviceProperties2 = 1000059001,
    formatProperties2 = 1000059002,
    imageFormatProperties2 = 1000059003,
    physicalDeviceImageFormatInfo2 = 1000059004,
    queueFamilyProperties2 = 1000059005,
    physicalDeviceMemoryProperties2 = 1000059006,
    sparseImageFormatProperties2 = 1000059007,
    physicalDeviceSparseImageFormatInfo2 = 1000059008,
    physicalDevicePointClippingProperties = 1000117000,
    renderPassInputAttachmentAspectCreateInfo = 1000117001,
    imageViewUsageCreateInfo = 1000117002,
    pipelineTessellationDomainOriginStateCreateInfo = 1000117003,
    renderPassMultiviewCreateInfo = 1000053000,
    physicalDeviceMultiviewFeatures = 1000053001,
    physicalDeviceMultiviewProperties = 1000053002,
    physicalDeviceVariablePointerFeatures = 1000120000,
    protectedSubmitInfo = 1000145000,
    physicalDeviceProtectedMemoryFeatures = 1000145001,
    physicalDeviceProtectedMemoryProperties = 1000145002,
    deviceQueueInfo2 = 1000145003,
    samplerYcbcrConversionCreateInfo = 1000156000,
    samplerYcbcrConversionInfo = 1000156001,
    bindImagePlaneMemoryInfo = 1000156002,
    imagePlaneMemoryRequirementsInfo = 1000156003,
    physicalDeviceSamplerYcbcrConversionFeatures = 1000156004,
    samplerYcbcrConversionImageFormatProperties = 1000156005,
    descriptorUpdateTemplateCreateInfo = 1000085000,
    physicalDeviceExternalImageFormatInfo = 1000071000,
    externalImageFormatProperties = 1000071001,
    physicalDeviceExternalBufferInfo = 1000071002,
    externalBufferProperties = 1000071003,
    physicalDeviceIdProperties = 1000071004,
    externalMemoryBufferCreateInfo = 1000072000,
    externalMemoryImageCreateInfo = 1000072001,
    exportMemoryAllocateInfo = 1000072002,
    physicalDeviceExternalFenceInfo = 1000112000,
    externalFenceProperties = 1000112001,
    exportFenceCreateInfo = 1000113000,
    exportSemaphoreCreateInfo = 1000077000,
    physicalDeviceExternalSemaphoreInfo = 1000076000,
    externalSemaphoreProperties = 1000076001,
    physicalDeviceMaintenance3Properties = 1000168000,
    descriptorSetLayoutSupport = 1000168001,
    physicalDeviceShaderDrawParameterFeatures = 1000063000,
    swapchainCreateInfoKhr = 1000001000,
    presentInfoKhr = 1000001001,
    deviceGroupPresentCapabilitiesKhr = 1000060007,
    imageSwapchainCreateInfoKhr = 1000060008,
    bindImageMemorySwapchainInfoKhr = 1000060009,
    acquireNextImageInfoKhr = 1000060010,
    deviceGroupPresentInfoKhr = 1000060011,
    deviceGroupSwapchainCreateInfoKhr = 1000060012,
    displayModeCreateInfoKhr = 1000002000,
    displaySurfaceCreateInfoKhr = 1000002001,
    displayPresentInfoKhr = 1000003000,
    xlibSurfaceCreateInfoKhr = 1000004000,
    xcbSurfaceCreateInfoKhr = 1000005000,
    waylandSurfaceCreateInfoKhr = 1000006000,
    androidSurfaceCreateInfoKhr = 1000008000,
    win32SurfaceCreateInfoKhr = 1000009000,
    debugReportCallbackCreateInfoExt = 1000011000,
    pipelineRasterizationStateRasterizationOrderAmd = 1000018000,
    debugMarkerObjectNameInfoExt = 1000022000,
    debugMarkerObjectTagInfoExt = 1000022001,
    debugMarkerMarkerInfoExt = 1000022002,
    dedicatedAllocationImageCreateInfoNv = 1000026000,
    dedicatedAllocationBufferCreateInfoNv = 1000026001,
    dedicatedAllocationMemoryAllocateInfoNv = 1000026002,
    physicalDeviceTransformFeedbackFeaturesExt = 1000028000,
    physicalDeviceTransformFeedbackPropertiesExt = 1000028001,
    pipelineRasterizationStateStreamCreateInfoExt = 1000028002,
    textureLodGatherFormatPropertiesAmd = 1000041000,
    physicalDeviceCornerSampledImageFeaturesNv = 1000050000,
    externalMemoryImageCreateInfoNv = 1000056000,
    exportMemoryAllocateInfoNv = 1000056001,
    importMemoryWin32HandleInfoNv = 1000057000,
    exportMemoryWin32HandleInfoNv = 1000057001,
    win32KeyedMutexAcquireReleaseInfoNv = 1000058000,
    validationFlagsExt = 1000061000,
    viSurfaceCreateInfoNn = 1000062000,
    imageViewAstcDecodeModeExt = 1000067000,
    physicalDeviceAstcDecodeFeaturesExt = 1000067001,
    importMemoryWin32HandleInfoKhr = 1000073000,
    exportMemoryWin32HandleInfoKhr = 1000073001,
    memoryWin32HandlePropertiesKhr = 1000073002,
    memoryGetWin32HandleInfoKhr = 1000073003,
    importMemoryFdInfoKhr = 1000074000,
    memoryFdPropertiesKhr = 1000074001,
    memoryGetFdInfoKhr = 1000074002,
    win32KeyedMutexAcquireReleaseInfoKhr = 1000075000,
    importSemaphoreWin32HandleInfoKhr = 1000078000,
    exportSemaphoreWin32HandleInfoKhr = 1000078001,
    d3d12FenceSubmitInfoKhr = 1000078002,
    semaphoreGetWin32HandleInfoKhr = 1000078003,
    importSemaphoreFdInfoKhr = 1000079000,
    semaphoreGetFdInfoKhr = 1000079001,
    physicalDevicePushDescriptorPropertiesKhr = 1000080000,
    commandBufferInheritanceConditionalRenderingInfoExt = 1000081000,
    physicalDeviceConditionalRenderingFeaturesExt = 1000081001,
    conditionalRenderingBeginInfoExt = 1000081002,
    presentRegionsKhr = 1000084000,
    objectTableCreateInfoNvx = 1000086000,
    indirectCommandsLayoutCreateInfoNvx = 1000086001,
    cmdProcessCommandsInfoNvx = 1000086002,
    cmdReserveSpaceForCommandsInfoNvx = 1000086003,
    deviceGeneratedCommandsLimitsNvx = 1000086004,
    deviceGeneratedCommandsFeaturesNvx = 1000086005,
    pipelineViewportWScalingStateCreateInfoNv = 1000087000,
    surfaceCapabilities2Ext = 1000090000,
    displayPowerInfoExt = 1000091000,
    deviceEventInfoExt = 1000091001,
    displayEventInfoExt = 1000091002,
    swapchainCounterCreateInfoExt = 1000091003,
    presentTimesInfoGoogle = 1000092000,
    physicalDeviceMultiviewPerViewAttributesPropertiesNvx = 1000097000,
    pipelineViewportSwizzleStateCreateInfoNv = 1000098000,
    physicalDeviceDiscardRectanglePropertiesExt = 1000099000,
    pipelineDiscardRectangleStateCreateInfoExt = 1000099001,
    physicalDeviceConservativeRasterizationPropertiesExt = 1000101000,
    pipelineRasterizationConservativeStateCreateInfoExt = 1000101001,
    hdrMetadataExt = 1000105000,
    attachmentDescription2Khr = 1000109000,
    attachmentReference2Khr = 1000109001,
    subpassDescription2Khr = 1000109002,
    subpassDependency2Khr = 1000109003,
    renderPassCreateInfo2Khr = 1000109004,
    subpassBeginInfoKhr = 1000109005,
    subpassEndInfoKhr = 1000109006,
    sharedPresentSurfaceCapabilitiesKhr = 1000111000,
    importFenceWin32HandleInfoKhr = 1000114000,
    exportFenceWin32HandleInfoKhr = 1000114001,
    fenceGetWin32HandleInfoKhr = 1000114002,
    importFenceFdInfoKhr = 1000115000,
    fenceGetFdInfoKhr = 1000115001,
    physicalDeviceSurfaceInfo2Khr = 1000119000,
    surfaceCapabilities2Khr = 1000119001,
    surfaceFormat2Khr = 1000119002,
    displayProperties2Khr = 1000121000,
    displayPlaneProperties2Khr = 1000121001,
    displayModeProperties2Khr = 1000121002,
    displayPlaneInfo2Khr = 1000121003,
    displayPlaneCapabilities2Khr = 1000121004,
    iosSurfaceCreateInfoMvk = 1000122000,
    macosSurfaceCreateInfoMvk = 1000123000,
    debugUtilsObjectNameInfoExt = 1000128000,
    debugUtilsObjectTagInfoExt = 1000128001,
    debugUtilsLabelExt = 1000128002,
    debugUtilsMessengerCallbackDataExt = 1000128003,
    debugUtilsMessengerCreateInfoExt = 1000128004,
    androidHardwareBufferUsageAndroid = 1000129000,
    androidHardwareBufferPropertiesAndroid = 1000129001,
    androidHardwareBufferFormatPropertiesAndroid = 1000129002,
    importAndroidHardwareBufferInfoAndroid = 1000129003,
    memoryGetAndroidHardwareBufferInfoAndroid = 1000129004,
    externalFormatAndroid = 1000129005,
    physicalDeviceSamplerFilterMinmaxPropertiesExt = 1000130000,
    samplerReductionModeCreateInfoExt = 1000130001,
    physicalDeviceInlineUniformBlockFeaturesExt = 1000138000,
    physicalDeviceInlineUniformBlockPropertiesExt = 1000138001,
    writeDescriptorSetInlineUniformBlockExt = 1000138002,
    descriptorPoolInlineUniformBlockCreateInfoExt = 1000138003,
    sampleLocationsInfoExt = 1000143000,
    renderPassSampleLocationsBeginInfoExt = 1000143001,
    pipelineSampleLocationsStateCreateInfoExt = 1000143002,
    physicalDeviceSampleLocationsPropertiesExt = 1000143003,
    multisamplePropertiesExt = 1000143004,
    imageFormatListCreateInfoKhr = 1000147000,
    physicalDeviceBlendOperationAdvancedFeaturesExt = 1000148000,
    physicalDeviceBlendOperationAdvancedPropertiesExt = 1000148001,
    pipelineColorBlendAdvancedStateCreateInfoExt = 1000148002,
    pipelineCoverageToColorStateCreateInfoNv = 1000149000,
    pipelineCoverageModulationStateCreateInfoNv = 1000152000,
    drmFormatModifierPropertiesListExt = 1000158000,
    drmFormatModifierPropertiesExt = 1000158001,
    physicalDeviceImageDrmFormatModifierInfoExt = 1000158002,
    imageDrmFormatModifierListCreateInfoExt = 1000158003,
    imageDrmFormatModifierExplicitCreateInfoExt = 1000158004,
    imageDrmFormatModifierPropertiesExt = 1000158005,
    validationCacheCreateInfoExt = 1000160000,
    shaderModuleValidationCacheCreateInfoExt = 1000160001,
    descriptorSetLayoutBindingFlagsCreateInfoExt = 1000161000,
    physicalDeviceDescriptorIndexingFeaturesExt = 1000161001,
    physicalDeviceDescriptorIndexingPropertiesExt = 1000161002,
    descriptorSetVariableDescriptorCountAllocateInfoExt = 1000161003,
    descriptorSetVariableDescriptorCountLayoutSupportExt = 1000161004,
    pipelineViewportShadingRateImageStateCreateInfoNv = 1000164000,
    physicalDeviceShadingRateImageFeaturesNv = 1000164001,
    physicalDeviceShadingRateImagePropertiesNv = 1000164002,
    pipelineViewportCoarseSampleOrderStateCreateInfoNv = 1000164005,
    rayTracingPipelineCreateInfoNv = 1000165000,
    accelerationStructureCreateInfoNv = 1000165001,
    geometryNv = 1000165003,
    geometryTrianglesNv = 1000165004,
    geometryAabbNv = 1000165005,
    bindAccelerationStructureMemoryInfoNv = 1000165006,
    writeDescriptorSetAccelerationStructureNv = 1000165007,
    accelerationStructureMemoryRequirementsInfoNv = 1000165008,
    physicalDeviceRayTracingPropertiesNv = 1000165009,
    rayTracingShaderGroupCreateInfoNv = 1000165011,
    accelerationStructureInfoNv = 1000165012,
    physicalDeviceRepresentativeFragmentTestFeaturesNv = 1000166000,
    pipelineRepresentativeFragmentTestStateCreateInfoNv = 1000166001,
    deviceQueueGlobalPriorityCreateInfoExt = 1000174000,
    physicalDevice8bitStorageFeaturesKhr = 1000177000,
    importMemoryHostPointerInfoExt = 1000178000,
    memoryHostPointerPropertiesExt = 1000178001,
    physicalDeviceExternalMemoryHostPropertiesExt = 1000178002,
    physicalDeviceShaderAtomicInt64FeaturesKhr = 1000180000,
    calibratedTimestampInfoExt = 1000184000,
    physicalDeviceShaderCorePropertiesAmd = 1000185000,
    deviceMemoryOverallocationCreateInfoAmd = 1000189000,
    physicalDeviceVertexAttributeDivisorPropertiesExt = 1000190000,
    pipelineVertexInputDivisorStateCreateInfoExt = 1000190001,
    physicalDeviceVertexAttributeDivisorFeaturesExt = 1000190002,
    physicalDeviceDriverPropertiesKhr = 1000196000,
    physicalDeviceComputeShaderDerivativesFeaturesNv = 1000201000,
    physicalDeviceMeshShaderFeaturesNv = 1000202000,
    physicalDeviceMeshShaderPropertiesNv = 1000202001,
    physicalDeviceFragmentShaderBarycentricFeaturesNv = 1000203000,
    physicalDeviceShaderImageFootprintFeaturesNv = 1000204000,
    pipelineViewportExclusiveScissorStateCreateInfoNv = 1000205000,
    physicalDeviceExclusiveScissorFeaturesNv = 1000205002,
    checkpointDataNv = 1000206000,
    queueFamilyCheckpointPropertiesNv = 1000206001,
    physicalDeviceVulkanMemoryModelFeaturesKhr = 1000211000,
    physicalDevicePciBusInfoPropertiesExt = 1000212000,
    imagepipeSurfaceCreateInfoFuchsia = 1000214000,
    debugReportCreateInfoExt = 1000011000,
    renderPassMultiviewCreateInfoKhr = 1000053000,
    physicalDeviceMultiviewFeaturesKhr = 1000053001,
    physicalDeviceMultiviewPropertiesKhr = 1000053002,
    physicalDeviceFeatures2Khr = 1000059000,
    physicalDeviceProperties2Khr = 1000059001,
    formatProperties2Khr = 1000059002,
    imageFormatProperties2Khr = 1000059003,
    physicalDeviceImageFormatInfo2Khr = 1000059004,
    queueFamilyProperties2Khr = 1000059005,
    physicalDeviceMemoryProperties2Khr = 1000059006,
    sparseImageFormatProperties2Khr = 1000059007,
    physicalDeviceSparseImageFormatInfo2Khr = 1000059008,
    memoryAllocateFlagsInfoKhr = 1000060000,
    deviceGroupRenderPassBeginInfoKhr = 1000060003,
    deviceGroupCommandBufferBeginInfoKhr = 1000060004,
    deviceGroupSubmitInfoKhr = 1000060005,
    deviceGroupBindSparseInfoKhr = 1000060006,
    bindBufferMemoryDeviceGroupInfoKhr = 1000060013,
    bindImageMemoryDeviceGroupInfoKhr = 1000060014,
    physicalDeviceGroupPropertiesKhr = 1000070000,
    deviceGroupDeviceCreateInfoKhr = 1000070001,
    physicalDeviceExternalImageFormatInfoKhr = 1000071000,
    externalImageFormatPropertiesKhr = 1000071001,
    physicalDeviceExternalBufferInfoKhr = 1000071002,
    externalBufferPropertiesKhr = 1000071003,
    physicalDeviceIdPropertiesKhr = 1000071004,
    externalMemoryBufferCreateInfoKhr = 1000072000,
    externalMemoryImageCreateInfoKhr = 1000072001,
    exportMemoryAllocateInfoKhr = 1000072002,
    physicalDeviceExternalSemaphoreInfoKhr = 1000076000,
    externalSemaphorePropertiesKhr = 1000076001,
    exportSemaphoreCreateInfoKhr = 1000077000,
    physicalDevice16bitStorageFeaturesKhr = 1000083000,
    descriptorUpdateTemplateCreateInfoKhr = 1000085000,
    physicalDeviceExternalFenceInfoKhr = 1000112000,
    externalFencePropertiesKhr = 1000112001,
    exportFenceCreateInfoKhr = 1000113000,
    physicalDevicePointClippingPropertiesKhr = 1000117000,
    renderPassInputAttachmentAspectCreateInfoKhr = 1000117001,
    imageViewUsageCreateInfoKhr = 1000117002,
    pipelineTessellationDomainOriginStateCreateInfoKhr = 1000117003,
    physicalDeviceVariablePointerFeaturesKhr = 1000120000,
    memoryDedicatedRequirementsKhr = 1000127000,
    memoryDedicatedAllocateInfoKhr = 1000127001,
    bufferMemoryRequirementsInfo2Khr = 1000146000,
    imageMemoryRequirementsInfo2Khr = 1000146001,
    imageSparseMemoryRequirementsInfo2Khr = 1000146002,
    memoryRequirements2Khr = 1000146003,
    sparseImageMemoryRequirements2Khr = 1000146004,
    samplerYcbcrConversionCreateInfoKhr = 1000156000,
    samplerYcbcrConversionInfoKhr = 1000156001,
    bindImagePlaneMemoryInfoKhr = 1000156002,
    imagePlaneMemoryRequirementsInfoKhr = 1000156003,
    physicalDeviceSamplerYcbcrConversionFeaturesKhr = 1000156004,
    samplerYcbcrConversionImageFormatPropertiesKhr = 1000156005,
    bindBufferMemoryInfoKhr = 1000157000,
    bindImageMemoryInfoKhr = 1000157001,
    physicalDeviceMaintenance3PropertiesKhr = 1000168000,
    descriptorSetLayoutSupportKhr = 1000168001,
    beginRange = 0,
    endRange = 48,
    rangeSize = 49,
    maxEnum = 2147483647
}

enum VkSystemAllocationScope
{
    command = 0,
    object = 1,
    cache = 2,
    device = 3,
    instance = 4,
    beginRange = 0,
    endRange = 4,
    rangeSize = 5,
    maxEnum = 2147483647
}

enum VkInternalAllocationType
{
    executable = 0,
    beginRange = 0,
    endRange = 0,
    rangeSize = 1,
    maxEnum = 2147483647
}

enum VkFormat
{
    undefined = 0,
    r4g4UnormPack8 = 1,
    r4g4b4a4UnormPack16 = 2,
    b4g4r4a4UnormPack16 = 3,
    r5g6b5UnormPack16 = 4,
    b5g6r5UnormPack16 = 5,
    r5g5b5a1UnormPack16 = 6,
    b5g5r5a1UnormPack16 = 7,
    a1r5g5b5UnormPack16 = 8,
    r8Unorm = 9,
    r8Snorm = 10,
    r8Uscaled = 11,
    r8Sscaled = 12,
    r8Uint = 13,
    r8Sint = 14,
    r8Srgb = 15,
    r8g8Unorm = 16,
    r8g8Snorm = 17,
    r8g8Uscaled = 18,
    r8g8Sscaled = 19,
    r8g8Uint = 20,
    r8g8Sint = 21,
    r8g8Srgb = 22,
    r8g8b8Unorm = 23,
    r8g8b8Snorm = 24,
    r8g8b8Uscaled = 25,
    r8g8b8Sscaled = 26,
    r8g8b8Uint = 27,
    r8g8b8Sint = 28,
    r8g8b8Srgb = 29,
    b8g8r8Unorm = 30,
    b8g8r8Snorm = 31,
    b8g8r8Uscaled = 32,
    b8g8r8Sscaled = 33,
    b8g8r8Uint = 34,
    b8g8r8Sint = 35,
    b8g8r8Srgb = 36,
    r8g8b8a8Unorm = 37,
    r8g8b8a8Snorm = 38,
    r8g8b8a8Uscaled = 39,
    r8g8b8a8Sscaled = 40,
    r8g8b8a8Uint = 41,
    r8g8b8a8Sint = 42,
    r8g8b8a8Srgb = 43,
    b8g8r8a8Unorm = 44,
    b8g8r8a8Snorm = 45,
    b8g8r8a8Uscaled = 46,
    b8g8r8a8Sscaled = 47,
    b8g8r8a8Uint = 48,
    b8g8r8a8Sint = 49,
    b8g8r8a8Srgb = 50,
    a8b8g8r8UnormPack32 = 51,
    a8b8g8r8SnormPack32 = 52,
    a8b8g8r8UscaledPack32 = 53,
    a8b8g8r8SscaledPack32 = 54,
    a8b8g8r8UintPack32 = 55,
    a8b8g8r8SintPack32 = 56,
    a8b8g8r8SrgbPack32 = 57,
    a2r10g10b10UnormPack32 = 58,
    a2r10g10b10SnormPack32 = 59,
    a2r10g10b10UscaledPack32 = 60,
    a2r10g10b10SscaledPack32 = 61,
    a2r10g10b10UintPack32 = 62,
    a2r10g10b10SintPack32 = 63,
    a2b10g10r10UnormPack32 = 64,
    a2b10g10r10SnormPack32 = 65,
    a2b10g10r10UscaledPack32 = 66,
    a2b10g10r10SscaledPack32 = 67,
    a2b10g10r10UintPack32 = 68,
    a2b10g10r10SintPack32 = 69,
    r16Unorm = 70,
    r16Snorm = 71,
    r16Uscaled = 72,
    r16Sscaled = 73,
    r16Uint = 74,
    r16Sint = 75,
    r16Sfloat = 76,
    r16g16Unorm = 77,
    r16g16Snorm = 78,
    r16g16Uscaled = 79,
    r16g16Sscaled = 80,
    r16g16Uint = 81,
    r16g16Sint = 82,
    r16g16Sfloat = 83,
    r16g16b16Unorm = 84,
    r16g16b16Snorm = 85,
    r16g16b16Uscaled = 86,
    r16g16b16Sscaled = 87,
    r16g16b16Uint = 88,
    r16g16b16Sint = 89,
    r16g16b16Sfloat = 90,
    r16g16b16a16Unorm = 91,
    r16g16b16a16Snorm = 92,
    r16g16b16a16Uscaled = 93,
    r16g16b16a16Sscaled = 94,
    r16g16b16a16Uint = 95,
    r16g16b16a16Sint = 96,
    r16g16b16a16Sfloat = 97,
    r32Uint = 98,
    r32Sint = 99,
    r32Sfloat = 100,
    r32g32Uint = 101,
    r32g32Sint = 102,
    r32g32Sfloat = 103,
    r32g32b32Uint = 104,
    r32g32b32Sint = 105,
    r32g32b32Sfloat = 106,
    r32g32b32a32Uint = 107,
    r32g32b32a32Sint = 108,
    r32g32b32a32Sfloat = 109,
    r64Uint = 110,
    r64Sint = 111,
    r64Sfloat = 112,
    r64g64Uint = 113,
    r64g64Sint = 114,
    r64g64Sfloat = 115,
    r64g64b64Uint = 116,
    r64g64b64Sint = 117,
    r64g64b64Sfloat = 118,
    r64g64b64a64Uint = 119,
    r64g64b64a64Sint = 120,
    r64g64b64a64Sfloat = 121,
    b10g11r11UfloatPack32 = 122,
    e5b9g9r9UfloatPack32 = 123,
    d16Unorm = 124,
    x8D24UnormPack32 = 125,
    d32Sfloat = 126,
    s8Uint = 127,
    d16UnormS8Uint = 128,
    d24UnormS8Uint = 129,
    d32SfloatS8Uint = 130,
    bc1RgbUnormBlock = 131,
    bc1RgbSrgbBlock = 132,
    bc1RgbaUnormBlock = 133,
    bc1RgbaSrgbBlock = 134,
    bc2UnormBlock = 135,
    bc2SrgbBlock = 136,
    bc3UnormBlock = 137,
    bc3SrgbBlock = 138,
    bc4UnormBlock = 139,
    bc4SnormBlock = 140,
    bc5UnormBlock = 141,
    bc5SnormBlock = 142,
    bc6hUfloatBlock = 143,
    bc6hSfloatBlock = 144,
    bc7UnormBlock = 145,
    bc7SrgbBlock = 146,
    etc2R8g8b8UnormBlock = 147,
    etc2R8g8b8SrgbBlock = 148,
    etc2R8g8b8a1UnormBlock = 149,
    etc2R8g8b8a1SrgbBlock = 150,
    etc2R8g8b8a8UnormBlock = 151,
    etc2R8g8b8a8SrgbBlock = 152,
    eacR11UnormBlock = 153,
    eacR11SnormBlock = 154,
    eacR11g11UnormBlock = 155,
    eacR11g11SnormBlock = 156,
    astc4x4UNORMBLOCK = 157,
    astc4x4SRGBBLOCK = 158,
    astc5x4UNORMBLOCK = 159,
    astc5x4SRGBBLOCK = 160,
    astc5x5UNORMBLOCK = 161,
    astc5x5SRGBBLOCK = 162,
    astc6x5UNORMBLOCK = 163,
    astc6x5SRGBBLOCK = 164,
    astc6x6UNORMBLOCK = 165,
    astc6x6SRGBBLOCK = 166,
    astc8x5UNORMBLOCK = 167,
    astc8x5SRGBBLOCK = 168,
    astc8x6UNORMBLOCK = 169,
    astc8x6SRGBBLOCK = 170,
    astc8x8UNORMBLOCK = 171,
    astc8x8SRGBBLOCK = 172,
    astc10x5UNORMBLOCK = 173,
    astc10x5SRGBBLOCK = 174,
    astc10x6UNORMBLOCK = 175,
    astc10x6SRGBBLOCK = 176,
    astc10x8UNORMBLOCK = 177,
    astc10x8SRGBBLOCK = 178,
    astc10x10UNORMBLOCK = 179,
    astc10x10SRGBBLOCK = 180,
    astc12x10UNORMBLOCK = 181,
    astc12x10SRGBBLOCK = 182,
    astc12x12UNORMBLOCK = 183,
    astc12x12SRGBBLOCK = 184,
    g8b8g8r8422Unorm = 1000156000,
    b8g8r8g8422Unorm = 1000156001,
    g8B8R83plane420Unorm = 1000156002,
    g8B8r82plane420Unorm = 1000156003,
    g8B8R83plane422Unorm = 1000156004,
    g8B8r82plane422Unorm = 1000156005,
    g8B8R83plane444Unorm = 1000156006,
    r10x6UnormPack16 = 1000156007,
    r10x6g10x6Unorm2pack16 = 1000156008,
    r10x6g10x6b10x6a10x6Unorm4pack16 = 1000156009,
    g10x6b10x6g10x6r10x6422Unorm4pack16 = 1000156010,
    b10x6g10x6r10x6g10x6422Unorm4pack16 = 1000156011,
    g10x6B10x6R10x63plane420Unorm3pack16 = 1000156012,
    g10x6B10x6r10x62plane420Unorm3pack16 = 1000156013,
    g10x6B10x6R10x63plane422Unorm3pack16 = 1000156014,
    g10x6B10x6r10x62plane422Unorm3pack16 = 1000156015,
    g10x6B10x6R10x63plane444Unorm3pack16 = 1000156016,
    r12x4UnormPack16 = 1000156017,
    r12x4g12x4Unorm2pack16 = 1000156018,
    r12x4g12x4b12x4a12x4Unorm4pack16 = 1000156019,
    g12x4b12x4g12x4r12x4422Unorm4pack16 = 1000156020,
    b12x4g12x4r12x4g12x4422Unorm4pack16 = 1000156021,
    g12x4B12x4R12x43plane420Unorm3pack16 = 1000156022,
    g12x4B12x4r12x42plane420Unorm3pack16 = 1000156023,
    g12x4B12x4R12x43plane422Unorm3pack16 = 1000156024,
    g12x4B12x4r12x42plane422Unorm3pack16 = 1000156025,
    g12x4B12x4R12x43plane444Unorm3pack16 = 1000156026,
    g16b16g16r16422Unorm = 1000156027,
    b16g16r16g16422Unorm = 1000156028,
    g16B16R163plane420Unorm = 1000156029,
    g16B16r162plane420Unorm = 1000156030,
    g16B16R163plane422Unorm = 1000156031,
    g16B16r162plane422Unorm = 1000156032,
    g16B16R163plane444Unorm = 1000156033,
    pvrtc12bppUnormBlockImg = 1000054000,
    pvrtc14bppUnormBlockImg = 1000054001,
    pvrtc22bppUnormBlockImg = 1000054002,
    pvrtc24bppUnormBlockImg = 1000054003,
    pvrtc12bppSrgbBlockImg = 1000054004,
    pvrtc14bppSrgbBlockImg = 1000054005,
    pvrtc22bppSrgbBlockImg = 1000054006,
    pvrtc24bppSrgbBlockImg = 1000054007,
    g8b8g8r8422UnormKhr = 1000156000,
    b8g8r8g8422UnormKhr = 1000156001,
    g8B8R83plane420UnormKhr = 1000156002,
    g8B8r82plane420UnormKhr = 1000156003,
    g8B8R83plane422UnormKhr = 1000156004,
    g8B8r82plane422UnormKhr = 1000156005,
    g8B8R83plane444UnormKhr = 1000156006,
    r10x6UnormPack16Khr = 1000156007,
    r10x6g10x6Unorm2pack16Khr = 1000156008,
    r10x6g10x6b10x6a10x6Unorm4pack16Khr = 1000156009,
    g10x6b10x6g10x6r10x6422Unorm4pack16Khr = 1000156010,
    b10x6g10x6r10x6g10x6422Unorm4pack16Khr = 1000156011,
    g10x6B10x6R10x63plane420Unorm3pack16Khr = 1000156012,
    g10x6B10x6r10x62plane420Unorm3pack16Khr = 1000156013,
    g10x6B10x6R10x63plane422Unorm3pack16Khr = 1000156014,
    g10x6B10x6r10x62plane422Unorm3pack16Khr = 1000156015,
    g10x6B10x6R10x63plane444Unorm3pack16Khr = 1000156016,
    r12x4UnormPack16Khr = 1000156017,
    r12x4g12x4Unorm2pack16Khr = 1000156018,
    r12x4g12x4b12x4a12x4Unorm4pack16Khr = 1000156019,
    g12x4b12x4g12x4r12x4422Unorm4pack16Khr = 1000156020,
    b12x4g12x4r12x4g12x4422Unorm4pack16Khr = 1000156021,
    g12x4B12x4R12x43plane420Unorm3pack16Khr = 1000156022,
    g12x4B12x4r12x42plane420Unorm3pack16Khr = 1000156023,
    g12x4B12x4R12x43plane422Unorm3pack16Khr = 1000156024,
    g12x4B12x4r12x42plane422Unorm3pack16Khr = 1000156025,
    g12x4B12x4R12x43plane444Unorm3pack16Khr = 1000156026,
    g16b16g16r16422UnormKhr = 1000156027,
    b16g16r16g16422UnormKhr = 1000156028,
    g16B16R163plane420UnormKhr = 1000156029,
    g16B16r162plane420UnormKhr = 1000156030,
    g16B16R163plane422UnormKhr = 1000156031,
    g16B16r162plane422UnormKhr = 1000156032,
    g16B16R163plane444UnormKhr = 1000156033,
    beginRange = 0,
    endRange = 184,
    rangeSize = 185,
    maxEnum = 2147483647
}

enum VkImageType
{
    i1D = 0,
    i2D = 1,
    i3D = 2,
    beginRange = 0,
    endRange = 2,
    rangeSize = 3,
    maxEnum = 2147483647
}

enum VkImageTiling
{
    optimal = 0,
    linear = 1,
    drmFormatModifierExt = 1000158000,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkPhysicalDeviceType
{
    other = 0,
    integratedGpu = 1,
    discreteGpu = 2,
    virtualGpu = 3,
    cpu = 4,
    beginRange = 0,
    endRange = 4,
    rangeSize = 5,
    maxEnum = 2147483647
}

enum VkQueryType
{
    occlusion = 0,
    pipelineStatistics = 1,
    timestamp = 2,
    transformFeedbackStreamExt = 1000028004,
    accelerationStructureCompactedSizeNv = 1000165000,
    beginRange = 0,
    endRange = 2,
    rangeSize = 3,
    maxEnum = 2147483647
}

enum VkSharingMode
{
    exclusive = 0,
    concurrent = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkImageLayout
{
    undefined = 0,
    general = 1,
    colorAttachmentOptimal = 2,
    depthStencilAttachmentOptimal = 3,
    depthStencilReadOnlyOptimal = 4,
    shaderReadOnlyOptimal = 5,
    transferSrcOptimal = 6,
    transferDstOptimal = 7,
    preinitialized = 8,
    depthReadOnlyStencilAttachmentOptimal = 1000117000,
    depthAttachmentStencilReadOnlyOptimal = 1000117001,
    presentSrcKhr = 1000001002,
    sharedPresentKhr = 1000111000,
    shadingRateOptimalNv = 1000164003,
    depthReadOnlyStencilAttachmentOptimalKhr = 1000117000,
    depthAttachmentStencilReadOnlyOptimalKhr = 1000117001,
    beginRange = 0,
    endRange = 8,
    rangeSize = 9,
    maxEnum = 2147483647
}

enum VkImageViewType
{
    i1D = 0,
    i2D = 1,
    i3D = 2,
    cube = 3,
    i1DArray = 4,
    i2DArray = 5,
    cubeArray = 6,
    beginRange = 0,
    endRange = 6,
    rangeSize = 7,
    maxEnum = 2147483647
}

enum VkComponentSwizzle
{
    identity = 0,
    zero = 1,
    one = 2,
    r = 3,
    g = 4,
    b = 5,
    a = 6,
    beginRange = 0,
    endRange = 6,
    rangeSize = 7,
    maxEnum = 2147483647
}

enum VkVertexInputRate
{
    vertex = 0,
    instance = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkPrimitiveTopology
{
    pointList = 0,
    lineList = 1,
    lineStrip = 2,
    triangleList = 3,
    triangleStrip = 4,
    triangleFan = 5,
    lineListWithAdjacency = 6,
    lineStripWithAdjacency = 7,
    triangleListWithAdjacency = 8,
    triangleStripWithAdjacency = 9,
    patchList = 10,
    beginRange = 0,
    endRange = 10,
    rangeSize = 11,
    maxEnum = 2147483647
}

enum VkPolygonMode
{
    fill = 0,
    line = 1,
    point = 2,
    fillRectangleNv = 1000153000,
    beginRange = 0,
    endRange = 2,
    rangeSize = 3,
    maxEnum = 2147483647
}

enum VkFrontFace
{
    counterClockwise = 0,
    clockwise = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkCompareOp
{
    never = 0,
    less = 1,
    equal = 2,
    lessOrEqual = 3,
    greater = 4,
    notEqual = 5,
    greaterOrEqual = 6,
    always = 7,
    beginRange = 0,
    endRange = 7,
    rangeSize = 8,
    maxEnum = 2147483647
}

enum VkStencilOp
{
    keep = 0,
    zero = 1,
    replace = 2,
    incrementAndClamp = 3,
    decrementAndClamp = 4,
    invert = 5,
    incrementAndWrap = 6,
    decrementAndWrap = 7,
    beginRange = 0,
    endRange = 7,
    rangeSize = 8,
    maxEnum = 2147483647
}

enum VkLogicOp
{
    clear = 0,
    and = 1,
    andReverse = 2,
    copy = 3,
    andInverted = 4,
    noOp = 5,
    xor = 6,
    or = 7,
    nor = 8,
    equivalent = 9,
    invert = 10,
    orReverse = 11,
    copyInverted = 12,
    orInverted = 13,
    nand = 14,
    set = 15,
    beginRange = 0,
    endRange = 15,
    rangeSize = 16,
    maxEnum = 2147483647
}

enum VkBlendFactor
{
    zero = 0,
    one = 1,
    srcColor = 2,
    oneMinusSrcColor = 3,
    dstColor = 4,
    oneMinusDstColor = 5,
    srcAlpha = 6,
    oneMinusSrcAlpha = 7,
    dstAlpha = 8,
    oneMinusDstAlpha = 9,
    constantColor = 10,
    oneMinusConstantColor = 11,
    constantAlpha = 12,
    oneMinusConstantAlpha = 13,
    srcAlphaSaturate = 14,
    src1Color = 15,
    oneMinusSrc1Color = 16,
    src1Alpha = 17,
    oneMinusSrc1Alpha = 18,
    beginRange = 0,
    endRange = 18,
    rangeSize = 19,
    maxEnum = 2147483647
}

enum VkBlendOp
{
    add = 0,
    subtract = 1,
    reverseSubtract = 2,
    min = 3,
    max = 4,
    zeroExt = 1000148000,
    srcExt = 1000148001,
    dstExt = 1000148002,
    srcOverExt = 1000148003,
    dstOverExt = 1000148004,
    srcInExt = 1000148005,
    dstInExt = 1000148006,
    srcOutExt = 1000148007,
    dstOutExt = 1000148008,
    srcAtopExt = 1000148009,
    dstAtopExt = 1000148010,
    xorExt = 1000148011,
    multiplyExt = 1000148012,
    screenExt = 1000148013,
    overlayExt = 1000148014,
    darkenExt = 1000148015,
    lightenExt = 1000148016,
    colordodgeExt = 1000148017,
    colorburnExt = 1000148018,
    hardlightExt = 1000148019,
    softlightExt = 1000148020,
    differenceExt = 1000148021,
    exclusionExt = 1000148022,
    invertExt = 1000148023,
    invertRgbExt = 1000148024,
    lineardodgeExt = 1000148025,
    linearburnExt = 1000148026,
    vividlightExt = 1000148027,
    linearlightExt = 1000148028,
    pinlightExt = 1000148029,
    hardmixExt = 1000148030,
    hslHueExt = 1000148031,
    hslSaturationExt = 1000148032,
    hslColorExt = 1000148033,
    hslLuminosityExt = 1000148034,
    plusExt = 1000148035,
    plusClampedExt = 1000148036,
    plusClampedAlphaExt = 1000148037,
    plusDarkerExt = 1000148038,
    minusExt = 1000148039,
    minusClampedExt = 1000148040,
    contrastExt = 1000148041,
    invertOvgExt = 1000148042,
    redExt = 1000148043,
    greenExt = 1000148044,
    blueExt = 1000148045,
    beginRange = 0,
    endRange = 4,
    rangeSize = 5,
    maxEnum = 2147483647
}

enum VkDynamicState
{
    viewport = 0,
    scissor = 1,
    lineWidth = 2,
    depthBias = 3,
    blendConstants = 4,
    depthBounds = 5,
    stencilCompareMask = 6,
    stencilWriteMask = 7,
    stencilReference = 8,
    viewportWScalingNv = 1000087000,
    discardRectangleExt = 1000099000,
    sampleLocationsExt = 1000143000,
    viewportShadingRatePaletteNv = 1000164004,
    viewportCoarseSampleOrderNv = 1000164006,
    exclusiveScissorNv = 1000205001,
    beginRange = 0,
    endRange = 8,
    rangeSize = 9,
    maxEnum = 2147483647
}

enum VkFilter
{
    nearest = 0,
    linear = 1,
    cubicImg = 1000015000,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkSamplerMipmapMode
{
    nearest = 0,
    linear = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkSamplerAddressMode
{
    repeat = 0,
    mirroredRepeat = 1,
    clampToEdge = 2,
    clampToBorder = 3,
    mirrorClampToEdge = 4,
    beginRange = 0,
    endRange = 3,
    rangeSize = 4,
    maxEnum = 2147483647
}

enum VkBorderColor
{
    floatTransparentBlack = 0,
    intTransparentBlack = 1,
    floatOpaqueBlack = 2,
    intOpaqueBlack = 3,
    floatOpaqueWhite = 4,
    intOpaqueWhite = 5,
    beginRange = 0,
    endRange = 5,
    rangeSize = 6,
    maxEnum = 2147483647
}

enum VkDescriptorType
{
    sampler = 0,
    combinedImageSampler = 1,
    sampledImage = 2,
    storageImage = 3,
    uniformTexelBuffer = 4,
    storageTexelBuffer = 5,
    uniformBuffer = 6,
    storageBuffer = 7,
    uniformBufferDynamic = 8,
    storageBufferDynamic = 9,
    inputAttachment = 10,
    inlineUniformBlockExt = 1000138000,
    accelerationStructureNv = 1000165000,
    beginRange = 0,
    endRange = 10,
    rangeSize = 11,
    maxEnum = 2147483647
}

enum VkAttachmentLoadOp
{
    load = 0,
    clear = 1,
    dontCare = 2,
    beginRange = 0,
    endRange = 2,
    rangeSize = 3,
    maxEnum = 2147483647
}

enum VkAttachmentStoreOp
{
    store = 0,
    dontCare = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkPipelineBindPoint
{
    graphics = 0,
    compute = 1,
    rayTracingNv = 1000165000,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkCommandBufferLevel
{
    primary = 0,
    secondary = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkIndexType
{
    uint16 = 0,
    uint32 = 1,
    noneNv = 1000165000,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkSubpassContents
{
    inline = 0,
    secondaryCommandBuffers = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkObjectType
{
    unknown = 0,
    instance = 1,
    physicalDevice = 2,
    device = 3,
    queue = 4,
    semaphore = 5,
    commandBuffer = 6,
    fence = 7,
    deviceMemory = 8,
    buffer = 9,
    image = 10,
    event = 11,
    queryPool = 12,
    bufferView = 13,
    imageView = 14,
    shaderModule = 15,
    pipelineCache = 16,
    pipelineLayout = 17,
    renderPass = 18,
    pipeline = 19,
    descriptorSetLayout = 20,
    sampler = 21,
    descriptorPool = 22,
    descriptorSet = 23,
    framebuffer = 24,
    commandPool = 25,
    samplerYcbcrConversion = 1000156000,
    descriptorUpdateTemplate = 1000085000,
    surfaceKhr = 1000000000,
    swapchainKhr = 1000001000,
    displayKhr = 1000002000,
    displayModeKhr = 1000002001,
    debugReportCallbackExt = 1000011000,
    objectTableNvx = 1000086000,
    indirectCommandsLayoutNvx = 1000086001,
    debugUtilsMessengerExt = 1000128000,
    validationCacheExt = 1000160000,
    accelerationStructureNv = 1000165000,
    descriptorUpdateTemplateKhr = 1000085000,
    samplerYcbcrConversionKhr = 1000156000,
    beginRange = 0,
    endRange = 25,
    rangeSize = 26,
    maxEnum = 2147483647
}

enum VkVendorId
{
    viv = 65537,
    vsi = 65538,
    kazan = 65539,
    beginRange = 65537,
    endRange = 65539,
    rangeSize = 3,
    maxEnum = 2147483647
}

alias VkInstanceCreateFlags = uint;

enum VkFormatFeatureFlag
{
    sampledImageBit = 1,
    storageImageBit = 2,
    storageImageAtomicBit = 4,
    uniformTexelBufferBit = 8,
    storageTexelBufferBit = 16,
    storageTexelBufferAtomicBit = 32,
    vertexBufferBit = 64,
    colorAttachmentBit = 128,
    colorAttachmentBlendBit = 256,
    depthStencilAttachmentBit = 512,
    blitSrcBit = 1024,
    blitDstBit = 2048,
    sampledImageFilterLinearBit = 4096,
    transferSrcBit = 16384,
    transferDstBit = 32768,
    midpointChromaSamplesBit = 131072,
    sampledImageYcbcrConversionLinearFilterBit = 262144,
    sampledImageYcbcrConversionSeparateReconstructionFilterBit = 524288,
    sampledImageYcbcrConversionChromaReconstructionExplicitBit = 1048576,
    sampledImageYcbcrConversionChromaReconstructionExplicitForceableBit = 2097152,
    disjointBit = 4194304,
    cositedChromaSamplesBit = 8388608,
    sampledImageFilterCubicBitImg = 8192,
    sampledImageFilterMinmaxBitExt = 65536,
    transferSrcBitKhr = 16384,
    transferDstBitKhr = 32768,
    midpointChromaSamplesBitKhr = 131072,
    sampledImageYcbcrConversionLinearFilterBitKhr = 262144,
    sampledImageYcbcrConversionSeparateReconstructionFilterBitKhr = 524288,
    sampledImageYcbcrConversionChromaReconstructionExplicitBitKhr = 1048576,
    sampledImageYcbcrConversionChromaReconstructionExplicitForceableBitKhr = 2097152,
    disjointBitKhr = 4194304,
    cositedChromaSamplesBitKhr = 8388608,
    flagBitsMaxEnum = 2147483647
}

alias VkFormatFeatureFlags = uint;

enum VkImageUsageFlag
{
    transferSrcBit = 1,
    transferDstBit = 2,
    sampledBit = 4,
    storageBit = 8,
    colorAttachmentBit = 16,
    depthStencilAttachmentBit = 32,
    transientAttachmentBit = 64,
    inputAttachmentBit = 128,
    shadingRateImageBitNv = 256,
    flagBitsMaxEnum = 2147483647
}

alias VkImageUsageFlags = uint;

enum VkImageCreateFlag
{
    sparseBindingBit = 1,
    sparseResidencyBit = 2,
    sparseAliasedBit = 4,
    mutableFormatBit = 8,
    cubeCompatibleBit = 16,
    aliasBit = 1024,
    splitInstanceBindRegionsBit = 64,
    i2DArrayCompatibleBit = 32,
    blockTexelViewCompatibleBit = 128,
    extendedUsageBit = 256,
    protectedBit = 2048,
    disjointBit = 512,
    cornerSampledBitNv = 8192,
    sampleLocationsCompatibleDepthBitExt = 4096,
    splitInstanceBindRegionsBitKhr = 64,
    i2DArrayCompatibleBitKhr = 32,
    blockTexelViewCompatibleBitKhr = 128,
    extendedUsageBitKhr = 256,
    disjointBitKhr = 512,
    aliasBitKhr = 1024,
    flagBitsMaxEnum = 2147483647
}

alias VkImageCreateFlags = uint;

enum VkSampleCountFlag
{
    i1Bit = 1,
    i2Bit = 2,
    i4Bit = 4,
    i8Bit = 8,
    i16Bit = 16,
    i32Bit = 32,
    i64Bit = 64,
    flagBitsMaxEnum = 2147483647
}

alias VkSampleCountFlags = uint;

enum VkQueueFlag
{
    graphicsBit = 1,
    computeBit = 2,
    transferBit = 4,
    sparseBindingBit = 8,
    protectedBit = 16,
    flagBitsMaxEnum = 2147483647
}

alias VkQueueFlags = uint;

enum VkMemoryPropertyFlag
{
    deviceLocalBit = 1,
    hostVisibleBit = 2,
    hostCoherentBit = 4,
    hostCachedBit = 8,
    lazilyAllocatedBit = 16,
    protectedBit = 32,
    flagBitsMaxEnum = 2147483647
}

alias VkMemoryPropertyFlags = uint;

enum VkMemoryHeapFlag
{
    deviceLocalBit = 1,
    multiInstanceBit = 2,
    multiInstanceBitKhr = 2,
    flagBitsMaxEnum = 2147483647
}

alias VkMemoryHeapFlags = uint;
alias VkDeviceCreateFlags = uint;

enum VkDeviceQueueCreateFlag
{
    protectedBit = 1,
    flagBitsMaxEnum = 2147483647
}

alias VkDeviceQueueCreateFlags = uint;

enum VkPipelineStageFlag
{
    topOfPipeBit = 1,
    drawIndirectBit = 2,
    vertexInputBit = 4,
    vertexShaderBit = 8,
    tessellationControlShaderBit = 16,
    tessellationEvaluationShaderBit = 32,
    geometryShaderBit = 64,
    fragmentShaderBit = 128,
    earlyFragmentTestsBit = 256,
    lateFragmentTestsBit = 512,
    colorAttachmentOutputBit = 1024,
    computeShaderBit = 2048,
    transferBit = 4096,
    bottomOfPipeBit = 8192,
    hostBit = 16384,
    allGraphicsBit = 32768,
    allCommandsBit = 65536,
    transformFeedbackBitExt = 16777216,
    conditionalRenderingBitExt = 262144,
    commandProcessBitNvx = 131072,
    shadingRateImageBitNv = 4194304,
    rayTracingShaderBitNv = 2097152,
    accelerationStructureBuildBitNv = 33554432,
    taskShaderBitNv = 524288,
    meshShaderBitNv = 1048576,
    flagBitsMaxEnum = 2147483647
}

alias VkPipelineStageFlags = uint;
alias VkMemoryMapFlags = uint;

enum VkImageAspectFlag
{
    colorBit = 1,
    depthBit = 2,
    stencilBit = 4,
    metadataBit = 8,
    plane0Bit = 16,
    plane1Bit = 32,
    plane2Bit = 64,
    memoryPlane0BitExt = 128,
    memoryPlane1BitExt = 256,
    memoryPlane2BitExt = 512,
    memoryPlane3BitExt = 1024,
    plane0BitKhr = 16,
    plane1BitKhr = 32,
    plane2BitKhr = 64,
    flagBitsMaxEnum = 2147483647
}

alias VkImageAspectFlags = uint;

enum VkSparseImageFormatFlag
{
    singleMiptailBit = 1,
    alignedMipSizeBit = 2,
    nonstandardBlockSizeBit = 4,
    flagBitsMaxEnum = 2147483647
}

alias VkSparseImageFormatFlags = uint;

enum VkSparseMemoryBindFlag
{
    metadataBit = 1,
    flagBitsMaxEnum = 2147483647
}

alias VkSparseMemoryBindFlags = uint;

enum VkFenceCreateFlag
{
    signaledBit = 1,
    flagBitsMaxEnum = 2147483647
}

alias VkFenceCreateFlags = uint;
alias VkSemaphoreCreateFlags = uint;
alias VkEventCreateFlags = uint;
alias VkQueryPoolCreateFlags = uint;

enum VkQueryPipelineStatisticFlag
{
    inputAssemblyVerticesBit = 1,
    inputAssemblyPrimitivesBit = 2,
    vertexShaderInvocationsBit = 4,
    geometryShaderInvocationsBit = 8,
    geometryShaderPrimitivesBit = 16,
    clippingInvocationsBit = 32,
    clippingPrimitivesBit = 64,
    fragmentShaderInvocationsBit = 128,
    tessellationControlShaderPatchesBit = 256,
    tessellationEvaluationShaderInvocationsBit = 512,
    computeShaderInvocationsBit = 1024,
    flagBitsMaxEnum = 2147483647
}

alias VkQueryPipelineStatisticFlags = uint;

enum VkQueryResultFlag
{
    i64Bit = 1,
    waitBit = 2,
    withAvailabilityBit = 4,
    partialBit = 8,
    flagBitsMaxEnum = 2147483647
}

alias VkQueryResultFlags = uint;

enum VkBufferCreateFlag
{
    sparseBindingBit = 1,
    sparseResidencyBit = 2,
    sparseAliasedBit = 4,
    protectedBit = 8,
    flagBitsMaxEnum = 2147483647
}

alias VkBufferCreateFlags = uint;

enum VkBufferUsageFlag
{
    transferSrcBit = 1,
    transferDstBit = 2,
    uniformTexelBufferBit = 4,
    storageTexelBufferBit = 8,
    uniformBufferBit = 16,
    storageBufferBit = 32,
    indexBufferBit = 64,
    vertexBufferBit = 128,
    indirectBufferBit = 256,
    transformFeedbackBufferBitExt = 2048,
    transformFeedbackCounterBufferBitExt = 4096,
    conditionalRenderingBitExt = 512,
    rayTracingBitNv = 1024,
    flagBitsMaxEnum = 2147483647
}

alias VkBufferUsageFlags = uint;
alias VkBufferViewCreateFlags = uint;
alias VkImageViewCreateFlags = uint;
alias VkShaderModuleCreateFlags = uint;
alias VkPipelineCacheCreateFlags = uint;

enum VkPipelineCreateFlag
{
    disableOptimizationBit = 1,
    allowDerivativesBit = 2,
    derivativeBit = 4,
    viewIndexFromDeviceIndexBit = 8,
    dispatchBase = 16,
    deferCompileBitNv = 32,
    viewIndexFromDeviceIndexBitKhr = 8,
    dispatchBaseKhr = 16,
    flagBitsMaxEnum = 2147483647
}

alias VkPipelineCreateFlags = uint;
alias VkPipelineShaderStageCreateFlags = uint;

enum VkShaderStageFlag
{
    vertexBit = 1,
    tessellationControlBit = 2,
    tessellationEvaluationBit = 4,
    geometryBit = 8,
    fragmentBit = 16,
    computeBit = 32,
    allGraphics = 31,
    all = 2147483647,
    raygenBitNv = 256,
    anyHitBitNv = 512,
    closestHitBitNv = 1024,
    missBitNv = 2048,
    intersectionBitNv = 4096,
    callableBitNv = 8192,
    taskBitNv = 64,
    meshBitNv = 128,
    flagBitsMaxEnum = 2147483647
}

alias VkPipelineVertexInputStateCreateFlags = uint;
alias VkPipelineInputAssemblyStateCreateFlags = uint;
alias VkPipelineTessellationStateCreateFlags = uint;
alias VkPipelineViewportStateCreateFlags = uint;
alias VkPipelineRasterizationStateCreateFlags = uint;

enum VkCullModeFlag
{
    none = 0,
    frontBit = 1,
    backBit = 2,
    frontAndBack = 3,
    flagBitsMaxEnum = 2147483647
}

alias VkCullModeFlags = uint;
alias VkPipelineMultisampleStateCreateFlags = uint;
alias VkPipelineDepthStencilStateCreateFlags = uint;
alias VkPipelineColorBlendStateCreateFlags = uint;

enum VkColorComponentFlag
{
    rBit = 1,
    gBit = 2,
    bBit = 4,
    aBit = 8,
    flagBitsMaxEnum = 2147483647
}

alias VkColorComponentFlags = uint;
alias VkPipelineDynamicStateCreateFlags = uint;
alias VkPipelineLayoutCreateFlags = uint;
alias VkShaderStageFlags = uint;
alias VkSamplerCreateFlags = uint;

enum VkDescriptorSetLayoutCreateFlag
{
    pushDescriptorBitKhr = 1,
    updateAfterBindPoolBitExt = 2,
    flagBitsMaxEnum = 2147483647
}

alias VkDescriptorSetLayoutCreateFlags = uint;

enum VkDescriptorPoolCreateFlag
{
    freeDescriptorSetBit = 1,
    updateAfterBindBitExt = 2,
    flagBitsMaxEnum = 2147483647
}

alias VkDescriptorPoolCreateFlags = uint;
alias VkDescriptorPoolResetFlags = uint;
alias VkFramebufferCreateFlags = uint;
alias VkRenderPassCreateFlags = uint;

enum VkAttachmentDescriptionFlag
{
    mayAliasBit = 1,
    flagBitsMaxEnum = 2147483647
}

alias VkAttachmentDescriptionFlags = uint;

enum VkSubpassDescriptionFlag
{
    perViewAttributesBitNvx = 1,
    perViewPositionXOnlyBitNvx = 2,
    flagBitsMaxEnum = 2147483647
}

alias VkSubpassDescriptionFlags = uint;

enum VkAccessFlag
{
    indirectCommandReadBit = 1,
    indexReadBit = 2,
    vertexAttributeReadBit = 4,
    uniformReadBit = 8,
    inputAttachmentReadBit = 16,
    shaderReadBit = 32,
    shaderWriteBit = 64,
    colorAttachmentReadBit = 128,
    colorAttachmentWriteBit = 256,
    depthStencilAttachmentReadBit = 512,
    depthStencilAttachmentWriteBit = 1024,
    transferReadBit = 2048,
    transferWriteBit = 4096,
    hostReadBit = 8192,
    hostWriteBit = 16384,
    memoryReadBit = 32768,
    memoryWriteBit = 65536,
    transformFeedbackWriteBitExt = 33554432,
    transformFeedbackCounterReadBitExt = 67108864,
    transformFeedbackCounterWriteBitExt = 134217728,
    conditionalRenderingReadBitExt = 1048576,
    commandProcessReadBitNvx = 131072,
    commandProcessWriteBitNvx = 262144,
    colorAttachmentReadNoncoherentBitExt = 524288,
    shadingRateImageReadBitNv = 8388608,
    accelerationStructureReadBitNv = 2097152,
    accelerationStructureWriteBitNv = 4194304,
    flagBitsMaxEnum = 2147483647
}

alias VkAccessFlags = uint;

enum VkDependencyFlag
{
    byRegionBit = 1,
    deviceGroupBit = 4,
    viewLocalBit = 2,
    viewLocalBitKhr = 2,
    deviceGroupBitKhr = 4,
    flagBitsMaxEnum = 2147483647
}

alias VkDependencyFlags = uint;

enum VkCommandPoolCreateFlag
{
    transientBit = 1,
    resetCommandBufferBit = 2,
    protectedBit = 4,
    flagBitsMaxEnum = 2147483647
}

alias VkCommandPoolCreateFlags = uint;

enum VkCommandPoolResetFlag
{
    releaseResourcesBit = 1,
    flagBitsMaxEnum = 2147483647
}

alias VkCommandPoolResetFlags = uint;

enum VkCommandBufferUsageFlag
{
    oneTimeSubmitBit = 1,
    renderPassContinueBit = 2,
    simultaneousUseBit = 4,
    flagBitsMaxEnum = 2147483647
}

alias VkCommandBufferUsageFlags = uint;

enum VkQueryControlFlag
{
    preciseBit = 1,
    flagBitsMaxEnum = 2147483647
}

alias VkQueryControlFlags = uint;

enum VkCommandBufferResetFlag
{
    releaseResourcesBit = 1,
    flagBitsMaxEnum = 2147483647
}

alias VkCommandBufferResetFlags = uint;

enum VkStencilFaceFlag
{
    faceFrontBit = 1,
    faceBackBit = 2,
    frontAndBack = 3,
    faceFlagMaxEnum = 2147483647
}

alias VkStencilFaceFlags = uint;

enum VkRenderPassCreateFlag
{
    maxEnum = 2147483647
}

struct VkApplicationInfo
{
    VkStructureType sType;
    const(void)* pNext;
    const(char)* pApplicationName;
    uint applicationVersion;
    const(char)* pEngineName;
    uint engineVersion;
    uint apiVersion;
}

struct VkInstanceCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkInstanceCreateFlags flags;
    const(VkApplicationInfo)* pApplicationInfo;
    uint enabledLayerCount;
    const(char*)* ppEnabledLayerNames;
    uint enabledExtensionCount;
    const(char*)* ppEnabledExtensionNames;
}

alias PFN_vkAllocationFunction = void* function (
    void* pUserData,
    size_t size,
    size_t alignment,
    VkSystemAllocationScope allocationScope);

alias PFN_vkReallocationFunction = void* function (
    void* pUserData,
    void* pOriginal,
    size_t size,
    size_t alignment,
    VkSystemAllocationScope allocationScope);

alias PFN_vkFreeFunction = void function (void* pUserData, void* pMemory);

alias PFN_vkInternalAllocationNotification = void function (
    void* pUserData,
    size_t size,
    VkInternalAllocationType allocationType,
    VkSystemAllocationScope allocationScope);

alias PFN_vkInternalFreeNotification = void function (
    void* pUserData,
    size_t size,
    VkInternalAllocationType allocationType,
    VkSystemAllocationScope allocationScope);

struct VkAllocationCallbacks
{
    void* pUserData;
    PFN_vkAllocationFunction pfnAllocation;
    PFN_vkReallocationFunction pfnReallocation;
    PFN_vkFreeFunction pfnFree;
    PFN_vkInternalAllocationNotification pfnInternalAllocation;
    PFN_vkInternalFreeNotification pfnInternalFree;
}

struct VkPhysicalDeviceFeatures
{
    VkBool32 robustBufferAccess;
    VkBool32 fullDrawIndexUint32;
    VkBool32 imageCubeArray;
    VkBool32 independentBlend;
    VkBool32 geometryShader;
    VkBool32 tessellationShader;
    VkBool32 sampleRateShading;
    VkBool32 dualSrcBlend;
    VkBool32 logicOp;
    VkBool32 multiDrawIndirect;
    VkBool32 drawIndirectFirstInstance;
    VkBool32 depthClamp;
    VkBool32 depthBiasClamp;
    VkBool32 fillModeNonSolid;
    VkBool32 depthBounds;
    VkBool32 wideLines;
    VkBool32 largePoints;
    VkBool32 alphaToOne;
    VkBool32 multiViewport;
    VkBool32 samplerAnisotropy;
    VkBool32 textureCompressionETC2;
    VkBool32 textureCompressionASTC_LDR;
    VkBool32 textureCompressionBC;
    VkBool32 occlusionQueryPrecise;
    VkBool32 pipelineStatisticsQuery;
    VkBool32 vertexPipelineStoresAndAtomics;
    VkBool32 fragmentStoresAndAtomics;
    VkBool32 shaderTessellationAndGeometryPointSize;
    VkBool32 shaderImageGatherExtended;
    VkBool32 shaderStorageImageExtendedFormats;
    VkBool32 shaderStorageImageMultisample;
    VkBool32 shaderStorageImageReadWithoutFormat;
    VkBool32 shaderStorageImageWriteWithoutFormat;
    VkBool32 shaderUniformBufferArrayDynamicIndexing;
    VkBool32 shaderSampledImageArrayDynamicIndexing;
    VkBool32 shaderStorageBufferArrayDynamicIndexing;
    VkBool32 shaderStorageImageArrayDynamicIndexing;
    VkBool32 shaderClipDistance;
    VkBool32 shaderCullDistance;
    VkBool32 shaderFloat64;
    VkBool32 shaderInt64;
    VkBool32 shaderInt16;
    VkBool32 shaderResourceResidency;
    VkBool32 shaderResourceMinLod;
    VkBool32 sparseBinding;
    VkBool32 sparseResidencyBuffer;
    VkBool32 sparseResidencyImage2D;
    VkBool32 sparseResidencyImage3D;
    VkBool32 sparseResidency2Samples;
    VkBool32 sparseResidency4Samples;
    VkBool32 sparseResidency8Samples;
    VkBool32 sparseResidency16Samples;
    VkBool32 sparseResidencyAliased;
    VkBool32 variableMultisampleRate;
    VkBool32 inheritedQueries;
}

struct VkFormatProperties
{
    VkFormatFeatureFlags linearTilingFeatures;
    VkFormatFeatureFlags optimalTilingFeatures;
    VkFormatFeatureFlags bufferFeatures;
}

struct VkExtent3D
{
    uint width;
    uint height;
    uint depth;
}

struct VkImageFormatProperties
{
    VkExtent3D maxExtent;
    uint maxMipLevels;
    uint maxArrayLayers;
    VkSampleCountFlags sampleCounts;
    VkDeviceSize maxResourceSize;
}

struct VkPhysicalDeviceLimits
{
    uint maxImageDimension1D;
    uint maxImageDimension2D;
    uint maxImageDimension3D;
    uint maxImageDimensionCube;
    uint maxImageArrayLayers;
    uint maxTexelBufferElements;
    uint maxUniformBufferRange;
    uint maxStorageBufferRange;
    uint maxPushConstantsSize;
    uint maxMemoryAllocationCount;
    uint maxSamplerAllocationCount;
    VkDeviceSize bufferImageGranularity;
    VkDeviceSize sparseAddressSpaceSize;
    uint maxBoundDescriptorSets;
    uint maxPerStageDescriptorSamplers;
    uint maxPerStageDescriptorUniformBuffers;
    uint maxPerStageDescriptorStorageBuffers;
    uint maxPerStageDescriptorSampledImages;
    uint maxPerStageDescriptorStorageImages;
    uint maxPerStageDescriptorInputAttachments;
    uint maxPerStageResources;
    uint maxDescriptorSetSamplers;
    uint maxDescriptorSetUniformBuffers;
    uint maxDescriptorSetUniformBuffersDynamic;
    uint maxDescriptorSetStorageBuffers;
    uint maxDescriptorSetStorageBuffersDynamic;
    uint maxDescriptorSetSampledImages;
    uint maxDescriptorSetStorageImages;
    uint maxDescriptorSetInputAttachments;
    uint maxVertexInputAttributes;
    uint maxVertexInputBindings;
    uint maxVertexInputAttributeOffset;
    uint maxVertexInputBindingStride;
    uint maxVertexOutputComponents;
    uint maxTessellationGenerationLevel;
    uint maxTessellationPatchSize;
    uint maxTessellationControlPerVertexInputComponents;
    uint maxTessellationControlPerVertexOutputComponents;
    uint maxTessellationControlPerPatchOutputComponents;
    uint maxTessellationControlTotalOutputComponents;
    uint maxTessellationEvaluationInputComponents;
    uint maxTessellationEvaluationOutputComponents;
    uint maxGeometryShaderInvocations;
    uint maxGeometryInputComponents;
    uint maxGeometryOutputComponents;
    uint maxGeometryOutputVertices;
    uint maxGeometryTotalOutputComponents;
    uint maxFragmentInputComponents;
    uint maxFragmentOutputAttachments;
    uint maxFragmentDualSrcAttachments;
    uint maxFragmentCombinedOutputResources;
    uint maxComputeSharedMemorySize;
    uint[3] maxComputeWorkGroupCount;
    uint maxComputeWorkGroupInvocations;
    uint[3] maxComputeWorkGroupSize;
    uint subPixelPrecisionBits;
    uint subTexelPrecisionBits;
    uint mipmapPrecisionBits;
    uint maxDrawIndexedIndexValue;
    uint maxDrawIndirectCount;
    float maxSamplerLodBias;
    float maxSamplerAnisotropy;
    uint maxViewports;
    uint[2] maxViewportDimensions;
    float[2] viewportBoundsRange;
    uint viewportSubPixelBits;
    size_t minMemoryMapAlignment;
    VkDeviceSize minTexelBufferOffsetAlignment;
    VkDeviceSize minUniformBufferOffsetAlignment;
    VkDeviceSize minStorageBufferOffsetAlignment;
    int minTexelOffset;
    uint maxTexelOffset;
    int minTexelGatherOffset;
    uint maxTexelGatherOffset;
    float minInterpolationOffset;
    float maxInterpolationOffset;
    uint subPixelInterpolationOffsetBits;
    uint maxFramebufferWidth;
    uint maxFramebufferHeight;
    uint maxFramebufferLayers;
    VkSampleCountFlags framebufferColorSampleCounts;
    VkSampleCountFlags framebufferDepthSampleCounts;
    VkSampleCountFlags framebufferStencilSampleCounts;
    VkSampleCountFlags framebufferNoAttachmentsSampleCounts;
    uint maxColorAttachments;
    VkSampleCountFlags sampledImageColorSampleCounts;
    VkSampleCountFlags sampledImageIntegerSampleCounts;
    VkSampleCountFlags sampledImageDepthSampleCounts;
    VkSampleCountFlags sampledImageStencilSampleCounts;
    VkSampleCountFlags storageImageSampleCounts;
    uint maxSampleMaskWords;
    VkBool32 timestampComputeAndGraphics;
    float timestampPeriod;
    uint maxClipDistances;
    uint maxCullDistances;
    uint maxCombinedClipAndCullDistances;
    uint discreteQueuePriorities;
    float[2] pointSizeRange;
    float[2] lineWidthRange;
    float pointSizeGranularity;
    float lineWidthGranularity;
    VkBool32 strictLines;
    VkBool32 standardSampleLocations;
    VkDeviceSize optimalBufferCopyOffsetAlignment;
    VkDeviceSize optimalBufferCopyRowPitchAlignment;
    VkDeviceSize nonCoherentAtomSize;
}

struct VkPhysicalDeviceSparseProperties
{
    VkBool32 residencyStandard2DBlockShape;
    VkBool32 residencyStandard2DMultisampleBlockShape;
    VkBool32 residencyStandard3DBlockShape;
    VkBool32 residencyAlignedMipSize;
    VkBool32 residencyNonResidentStrict;
}

struct VkPhysicalDeviceProperties
{
    uint apiVersion;
    uint driverVersion;
    uint vendorID;
    uint deviceID;
    VkPhysicalDeviceType deviceType;
    char[VK_MAX_PHYSICAL_DEVICE_NAME_SIZE] deviceName;
    ubyte[VK_UUID_SIZE] pipelineCacheUUID;
    VkPhysicalDeviceLimits limits;
    VkPhysicalDeviceSparseProperties sparseProperties;
}

struct VkQueueFamilyProperties
{
    VkQueueFlags queueFlags;
    uint queueCount;
    uint timestampValidBits;
    VkExtent3D minImageTransferGranularity;
}

struct VkMemoryType
{
    VkMemoryPropertyFlags propertyFlags;
    uint heapIndex;
}

struct VkMemoryHeap
{
    VkDeviceSize size;
    VkMemoryHeapFlags flags;
}

struct VkPhysicalDeviceMemoryProperties
{
    uint memoryTypeCount;
    VkMemoryType[VK_MAX_MEMORY_TYPES] memoryTypes;
    uint memoryHeapCount;
    VkMemoryHeap[VK_MAX_MEMORY_HEAPS] memoryHeaps;
}

alias PFN_vkVoidFunction = void function ();

struct VkDeviceQueueCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkDeviceQueueCreateFlags flags;
    uint queueFamilyIndex;
    uint queueCount;
    const(float)* pQueuePriorities;
}

struct VkDeviceCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkDeviceCreateFlags flags;
    uint queueCreateInfoCount;
    const(VkDeviceQueueCreateInfo)* pQueueCreateInfos;
    uint enabledLayerCount;
    const(char*)* ppEnabledLayerNames;
    uint enabledExtensionCount;
    const(char*)* ppEnabledExtensionNames;
    const(VkPhysicalDeviceFeatures)* pEnabledFeatures;
}

struct VkExtensionProperties
{
    char[VK_MAX_EXTENSION_NAME_SIZE] extensionName;
    uint specVersion;
}

struct VkLayerProperties
{
    char[VK_MAX_EXTENSION_NAME_SIZE] layerName;
    uint specVersion;
    uint implementationVersion;
    char[VK_MAX_DESCRIPTION_SIZE] description;
}

struct VkSubmitInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint waitSemaphoreCount;
    const(VkSemaphore)* pWaitSemaphores;
    const(VkPipelineStageFlags)* pWaitDstStageMask;
    uint commandBufferCount;
    const(VkCommandBuffer)* pCommandBuffers;
    uint signalSemaphoreCount;
    const(VkSemaphore)* pSignalSemaphores;
}

struct VkMemoryAllocateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkDeviceSize allocationSize;
    uint memoryTypeIndex;
}

struct VkMappedMemoryRange
{
    VkStructureType sType;
    const(void)* pNext;
    VkDeviceMemory memory;
    VkDeviceSize offset;
    VkDeviceSize size;
}

struct VkMemoryRequirements
{
    VkDeviceSize size;
    VkDeviceSize alignment;
    uint memoryTypeBits;
}

struct VkSparseImageFormatProperties
{
    VkImageAspectFlags aspectMask;
    VkExtent3D imageGranularity;
    VkSparseImageFormatFlags flags;
}

struct VkSparseImageMemoryRequirements
{
    VkSparseImageFormatProperties formatProperties;
    uint imageMipTailFirstLod;
    VkDeviceSize imageMipTailSize;
    VkDeviceSize imageMipTailOffset;
    VkDeviceSize imageMipTailStride;
}

struct VkSparseMemoryBind
{
    VkDeviceSize resourceOffset;
    VkDeviceSize size;
    VkDeviceMemory memory;
    VkDeviceSize memoryOffset;
    VkSparseMemoryBindFlags flags;
}

struct VkSparseBufferMemoryBindInfo
{
    VkBuffer buffer;
    uint bindCount;
    const(VkSparseMemoryBind)* pBinds;
}

struct VkSparseImageOpaqueMemoryBindInfo
{
    VkImage image;
    uint bindCount;
    const(VkSparseMemoryBind)* pBinds;
}

struct VkImageSubresource
{
    VkImageAspectFlags aspectMask;
    uint mipLevel;
    uint arrayLayer;
}

struct VkOffset3D
{
    int x;
    int y;
    int z;
}

struct VkSparseImageMemoryBind
{
    VkImageSubresource subresource;
    VkOffset3D offset;
    VkExtent3D extent;
    VkDeviceMemory memory;
    VkDeviceSize memoryOffset;
    VkSparseMemoryBindFlags flags;
}

struct VkSparseImageMemoryBindInfo
{
    VkImage image;
    uint bindCount;
    const(VkSparseImageMemoryBind)* pBinds;
}

struct VkBindSparseInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint waitSemaphoreCount;
    const(VkSemaphore)* pWaitSemaphores;
    uint bufferBindCount;
    const(VkSparseBufferMemoryBindInfo)* pBufferBinds;
    uint imageOpaqueBindCount;
    const(VkSparseImageOpaqueMemoryBindInfo)* pImageOpaqueBinds;
    uint imageBindCount;
    const(VkSparseImageMemoryBindInfo)* pImageBinds;
    uint signalSemaphoreCount;
    const(VkSemaphore)* pSignalSemaphores;
}

struct VkFenceCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkFenceCreateFlags flags;
}

struct VkSemaphoreCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkSemaphoreCreateFlags flags;
}

struct VkEventCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkEventCreateFlags flags;
}

struct VkQueryPoolCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkQueryPoolCreateFlags flags;
    VkQueryType queryType;
    uint queryCount;
    VkQueryPipelineStatisticFlags pipelineStatistics;
}

struct VkBufferCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkBufferCreateFlags flags;
    VkDeviceSize size;
    VkBufferUsageFlags usage;
    VkSharingMode sharingMode;
    uint queueFamilyIndexCount;
    const(uint)* pQueueFamilyIndices;
}

struct VkBufferViewCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkBufferViewCreateFlags flags;
    VkBuffer buffer;
    VkFormat format;
    VkDeviceSize offset;
    VkDeviceSize range;
}

struct VkImageCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkImageCreateFlags flags;
    VkImageType imageType;
    VkFormat format;
    VkExtent3D extent;
    uint mipLevels;
    uint arrayLayers;
    VkSampleCountFlag samples;
    VkImageTiling tiling;
    VkImageUsageFlags usage;
    VkSharingMode sharingMode;
    uint queueFamilyIndexCount;
    const(uint)* pQueueFamilyIndices;
    VkImageLayout initialLayout;
}

struct VkSubresourceLayout
{
    VkDeviceSize offset;
    VkDeviceSize size;
    VkDeviceSize rowPitch;
    VkDeviceSize arrayPitch;
    VkDeviceSize depthPitch;
}

struct VkComponentMapping
{
    VkComponentSwizzle r;
    VkComponentSwizzle g;
    VkComponentSwizzle b;
    VkComponentSwizzle a;
}

struct VkImageSubresourceRange
{
    VkImageAspectFlags aspectMask;
    uint baseMipLevel;
    uint levelCount;
    uint baseArrayLayer;
    uint layerCount;
}

struct VkImageViewCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkImageViewCreateFlags flags;
    VkImage image;
    VkImageViewType viewType;
    VkFormat format;
    VkComponentMapping components;
    VkImageSubresourceRange subresourceRange;
}

struct VkShaderModuleCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkShaderModuleCreateFlags flags;
    size_t codeSize;
    const(uint)* pCode;
}

struct VkPipelineCacheCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineCacheCreateFlags flags;
    size_t initialDataSize;
    const(void)* pInitialData;
}

struct VkSpecializationMapEntry
{
    uint constantID;
    uint offset;
    size_t size;
}

struct VkSpecializationInfo
{
    uint mapEntryCount;
    const(VkSpecializationMapEntry)* pMapEntries;
    size_t dataSize;
    const(void)* pData;
}

struct VkPipelineShaderStageCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineShaderStageCreateFlags flags;
    VkShaderStageFlag stage;
    VkShaderModule module_;
    const(char)* pName;
    const(VkSpecializationInfo)* pSpecializationInfo;
}

struct VkVertexInputBindingDescription
{
    uint binding;
    uint stride;
    VkVertexInputRate inputRate;
}

struct VkVertexInputAttributeDescription
{
    uint location;
    uint binding;
    VkFormat format;
    uint offset;
}

struct VkPipelineVertexInputStateCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineVertexInputStateCreateFlags flags;
    uint vertexBindingDescriptionCount;
    const(VkVertexInputBindingDescription)* pVertexBindingDescriptions;
    uint vertexAttributeDescriptionCount;
    const(VkVertexInputAttributeDescription)* pVertexAttributeDescriptions;
}

struct VkPipelineInputAssemblyStateCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineInputAssemblyStateCreateFlags flags;
    VkPrimitiveTopology topology;
    VkBool32 primitiveRestartEnable;
}

struct VkPipelineTessellationStateCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineTessellationStateCreateFlags flags;
    uint patchControlPoints;
}

struct VkViewport
{
    float x;
    float y;
    float width;
    float height;
    float minDepth;
    float maxDepth;
}

struct VkOffset2D
{
    int x;
    int y;
}

struct VkExtent2D
{
    uint width;
    uint height;
}

struct VkRect2D
{
    VkOffset2D offset;
    VkExtent2D extent;
}

struct VkPipelineViewportStateCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineViewportStateCreateFlags flags;
    uint viewportCount;
    const(VkViewport)* pViewports;
    uint scissorCount;
    const(VkRect2D)* pScissors;
}

struct VkPipelineRasterizationStateCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineRasterizationStateCreateFlags flags;
    VkBool32 depthClampEnable;
    VkBool32 rasterizerDiscardEnable;
    VkPolygonMode polygonMode;
    VkCullModeFlags cullMode;
    VkFrontFace frontFace;
    VkBool32 depthBiasEnable;
    float depthBiasConstantFactor;
    float depthBiasClamp;
    float depthBiasSlopeFactor;
    float lineWidth;
}

struct VkPipelineMultisampleStateCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineMultisampleStateCreateFlags flags;
    VkSampleCountFlag rasterizationSamples;
    VkBool32 sampleShadingEnable;
    float minSampleShading;
    const(VkSampleMask)* pSampleMask;
    VkBool32 alphaToCoverageEnable;
    VkBool32 alphaToOneEnable;
}

struct VkStencilOpState
{
    VkStencilOp failOp;
    VkStencilOp passOp;
    VkStencilOp depthFailOp;
    VkCompareOp compareOp;
    uint compareMask;
    uint writeMask;
    uint reference;
}

struct VkPipelineDepthStencilStateCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineDepthStencilStateCreateFlags flags;
    VkBool32 depthTestEnable;
    VkBool32 depthWriteEnable;
    VkCompareOp depthCompareOp;
    VkBool32 depthBoundsTestEnable;
    VkBool32 stencilTestEnable;
    VkStencilOpState front;
    VkStencilOpState back;
    float minDepthBounds;
    float maxDepthBounds;
}

struct VkPipelineColorBlendAttachmentState
{
    VkBool32 blendEnable;
    VkBlendFactor srcColorBlendFactor;
    VkBlendFactor dstColorBlendFactor;
    VkBlendOp colorBlendOp;
    VkBlendFactor srcAlphaBlendFactor;
    VkBlendFactor dstAlphaBlendFactor;
    VkBlendOp alphaBlendOp;
    VkColorComponentFlags colorWriteMask;
}

struct VkPipelineColorBlendStateCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineColorBlendStateCreateFlags flags;
    VkBool32 logicOpEnable;
    VkLogicOp logicOp;
    uint attachmentCount;
    const(VkPipelineColorBlendAttachmentState)* pAttachments;
    float[4] blendConstants;
}

struct VkPipelineDynamicStateCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineDynamicStateCreateFlags flags;
    uint dynamicStateCount;
    const(VkDynamicState)* pDynamicStates;
}

struct VkGraphicsPipelineCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineCreateFlags flags;
    uint stageCount;
    const(VkPipelineShaderStageCreateInfo)* pStages;
    const(VkPipelineVertexInputStateCreateInfo)* pVertexInputState;
    const(VkPipelineInputAssemblyStateCreateInfo)* pInputAssemblyState;
    const(VkPipelineTessellationStateCreateInfo)* pTessellationState;
    const(VkPipelineViewportStateCreateInfo)* pViewportState;
    const(VkPipelineRasterizationStateCreateInfo)* pRasterizationState;
    const(VkPipelineMultisampleStateCreateInfo)* pMultisampleState;
    const(VkPipelineDepthStencilStateCreateInfo)* pDepthStencilState;
    const(VkPipelineColorBlendStateCreateInfo)* pColorBlendState;
    const(VkPipelineDynamicStateCreateInfo)* pDynamicState;
    VkPipelineLayout layout;
    VkRenderPass renderPass;
    uint subpass;
    VkPipeline basePipelineHandle;
    int basePipelineIndex;
}

struct VkComputePipelineCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineCreateFlags flags;
    VkPipelineShaderStageCreateInfo stage;
    VkPipelineLayout layout;
    VkPipeline basePipelineHandle;
    int basePipelineIndex;
}

struct VkPushConstantRange
{
    VkShaderStageFlags stageFlags;
    uint offset;
    uint size;
}

struct VkPipelineLayoutCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineLayoutCreateFlags flags;
    uint setLayoutCount;
    const(VkDescriptorSetLayout)* pSetLayouts;
    uint pushConstantRangeCount;
    const(VkPushConstantRange)* pPushConstantRanges;
}

struct VkSamplerCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkSamplerCreateFlags flags;
    VkFilter magFilter;
    VkFilter minFilter;
    VkSamplerMipmapMode mipmapMode;
    VkSamplerAddressMode addressModeU;
    VkSamplerAddressMode addressModeV;
    VkSamplerAddressMode addressModeW;
    float mipLodBias;
    VkBool32 anisotropyEnable;
    float maxAnisotropy;
    VkBool32 compareEnable;
    VkCompareOp compareOp;
    float minLod;
    float maxLod;
    VkBorderColor borderColor;
    VkBool32 unnormalizedCoordinates;
}

struct VkDescriptorSetLayoutBinding
{
    uint binding;
    VkDescriptorType descriptorType;
    uint descriptorCount;
    VkShaderStageFlags stageFlags;
    const(VkSampler)* pImmutableSamplers;
}

struct VkDescriptorSetLayoutCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkDescriptorSetLayoutCreateFlags flags;
    uint bindingCount;
    const(VkDescriptorSetLayoutBinding)* pBindings;
}

struct VkDescriptorPoolSize
{
    VkDescriptorType type;
    uint descriptorCount;
}

struct VkDescriptorPoolCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkDescriptorPoolCreateFlags flags;
    uint maxSets;
    uint poolSizeCount;
    const(VkDescriptorPoolSize)* pPoolSizes;
}

struct VkDescriptorSetAllocateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkDescriptorPool descriptorPool;
    uint descriptorSetCount;
    const(VkDescriptorSetLayout)* pSetLayouts;
}

struct VkDescriptorImageInfo
{
    VkSampler sampler;
    VkImageView imageView;
    VkImageLayout imageLayout;
}

struct VkDescriptorBufferInfo
{
    VkBuffer buffer;
    VkDeviceSize offset;
    VkDeviceSize range;
}

struct VkWriteDescriptorSet
{
    VkStructureType sType;
    const(void)* pNext;
    VkDescriptorSet dstSet;
    uint dstBinding;
    uint dstArrayElement;
    uint descriptorCount;
    VkDescriptorType descriptorType;
    const(VkDescriptorImageInfo)* pImageInfo;
    const(VkDescriptorBufferInfo)* pBufferInfo;
    const(VkBufferView)* pTexelBufferView;
}

struct VkCopyDescriptorSet
{
    VkStructureType sType;
    const(void)* pNext;
    VkDescriptorSet srcSet;
    uint srcBinding;
    uint srcArrayElement;
    VkDescriptorSet dstSet;
    uint dstBinding;
    uint dstArrayElement;
    uint descriptorCount;
}

struct VkFramebufferCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkFramebufferCreateFlags flags;
    VkRenderPass renderPass;
    uint attachmentCount;
    const(VkImageView)* pAttachments;
    uint width;
    uint height;
    uint layers;
}

struct VkAttachmentDescription
{
    VkAttachmentDescriptionFlags flags;
    VkFormat format;
    VkSampleCountFlag samples;
    VkAttachmentLoadOp loadOp;
    VkAttachmentStoreOp storeOp;
    VkAttachmentLoadOp stencilLoadOp;
    VkAttachmentStoreOp stencilStoreOp;
    VkImageLayout initialLayout;
    VkImageLayout finalLayout;
}

struct VkAttachmentReference
{
    uint attachment;
    VkImageLayout layout;
}

struct VkSubpassDescription
{
    VkSubpassDescriptionFlags flags;
    VkPipelineBindPoint pipelineBindPoint;
    uint inputAttachmentCount;
    const(VkAttachmentReference)* pInputAttachments;
    uint colorAttachmentCount;
    const(VkAttachmentReference)* pColorAttachments;
    const(VkAttachmentReference)* pResolveAttachments;
    const(VkAttachmentReference)* pDepthStencilAttachment;
    uint preserveAttachmentCount;
    const(uint)* pPreserveAttachments;
}

struct VkSubpassDependency
{
    uint srcSubpass;
    uint dstSubpass;
    VkPipelineStageFlags srcStageMask;
    VkPipelineStageFlags dstStageMask;
    VkAccessFlags srcAccessMask;
    VkAccessFlags dstAccessMask;
    VkDependencyFlags dependencyFlags;
}

struct VkRenderPassCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkRenderPassCreateFlags flags;
    uint attachmentCount;
    const(VkAttachmentDescription)* pAttachments;
    uint subpassCount;
    const(VkSubpassDescription)* pSubpasses;
    uint dependencyCount;
    const(VkSubpassDependency)* pDependencies;
}

struct VkCommandPoolCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkCommandPoolCreateFlags flags;
    uint queueFamilyIndex;
}

struct VkCommandBufferAllocateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkCommandPool commandPool;
    VkCommandBufferLevel level;
    uint commandBufferCount;
}

struct VkCommandBufferInheritanceInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkRenderPass renderPass;
    uint subpass;
    VkFramebuffer framebuffer;
    VkBool32 occlusionQueryEnable;
    VkQueryControlFlags queryFlags;
    VkQueryPipelineStatisticFlags pipelineStatistics;
}

struct VkCommandBufferBeginInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkCommandBufferUsageFlags flags;
    const(VkCommandBufferInheritanceInfo)* pInheritanceInfo;
}

struct VkBufferCopy
{
    VkDeviceSize srcOffset;
    VkDeviceSize dstOffset;
    VkDeviceSize size;
}

struct VkImageSubresourceLayers
{
    VkImageAspectFlags aspectMask;
    uint mipLevel;
    uint baseArrayLayer;
    uint layerCount;
}

struct VkImageCopy
{
    VkImageSubresourceLayers srcSubresource;
    VkOffset3D srcOffset;
    VkImageSubresourceLayers dstSubresource;
    VkOffset3D dstOffset;
    VkExtent3D extent;
}

struct VkImageBlit
{
    VkImageSubresourceLayers srcSubresource;
    VkOffset3D[2] srcOffsets;
    VkImageSubresourceLayers dstSubresource;
    VkOffset3D[2] dstOffsets;
}

struct VkBufferImageCopy
{
    VkDeviceSize bufferOffset;
    uint bufferRowLength;
    uint bufferImageHeight;
    VkImageSubresourceLayers imageSubresource;
    VkOffset3D imageOffset;
    VkExtent3D imageExtent;
}

union VkClearColorValue
{
    float[4] float32;
    int[4] int32;
    uint[4] uint32;
}

struct VkClearDepthStencilValue
{
    float depth;
    uint stencil;
}

union VkClearValue
{
    VkClearColorValue color;
    VkClearDepthStencilValue depthStencil;
}

struct VkClearAttachment
{
    VkImageAspectFlags aspectMask;
    uint colorAttachment;
    VkClearValue clearValue;
}

struct VkClearRect
{
    VkRect2D rect;
    uint baseArrayLayer;
    uint layerCount;
}

struct VkImageResolve
{
    VkImageSubresourceLayers srcSubresource;
    VkOffset3D srcOffset;
    VkImageSubresourceLayers dstSubresource;
    VkOffset3D dstOffset;
    VkExtent3D extent;
}

struct VkMemoryBarrier
{
    VkStructureType sType;
    const(void)* pNext;
    VkAccessFlags srcAccessMask;
    VkAccessFlags dstAccessMask;
}

struct VkBufferMemoryBarrier
{
    VkStructureType sType;
    const(void)* pNext;
    VkAccessFlags srcAccessMask;
    VkAccessFlags dstAccessMask;
    uint srcQueueFamilyIndex;
    uint dstQueueFamilyIndex;
    VkBuffer buffer;
    VkDeviceSize offset;
    VkDeviceSize size;
}

struct VkImageMemoryBarrier
{
    VkStructureType sType;
    const(void)* pNext;
    VkAccessFlags srcAccessMask;
    VkAccessFlags dstAccessMask;
    VkImageLayout oldLayout;
    VkImageLayout newLayout;
    uint srcQueueFamilyIndex;
    uint dstQueueFamilyIndex;
    VkImage image;
    VkImageSubresourceRange subresourceRange;
}

struct VkRenderPassBeginInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkRenderPass renderPass;
    VkFramebuffer framebuffer;
    VkRect2D renderArea;
    uint clearValueCount;
    const(VkClearValue)* pClearValues;
}

struct VkDispatchIndirectCommand
{
    uint x;
    uint y;
    uint z;
}

struct VkDrawIndexedIndirectCommand
{
    uint indexCount;
    uint instanceCount;
    uint firstIndex;
    int vertexOffset;
    uint firstInstance;
}

struct VkDrawIndirectCommand
{
    uint vertexCount;
    uint instanceCount;
    uint firstVertex;
    uint firstInstance;
}

struct VkBaseOutStructure
{
    VkStructureType sType;
    VkBaseOutStructure* pNext;
}

struct VkBaseInStructure
{
    VkStructureType sType;
    const(VkBaseInStructure)* pNext;
}

alias PFN_vkCreateInstance = VkResult function (const(VkInstanceCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkInstance* pInstance);
alias PFN_vkDestroyInstance = void function (VkInstance instance, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkEnumeratePhysicalDevices = VkResult function (VkInstance instance, uint* pPhysicalDeviceCount, VkPhysicalDevice* pPhysicalDevices);
alias PFN_vkGetPhysicalDeviceFeatures = void function (VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures* pFeatures);
alias PFN_vkGetPhysicalDeviceFormatProperties = void function (VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties* pFormatProperties);
alias PFN_vkGetPhysicalDeviceImageFormatProperties = VkResult function (VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkImageFormatProperties* pImageFormatProperties);
alias PFN_vkGetPhysicalDeviceProperties = void function (VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties* pProperties);
alias PFN_vkGetPhysicalDeviceQueueFamilyProperties = void function (VkPhysicalDevice physicalDevice, uint* pQueueFamilyPropertyCount, VkQueueFamilyProperties* pQueueFamilyProperties);
alias PFN_vkGetPhysicalDeviceMemoryProperties = void function (VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties* pMemoryProperties);
alias PFN_vkGetInstanceProcAddr = void function (VkInstance instance, const(char)* pName) function (VkInstance instance, const(char)* pName);
alias PFN_vkGetDeviceProcAddr = void function (VkDevice device, const(char)* pName) function (VkDevice device, const(char)* pName);
alias PFN_vkCreateDevice = VkResult function (VkPhysicalDevice physicalDevice, const(VkDeviceCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkDevice* pDevice);
alias PFN_vkDestroyDevice = void function (VkDevice device, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkEnumerateInstanceExtensionProperties = VkResult function (const(char)* pLayerName, uint* pPropertyCount, VkExtensionProperties* pProperties);
alias PFN_vkEnumerateDeviceExtensionProperties = VkResult function (VkPhysicalDevice physicalDevice, const(char)* pLayerName, uint* pPropertyCount, VkExtensionProperties* pProperties);
alias PFN_vkEnumerateInstanceLayerProperties = VkResult function (uint* pPropertyCount, VkLayerProperties* pProperties);
alias PFN_vkEnumerateDeviceLayerProperties = VkResult function (VkPhysicalDevice physicalDevice, uint* pPropertyCount, VkLayerProperties* pProperties);
alias PFN_vkGetDeviceQueue = void function (VkDevice device, uint queueFamilyIndex, uint queueIndex, VkQueue* pQueue);
alias PFN_vkQueueSubmit = VkResult function (VkQueue queue, uint submitCount, const(VkSubmitInfo)* pSubmits, VkFence fence);
alias PFN_vkQueueWaitIdle = VkResult function (VkQueue queue);
alias PFN_vkDeviceWaitIdle = VkResult function (VkDevice device);
alias PFN_vkAllocateMemory = VkResult function (VkDevice device, const(VkMemoryAllocateInfo)* pAllocateInfo, const(VkAllocationCallbacks)* pAllocator, VkDeviceMemory* pMemory);
alias PFN_vkFreeMemory = void function (VkDevice device, VkDeviceMemory memory, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkMapMemory = VkResult function (VkDevice device, VkDeviceMemory memory, VkDeviceSize offset, VkDeviceSize size, VkMemoryMapFlags flags, void** ppData);
alias PFN_vkUnmapMemory = void function (VkDevice device, VkDeviceMemory memory);
alias PFN_vkFlushMappedMemoryRanges = VkResult function (VkDevice device, uint memoryRangeCount, const(VkMappedMemoryRange)* pMemoryRanges);
alias PFN_vkInvalidateMappedMemoryRanges = VkResult function (VkDevice device, uint memoryRangeCount, const(VkMappedMemoryRange)* pMemoryRanges);
alias PFN_vkGetDeviceMemoryCommitment = void function (VkDevice device, VkDeviceMemory memory, VkDeviceSize* pCommittedMemoryInBytes);
alias PFN_vkBindBufferMemory = VkResult function (VkDevice device, VkBuffer buffer, VkDeviceMemory memory, VkDeviceSize memoryOffset);
alias PFN_vkBindImageMemory = VkResult function (VkDevice device, VkImage image, VkDeviceMemory memory, VkDeviceSize memoryOffset);
alias PFN_vkGetBufferMemoryRequirements = void function (VkDevice device, VkBuffer buffer, VkMemoryRequirements* pMemoryRequirements);
alias PFN_vkGetImageMemoryRequirements = void function (VkDevice device, VkImage image, VkMemoryRequirements* pMemoryRequirements);
alias PFN_vkGetImageSparseMemoryRequirements = void function (VkDevice device, VkImage image, uint* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements* pSparseMemoryRequirements);
alias PFN_vkGetPhysicalDeviceSparseImageFormatProperties = void function (VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkSampleCountFlag samples, VkImageUsageFlags usage, VkImageTiling tiling, uint* pPropertyCount, VkSparseImageFormatProperties* pProperties);
alias PFN_vkQueueBindSparse = VkResult function (VkQueue queue, uint bindInfoCount, const(VkBindSparseInfo)* pBindInfo, VkFence fence);
alias PFN_vkCreateFence = VkResult function (VkDevice device, const(VkFenceCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkFence* pFence);
alias PFN_vkDestroyFence = void function (VkDevice device, VkFence fence, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkResetFences = VkResult function (VkDevice device, uint fenceCount, const(VkFence)* pFences);
alias PFN_vkGetFenceStatus = VkResult function (VkDevice device, VkFence fence);
alias PFN_vkWaitForFences = VkResult function (VkDevice device, uint fenceCount, const(VkFence)* pFences, VkBool32 waitAll, ulong timeout);
alias PFN_vkCreateSemaphore = VkResult function (VkDevice device, const(VkSemaphoreCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkSemaphore* pSemaphore);
alias PFN_vkDestroySemaphore = void function (VkDevice device, VkSemaphore semaphore, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreateEvent = VkResult function (VkDevice device, const(VkEventCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkEvent* pEvent);
alias PFN_vkDestroyEvent = void function (VkDevice device, VkEvent event, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkGetEventStatus = VkResult function (VkDevice device, VkEvent event);
alias PFN_vkSetEvent = VkResult function (VkDevice device, VkEvent event);
alias PFN_vkResetEvent = VkResult function (VkDevice device, VkEvent event);
alias PFN_vkCreateQueryPool = VkResult function (VkDevice device, const(VkQueryPoolCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkQueryPool* pQueryPool);
alias PFN_vkDestroyQueryPool = void function (VkDevice device, VkQueryPool queryPool, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkGetQueryPoolResults = VkResult function (VkDevice device, VkQueryPool queryPool, uint firstQuery, uint queryCount, size_t dataSize, void* pData, VkDeviceSize stride, VkQueryResultFlags flags);
alias PFN_vkCreateBuffer = VkResult function (VkDevice device, const(VkBufferCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkBuffer* pBuffer);
alias PFN_vkDestroyBuffer = void function (VkDevice device, VkBuffer buffer, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreateBufferView = VkResult function (VkDevice device, const(VkBufferViewCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkBufferView* pView);
alias PFN_vkDestroyBufferView = void function (VkDevice device, VkBufferView bufferView, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreateImage = VkResult function (VkDevice device, const(VkImageCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkImage* pImage);
alias PFN_vkDestroyImage = void function (VkDevice device, VkImage image, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkGetImageSubresourceLayout = void function (VkDevice device, VkImage image, const(VkImageSubresource)* pSubresource, VkSubresourceLayout* pLayout);
alias PFN_vkCreateImageView = VkResult function (VkDevice device, const(VkImageViewCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkImageView* pView);
alias PFN_vkDestroyImageView = void function (VkDevice device, VkImageView imageView, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreateShaderModule = VkResult function (VkDevice device, const(VkShaderModuleCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkShaderModule* pShaderModule);
alias PFN_vkDestroyShaderModule = void function (VkDevice device, VkShaderModule shaderModule, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreatePipelineCache = VkResult function (VkDevice device, const(VkPipelineCacheCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkPipelineCache* pPipelineCache);
alias PFN_vkDestroyPipelineCache = void function (VkDevice device, VkPipelineCache pipelineCache, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkGetPipelineCacheData = VkResult function (VkDevice device, VkPipelineCache pipelineCache, size_t* pDataSize, void* pData);
alias PFN_vkMergePipelineCaches = VkResult function (VkDevice device, VkPipelineCache dstCache, uint srcCacheCount, const(VkPipelineCache)* pSrcCaches);
alias PFN_vkCreateGraphicsPipelines = VkResult function (VkDevice device, VkPipelineCache pipelineCache, uint createInfoCount, const(VkGraphicsPipelineCreateInfo)* pCreateInfos, const(VkAllocationCallbacks)* pAllocator, VkPipeline* pPipelines);
alias PFN_vkCreateComputePipelines = VkResult function (VkDevice device, VkPipelineCache pipelineCache, uint createInfoCount, const(VkComputePipelineCreateInfo)* pCreateInfos, const(VkAllocationCallbacks)* pAllocator, VkPipeline* pPipelines);
alias PFN_vkDestroyPipeline = void function (VkDevice device, VkPipeline pipeline, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreatePipelineLayout = VkResult function (VkDevice device, const(VkPipelineLayoutCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkPipelineLayout* pPipelineLayout);
alias PFN_vkDestroyPipelineLayout = void function (VkDevice device, VkPipelineLayout pipelineLayout, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreateSampler = VkResult function (VkDevice device, const(VkSamplerCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkSampler* pSampler);
alias PFN_vkDestroySampler = void function (VkDevice device, VkSampler sampler, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreateDescriptorSetLayout = VkResult function (VkDevice device, const(VkDescriptorSetLayoutCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkDescriptorSetLayout* pSetLayout);
alias PFN_vkDestroyDescriptorSetLayout = void function (VkDevice device, VkDescriptorSetLayout descriptorSetLayout, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreateDescriptorPool = VkResult function (VkDevice device, const(VkDescriptorPoolCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkDescriptorPool* pDescriptorPool);
alias PFN_vkDestroyDescriptorPool = void function (VkDevice device, VkDescriptorPool descriptorPool, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkResetDescriptorPool = VkResult function (VkDevice device, VkDescriptorPool descriptorPool, VkDescriptorPoolResetFlags flags);
alias PFN_vkAllocateDescriptorSets = VkResult function (VkDevice device, const(VkDescriptorSetAllocateInfo)* pAllocateInfo, VkDescriptorSet* pDescriptorSets);
alias PFN_vkFreeDescriptorSets = VkResult function (VkDevice device, VkDescriptorPool descriptorPool, uint descriptorSetCount, const(VkDescriptorSet)* pDescriptorSets);
alias PFN_vkUpdateDescriptorSets = void function (VkDevice device, uint descriptorWriteCount, const(VkWriteDescriptorSet)* pDescriptorWrites, uint descriptorCopyCount, const(VkCopyDescriptorSet)* pDescriptorCopies);
alias PFN_vkCreateFramebuffer = VkResult function (VkDevice device, const(VkFramebufferCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkFramebuffer* pFramebuffer);
alias PFN_vkDestroyFramebuffer = void function (VkDevice device, VkFramebuffer framebuffer, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreateRenderPass = VkResult function (VkDevice device, const(VkRenderPassCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkRenderPass* pRenderPass);
alias PFN_vkDestroyRenderPass = void function (VkDevice device, VkRenderPass renderPass, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkGetRenderAreaGranularity = void function (VkDevice device, VkRenderPass renderPass, VkExtent2D* pGranularity);
alias PFN_vkCreateCommandPool = VkResult function (VkDevice device, const(VkCommandPoolCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkCommandPool* pCommandPool);
alias PFN_vkDestroyCommandPool = void function (VkDevice device, VkCommandPool commandPool, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkResetCommandPool = VkResult function (VkDevice device, VkCommandPool commandPool, VkCommandPoolResetFlags flags);
alias PFN_vkAllocateCommandBuffers = VkResult function (VkDevice device, const(VkCommandBufferAllocateInfo)* pAllocateInfo, VkCommandBuffer* pCommandBuffers);
alias PFN_vkFreeCommandBuffers = void function (VkDevice device, VkCommandPool commandPool, uint commandBufferCount, const(VkCommandBuffer)* pCommandBuffers);
alias PFN_vkBeginCommandBuffer = VkResult function (VkCommandBuffer commandBuffer, const(VkCommandBufferBeginInfo)* pBeginInfo);
alias PFN_vkEndCommandBuffer = VkResult function (VkCommandBuffer commandBuffer);
alias PFN_vkResetCommandBuffer = VkResult function (VkCommandBuffer commandBuffer, VkCommandBufferResetFlags flags);
alias PFN_vkCmdBindPipeline = void function (VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline);
alias PFN_vkCmdSetViewport = void function (VkCommandBuffer commandBuffer, uint firstViewport, uint viewportCount, const(VkViewport)* pViewports);
alias PFN_vkCmdSetScissor = void function (VkCommandBuffer commandBuffer, uint firstScissor, uint scissorCount, const(VkRect2D)* pScissors);
alias PFN_vkCmdSetLineWidth = void function (VkCommandBuffer commandBuffer, float lineWidth);
alias PFN_vkCmdSetDepthBias = void function (VkCommandBuffer commandBuffer, float depthBiasConstantFactor, float depthBiasClamp, float depthBiasSlopeFactor);
alias PFN_vkCmdSetBlendConstants = void function (VkCommandBuffer commandBuffer, const(float)[4] blendConstants);
alias PFN_vkCmdSetDepthBounds = void function (VkCommandBuffer commandBuffer, float minDepthBounds, float maxDepthBounds);
alias PFN_vkCmdSetStencilCompareMask = void function (VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint compareMask);
alias PFN_vkCmdSetStencilWriteMask = void function (VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint writeMask);
alias PFN_vkCmdSetStencilReference = void function (VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint reference);
alias PFN_vkCmdBindDescriptorSets = void function (VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint firstSet, uint descriptorSetCount, const(VkDescriptorSet)* pDescriptorSets, uint dynamicOffsetCount, const(uint)* pDynamicOffsets);
alias PFN_vkCmdBindIndexBuffer = void function (VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkIndexType indexType);
alias PFN_vkCmdBindVertexBuffers = void function (VkCommandBuffer commandBuffer, uint firstBinding, uint bindingCount, const(VkBuffer)* pBuffers, const(VkDeviceSize)* pOffsets);
alias PFN_vkCmdDraw = void function (VkCommandBuffer commandBuffer, uint vertexCount, uint instanceCount, uint firstVertex, uint firstInstance);
alias PFN_vkCmdDrawIndexed = void function (VkCommandBuffer commandBuffer, uint indexCount, uint instanceCount, uint firstIndex, int vertexOffset, uint firstInstance);
alias PFN_vkCmdDrawIndirect = void function (VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint drawCount, uint stride);
alias PFN_vkCmdDrawIndexedIndirect = void function (VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint drawCount, uint stride);
alias PFN_vkCmdDispatch = void function (VkCommandBuffer commandBuffer, uint groupCountX, uint groupCountY, uint groupCountZ);
alias PFN_vkCmdDispatchIndirect = void function (VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset);
alias PFN_vkCmdCopyBuffer = void function (VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkBuffer dstBuffer, uint regionCount, const(VkBufferCopy)* pRegions);
alias PFN_vkCmdCopyImage = void function (VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint regionCount, const(VkImageCopy)* pRegions);
alias PFN_vkCmdBlitImage = void function (VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint regionCount, const(VkImageBlit)* pRegions, VkFilter filter);
alias PFN_vkCmdCopyBufferToImage = void function (VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkImage dstImage, VkImageLayout dstImageLayout, uint regionCount, const(VkBufferImageCopy)* pRegions);
alias PFN_vkCmdCopyImageToBuffer = void function (VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkBuffer dstBuffer, uint regionCount, const(VkBufferImageCopy)* pRegions);
alias PFN_vkCmdUpdateBuffer = void function (VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize dataSize, const(void)* pData);
alias PFN_vkCmdFillBuffer = void function (VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize size, uint data);
alias PFN_vkCmdClearColorImage = void function (VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, const(VkClearColorValue)* pColor, uint rangeCount, const(VkImageSubresourceRange)* pRanges);
alias PFN_vkCmdClearDepthStencilImage = void function (VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, const(VkClearDepthStencilValue)* pDepthStencil, uint rangeCount, const(VkImageSubresourceRange)* pRanges);
alias PFN_vkCmdClearAttachments = void function (VkCommandBuffer commandBuffer, uint attachmentCount, const(VkClearAttachment)* pAttachments, uint rectCount, const(VkClearRect)* pRects);
alias PFN_vkCmdResolveImage = void function (VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint regionCount, const(VkImageResolve)* pRegions);
alias PFN_vkCmdSetEvent = void function (VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask);
alias PFN_vkCmdResetEvent = void function (VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask);
alias PFN_vkCmdWaitEvents = void function (VkCommandBuffer commandBuffer, uint eventCount, const(VkEvent)* pEvents, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, uint memoryBarrierCount, const(VkMemoryBarrier)* pMemoryBarriers, uint bufferMemoryBarrierCount, const(VkBufferMemoryBarrier)* pBufferMemoryBarriers, uint imageMemoryBarrierCount, const(VkImageMemoryBarrier)* pImageMemoryBarriers);
alias PFN_vkCmdPipelineBarrier = void function (VkCommandBuffer commandBuffer, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, VkDependencyFlags dependencyFlags, uint memoryBarrierCount, const(VkMemoryBarrier)* pMemoryBarriers, uint bufferMemoryBarrierCount, const(VkBufferMemoryBarrier)* pBufferMemoryBarriers, uint imageMemoryBarrierCount, const(VkImageMemoryBarrier)* pImageMemoryBarriers);
alias PFN_vkCmdBeginQuery = void function (VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint query, VkQueryControlFlags flags);
alias PFN_vkCmdEndQuery = void function (VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint query);
alias PFN_vkCmdResetQueryPool = void function (VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint firstQuery, uint queryCount);
alias PFN_vkCmdWriteTimestamp = void function (VkCommandBuffer commandBuffer, VkPipelineStageFlag pipelineStage, VkQueryPool queryPool, uint query);
alias PFN_vkCmdCopyQueryPoolResults = void function (VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint firstQuery, uint queryCount, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize stride, VkQueryResultFlags flags);
alias PFN_vkCmdPushConstants = void function (VkCommandBuffer commandBuffer, VkPipelineLayout layout, VkShaderStageFlags stageFlags, uint offset, uint size, const(void)* pValues);
alias PFN_vkCmdBeginRenderPass = void function (VkCommandBuffer commandBuffer, const(VkRenderPassBeginInfo)* pRenderPassBegin, VkSubpassContents contents);
alias PFN_vkCmdNextSubpass = void function (VkCommandBuffer commandBuffer, VkSubpassContents contents);
alias PFN_vkCmdEndRenderPass = void function (VkCommandBuffer commandBuffer);
alias PFN_vkCmdExecuteCommands = void function (VkCommandBuffer commandBuffer, uint commandBufferCount, const(VkCommandBuffer)* pCommandBuffers);

VkResult vkCreateInstance (
    const(VkInstanceCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkInstance* pInstance);

void vkDestroyInstance (
    VkInstance instance,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkEnumeratePhysicalDevices (
    VkInstance instance,
    uint* pPhysicalDeviceCount,
    VkPhysicalDevice* pPhysicalDevices);

void vkGetPhysicalDeviceFeatures (
    VkPhysicalDevice physicalDevice,
    VkPhysicalDeviceFeatures* pFeatures);

void vkGetPhysicalDeviceFormatProperties (
    VkPhysicalDevice physicalDevice,
    VkFormat format,
    VkFormatProperties* pFormatProperties);

VkResult vkGetPhysicalDeviceImageFormatProperties (
    VkPhysicalDevice physicalDevice,
    VkFormat format,
    VkImageType type,
    VkImageTiling tiling,
    VkImageUsageFlags usage,
    VkImageCreateFlags flags,
    VkImageFormatProperties* pImageFormatProperties);

void vkGetPhysicalDeviceProperties (
    VkPhysicalDevice physicalDevice,
    VkPhysicalDeviceProperties* pProperties);

void vkGetPhysicalDeviceQueueFamilyProperties (
    VkPhysicalDevice physicalDevice,
    uint* pQueueFamilyPropertyCount,
    VkQueueFamilyProperties* pQueueFamilyProperties);

void vkGetPhysicalDeviceMemoryProperties (
    VkPhysicalDevice physicalDevice,
    VkPhysicalDeviceMemoryProperties* pMemoryProperties);

PFN_vkVoidFunction vkGetInstanceProcAddr (
    VkInstance instance,
    const(char)* pName);

PFN_vkVoidFunction vkGetDeviceProcAddr (VkDevice device, const(char)* pName);

VkResult vkCreateDevice (
    VkPhysicalDevice physicalDevice,
    const(VkDeviceCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkDevice* pDevice);

void vkDestroyDevice (
    VkDevice device,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkEnumerateInstanceExtensionProperties (
    const(char)* pLayerName,
    uint* pPropertyCount,
    VkExtensionProperties* pProperties);

VkResult vkEnumerateDeviceExtensionProperties (
    VkPhysicalDevice physicalDevice,
    const(char)* pLayerName,
    uint* pPropertyCount,
    VkExtensionProperties* pProperties);

VkResult vkEnumerateInstanceLayerProperties (
    uint* pPropertyCount,
    VkLayerProperties* pProperties);

VkResult vkEnumerateDeviceLayerProperties (
    VkPhysicalDevice physicalDevice,
    uint* pPropertyCount,
    VkLayerProperties* pProperties);

void vkGetDeviceQueue (
    VkDevice device,
    uint queueFamilyIndex,
    uint queueIndex,
    VkQueue* pQueue);

VkResult vkQueueSubmit (
    VkQueue queue,
    uint submitCount,
    const(VkSubmitInfo)* pSubmits,
    VkFence fence);

VkResult vkQueueWaitIdle (VkQueue queue);

VkResult vkDeviceWaitIdle (VkDevice device);

VkResult vkAllocateMemory (
    VkDevice device,
    const(VkMemoryAllocateInfo)* pAllocateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkDeviceMemory* pMemory);

void vkFreeMemory (
    VkDevice device,
    VkDeviceMemory memory,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkMapMemory (
    VkDevice device,
    VkDeviceMemory memory,
    VkDeviceSize offset,
    VkDeviceSize size,
    VkMemoryMapFlags flags,
    void** ppData);

void vkUnmapMemory (VkDevice device, VkDeviceMemory memory);

VkResult vkFlushMappedMemoryRanges (
    VkDevice device,
    uint memoryRangeCount,
    const(VkMappedMemoryRange)* pMemoryRanges);

VkResult vkInvalidateMappedMemoryRanges (
    VkDevice device,
    uint memoryRangeCount,
    const(VkMappedMemoryRange)* pMemoryRanges);

void vkGetDeviceMemoryCommitment (
    VkDevice device,
    VkDeviceMemory memory,
    VkDeviceSize* pCommittedMemoryInBytes);

VkResult vkBindBufferMemory (
    VkDevice device,
    VkBuffer buffer,
    VkDeviceMemory memory,
    VkDeviceSize memoryOffset);

VkResult vkBindImageMemory (
    VkDevice device,
    VkImage image,
    VkDeviceMemory memory,
    VkDeviceSize memoryOffset);

void vkGetBufferMemoryRequirements (
    VkDevice device,
    VkBuffer buffer,
    VkMemoryRequirements* pMemoryRequirements);

void vkGetImageMemoryRequirements (
    VkDevice device,
    VkImage image,
    VkMemoryRequirements* pMemoryRequirements);

void vkGetImageSparseMemoryRequirements (
    VkDevice device,
    VkImage image,
    uint* pSparseMemoryRequirementCount,
    VkSparseImageMemoryRequirements* pSparseMemoryRequirements);

void vkGetPhysicalDeviceSparseImageFormatProperties (
    VkPhysicalDevice physicalDevice,
    VkFormat format,
    VkImageType type,
    VkSampleCountFlag samples,
    VkImageUsageFlags usage,
    VkImageTiling tiling,
    uint* pPropertyCount,
    VkSparseImageFormatProperties* pProperties);

VkResult vkQueueBindSparse (
    VkQueue queue,
    uint bindInfoCount,
    const(VkBindSparseInfo)* pBindInfo,
    VkFence fence);

VkResult vkCreateFence (
    VkDevice device,
    const(VkFenceCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkFence* pFence);

void vkDestroyFence (
    VkDevice device,
    VkFence fence,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkResetFences (
    VkDevice device,
    uint fenceCount,
    const(VkFence)* pFences);

VkResult vkGetFenceStatus (VkDevice device, VkFence fence);

VkResult vkWaitForFences (
    VkDevice device,
    uint fenceCount,
    const(VkFence)* pFences,
    VkBool32 waitAll,
    ulong timeout);

VkResult vkCreateSemaphore (
    VkDevice device,
    const(VkSemaphoreCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkSemaphore* pSemaphore);

void vkDestroySemaphore (
    VkDevice device,
    VkSemaphore semaphore,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateEvent (
    VkDevice device,
    const(VkEventCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkEvent* pEvent);

void vkDestroyEvent (
    VkDevice device,
    VkEvent event,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkGetEventStatus (VkDevice device, VkEvent event);

VkResult vkSetEvent (VkDevice device, VkEvent event);

VkResult vkResetEvent (VkDevice device, VkEvent event);

VkResult vkCreateQueryPool (
    VkDevice device,
    const(VkQueryPoolCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkQueryPool* pQueryPool);

void vkDestroyQueryPool (
    VkDevice device,
    VkQueryPool queryPool,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkGetQueryPoolResults (
    VkDevice device,
    VkQueryPool queryPool,
    uint firstQuery,
    uint queryCount,
    size_t dataSize,
    void* pData,
    VkDeviceSize stride,
    VkQueryResultFlags flags);

VkResult vkCreateBuffer (
    VkDevice device,
    const(VkBufferCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkBuffer* pBuffer);

void vkDestroyBuffer (
    VkDevice device,
    VkBuffer buffer,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateBufferView (
    VkDevice device,
    const(VkBufferViewCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkBufferView* pView);

void vkDestroyBufferView (
    VkDevice device,
    VkBufferView bufferView,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateImage (
    VkDevice device,
    const(VkImageCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkImage* pImage);

void vkDestroyImage (
    VkDevice device,
    VkImage image,
    const(VkAllocationCallbacks)* pAllocator);

void vkGetImageSubresourceLayout (
    VkDevice device,
    VkImage image,
    const(VkImageSubresource)* pSubresource,
    VkSubresourceLayout* pLayout);

VkResult vkCreateImageView (
    VkDevice device,
    const(VkImageViewCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkImageView* pView);

void vkDestroyImageView (
    VkDevice device,
    VkImageView imageView,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateShaderModule (
    VkDevice device,
    const(VkShaderModuleCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkShaderModule* pShaderModule);

void vkDestroyShaderModule (
    VkDevice device,
    VkShaderModule shaderModule,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreatePipelineCache (
    VkDevice device,
    const(VkPipelineCacheCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkPipelineCache* pPipelineCache);

void vkDestroyPipelineCache (
    VkDevice device,
    VkPipelineCache pipelineCache,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkGetPipelineCacheData (
    VkDevice device,
    VkPipelineCache pipelineCache,
    size_t* pDataSize,
    void* pData);

VkResult vkMergePipelineCaches (
    VkDevice device,
    VkPipelineCache dstCache,
    uint srcCacheCount,
    const(VkPipelineCache)* pSrcCaches);

VkResult vkCreateGraphicsPipelines (
    VkDevice device,
    VkPipelineCache pipelineCache,
    uint createInfoCount,
    const(VkGraphicsPipelineCreateInfo)* pCreateInfos,
    const(VkAllocationCallbacks)* pAllocator,
    VkPipeline* pPipelines);

VkResult vkCreateComputePipelines (
    VkDevice device,
    VkPipelineCache pipelineCache,
    uint createInfoCount,
    const(VkComputePipelineCreateInfo)* pCreateInfos,
    const(VkAllocationCallbacks)* pAllocator,
    VkPipeline* pPipelines);

void vkDestroyPipeline (
    VkDevice device,
    VkPipeline pipeline,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreatePipelineLayout (
    VkDevice device,
    const(VkPipelineLayoutCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkPipelineLayout* pPipelineLayout);

void vkDestroyPipelineLayout (
    VkDevice device,
    VkPipelineLayout pipelineLayout,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateSampler (
    VkDevice device,
    const(VkSamplerCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkSampler* pSampler);

void vkDestroySampler (
    VkDevice device,
    VkSampler sampler,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateDescriptorSetLayout (
    VkDevice device,
    const(VkDescriptorSetLayoutCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkDescriptorSetLayout* pSetLayout);

void vkDestroyDescriptorSetLayout (
    VkDevice device,
    VkDescriptorSetLayout descriptorSetLayout,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateDescriptorPool (
    VkDevice device,
    const(VkDescriptorPoolCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkDescriptorPool* pDescriptorPool);

void vkDestroyDescriptorPool (
    VkDevice device,
    VkDescriptorPool descriptorPool,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkResetDescriptorPool (
    VkDevice device,
    VkDescriptorPool descriptorPool,
    VkDescriptorPoolResetFlags flags);

VkResult vkAllocateDescriptorSets (
    VkDevice device,
    const(VkDescriptorSetAllocateInfo)* pAllocateInfo,
    VkDescriptorSet* pDescriptorSets);

VkResult vkFreeDescriptorSets (
    VkDevice device,
    VkDescriptorPool descriptorPool,
    uint descriptorSetCount,
    const(VkDescriptorSet)* pDescriptorSets);

void vkUpdateDescriptorSets (
    VkDevice device,
    uint descriptorWriteCount,
    const(VkWriteDescriptorSet)* pDescriptorWrites,
    uint descriptorCopyCount,
    const(VkCopyDescriptorSet)* pDescriptorCopies);

VkResult vkCreateFramebuffer (
    VkDevice device,
    const(VkFramebufferCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkFramebuffer* pFramebuffer);

void vkDestroyFramebuffer (
    VkDevice device,
    VkFramebuffer framebuffer,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateRenderPass (
    VkDevice device,
    const(VkRenderPassCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkRenderPass* pRenderPass);

void vkDestroyRenderPass (
    VkDevice device,
    VkRenderPass renderPass,
    const(VkAllocationCallbacks)* pAllocator);

void vkGetRenderAreaGranularity (
    VkDevice device,
    VkRenderPass renderPass,
    VkExtent2D* pGranularity);

VkResult vkCreateCommandPool (
    VkDevice device,
    const(VkCommandPoolCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkCommandPool* pCommandPool);

void vkDestroyCommandPool (
    VkDevice device,
    VkCommandPool commandPool,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkResetCommandPool (
    VkDevice device,
    VkCommandPool commandPool,
    VkCommandPoolResetFlags flags);

VkResult vkAllocateCommandBuffers (
    VkDevice device,
    const(VkCommandBufferAllocateInfo)* pAllocateInfo,
    VkCommandBuffer* pCommandBuffers);

void vkFreeCommandBuffers (
    VkDevice device,
    VkCommandPool commandPool,
    uint commandBufferCount,
    const(VkCommandBuffer)* pCommandBuffers);

VkResult vkBeginCommandBuffer (
    VkCommandBuffer commandBuffer,
    const(VkCommandBufferBeginInfo)* pBeginInfo);

VkResult vkEndCommandBuffer (VkCommandBuffer commandBuffer);

VkResult vkResetCommandBuffer (
    VkCommandBuffer commandBuffer,
    VkCommandBufferResetFlags flags);

void vkCmdBindPipeline (
    VkCommandBuffer commandBuffer,
    VkPipelineBindPoint pipelineBindPoint,
    VkPipeline pipeline);

void vkCmdSetViewport (
    VkCommandBuffer commandBuffer,
    uint firstViewport,
    uint viewportCount,
    const(VkViewport)* pViewports);

void vkCmdSetScissor (
    VkCommandBuffer commandBuffer,
    uint firstScissor,
    uint scissorCount,
    const(VkRect2D)* pScissors);

void vkCmdSetLineWidth (VkCommandBuffer commandBuffer, float lineWidth);

void vkCmdSetDepthBias (
    VkCommandBuffer commandBuffer,
    float depthBiasConstantFactor,
    float depthBiasClamp,
    float depthBiasSlopeFactor);

void vkCmdSetBlendConstants (
    VkCommandBuffer commandBuffer,
    ref const(float)[4] blendConstants);

void vkCmdSetDepthBounds (
    VkCommandBuffer commandBuffer,
    float minDepthBounds,
    float maxDepthBounds);

void vkCmdSetStencilCompareMask (
    VkCommandBuffer commandBuffer,
    VkStencilFaceFlags faceMask,
    uint compareMask);

void vkCmdSetStencilWriteMask (
    VkCommandBuffer commandBuffer,
    VkStencilFaceFlags faceMask,
    uint writeMask);

void vkCmdSetStencilReference (
    VkCommandBuffer commandBuffer,
    VkStencilFaceFlags faceMask,
    uint reference);

void vkCmdBindDescriptorSets (
    VkCommandBuffer commandBuffer,
    VkPipelineBindPoint pipelineBindPoint,
    VkPipelineLayout layout,
    uint firstSet,
    uint descriptorSetCount,
    const(VkDescriptorSet)* pDescriptorSets,
    uint dynamicOffsetCount,
    const(uint)* pDynamicOffsets);

void vkCmdBindIndexBuffer (
    VkCommandBuffer commandBuffer,
    VkBuffer buffer,
    VkDeviceSize offset,
    VkIndexType indexType);

void vkCmdBindVertexBuffers (
    VkCommandBuffer commandBuffer,
    uint firstBinding,
    uint bindingCount,
    const(VkBuffer)* pBuffers,
    const(VkDeviceSize)* pOffsets);

void vkCmdDraw (
    VkCommandBuffer commandBuffer,
    uint vertexCount,
    uint instanceCount,
    uint firstVertex,
    uint firstInstance);

void vkCmdDrawIndexed (
    VkCommandBuffer commandBuffer,
    uint indexCount,
    uint instanceCount,
    uint firstIndex,
    int vertexOffset,
    uint firstInstance);

void vkCmdDrawIndirect (
    VkCommandBuffer commandBuffer,
    VkBuffer buffer,
    VkDeviceSize offset,
    uint drawCount,
    uint stride);

void vkCmdDrawIndexedIndirect (
    VkCommandBuffer commandBuffer,
    VkBuffer buffer,
    VkDeviceSize offset,
    uint drawCount,
    uint stride);

void vkCmdDispatch (
    VkCommandBuffer commandBuffer,
    uint groupCountX,
    uint groupCountY,
    uint groupCountZ);

void vkCmdDispatchIndirect (
    VkCommandBuffer commandBuffer,
    VkBuffer buffer,
    VkDeviceSize offset);

void vkCmdCopyBuffer (
    VkCommandBuffer commandBuffer,
    VkBuffer srcBuffer,
    VkBuffer dstBuffer,
    uint regionCount,
    const(VkBufferCopy)* pRegions);

void vkCmdCopyImage (
    VkCommandBuffer commandBuffer,
    VkImage srcImage,
    VkImageLayout srcImageLayout,
    VkImage dstImage,
    VkImageLayout dstImageLayout,
    uint regionCount,
    const(VkImageCopy)* pRegions);

void vkCmdBlitImage (
    VkCommandBuffer commandBuffer,
    VkImage srcImage,
    VkImageLayout srcImageLayout,
    VkImage dstImage,
    VkImageLayout dstImageLayout,
    uint regionCount,
    const(VkImageBlit)* pRegions,
    VkFilter filter);

void vkCmdCopyBufferToImage (
    VkCommandBuffer commandBuffer,
    VkBuffer srcBuffer,
    VkImage dstImage,
    VkImageLayout dstImageLayout,
    uint regionCount,
    const(VkBufferImageCopy)* pRegions);

void vkCmdCopyImageToBuffer (
    VkCommandBuffer commandBuffer,
    VkImage srcImage,
    VkImageLayout srcImageLayout,
    VkBuffer dstBuffer,
    uint regionCount,
    const(VkBufferImageCopy)* pRegions);

void vkCmdUpdateBuffer (
    VkCommandBuffer commandBuffer,
    VkBuffer dstBuffer,
    VkDeviceSize dstOffset,
    VkDeviceSize dataSize,
    const(void)* pData);

void vkCmdFillBuffer (
    VkCommandBuffer commandBuffer,
    VkBuffer dstBuffer,
    VkDeviceSize dstOffset,
    VkDeviceSize size,
    uint data);

void vkCmdClearColorImage (
    VkCommandBuffer commandBuffer,
    VkImage image,
    VkImageLayout imageLayout,
    const(VkClearColorValue)* pColor,
    uint rangeCount,
    const(VkImageSubresourceRange)* pRanges);

void vkCmdClearDepthStencilImage (
    VkCommandBuffer commandBuffer,
    VkImage image,
    VkImageLayout imageLayout,
    const(VkClearDepthStencilValue)* pDepthStencil,
    uint rangeCount,
    const(VkImageSubresourceRange)* pRanges);

void vkCmdClearAttachments (
    VkCommandBuffer commandBuffer,
    uint attachmentCount,
    const(VkClearAttachment)* pAttachments,
    uint rectCount,
    const(VkClearRect)* pRects);

void vkCmdResolveImage (
    VkCommandBuffer commandBuffer,
    VkImage srcImage,
    VkImageLayout srcImageLayout,
    VkImage dstImage,
    VkImageLayout dstImageLayout,
    uint regionCount,
    const(VkImageResolve)* pRegions);

void vkCmdSetEvent (
    VkCommandBuffer commandBuffer,
    VkEvent event,
    VkPipelineStageFlags stageMask);

void vkCmdResetEvent (
    VkCommandBuffer commandBuffer,
    VkEvent event,
    VkPipelineStageFlags stageMask);

void vkCmdWaitEvents (
    VkCommandBuffer commandBuffer,
    uint eventCount,
    const(VkEvent)* pEvents,
    VkPipelineStageFlags srcStageMask,
    VkPipelineStageFlags dstStageMask,
    uint memoryBarrierCount,
    const(VkMemoryBarrier)* pMemoryBarriers,
    uint bufferMemoryBarrierCount,
    const(VkBufferMemoryBarrier)* pBufferMemoryBarriers,
    uint imageMemoryBarrierCount,
    const(VkImageMemoryBarrier)* pImageMemoryBarriers);

void vkCmdPipelineBarrier (
    VkCommandBuffer commandBuffer,
    VkPipelineStageFlags srcStageMask,
    VkPipelineStageFlags dstStageMask,
    VkDependencyFlags dependencyFlags,
    uint memoryBarrierCount,
    const(VkMemoryBarrier)* pMemoryBarriers,
    uint bufferMemoryBarrierCount,
    const(VkBufferMemoryBarrier)* pBufferMemoryBarriers,
    uint imageMemoryBarrierCount,
    const(VkImageMemoryBarrier)* pImageMemoryBarriers);

void vkCmdBeginQuery (
    VkCommandBuffer commandBuffer,
    VkQueryPool queryPool,
    uint query,
    VkQueryControlFlags flags);

void vkCmdEndQuery (
    VkCommandBuffer commandBuffer,
    VkQueryPool queryPool,
    uint query);

void vkCmdResetQueryPool (
    VkCommandBuffer commandBuffer,
    VkQueryPool queryPool,
    uint firstQuery,
    uint queryCount);

void vkCmdWriteTimestamp (
    VkCommandBuffer commandBuffer,
    VkPipelineStageFlag pipelineStage,
    VkQueryPool queryPool,
    uint query);

void vkCmdCopyQueryPoolResults (
    VkCommandBuffer commandBuffer,
    VkQueryPool queryPool,
    uint firstQuery,
    uint queryCount,
    VkBuffer dstBuffer,
    VkDeviceSize dstOffset,
    VkDeviceSize stride,
    VkQueryResultFlags flags);

void vkCmdPushConstants (
    VkCommandBuffer commandBuffer,
    VkPipelineLayout layout,
    VkShaderStageFlags stageFlags,
    uint offset,
    uint size,
    const(void)* pValues);

void vkCmdBeginRenderPass (
    VkCommandBuffer commandBuffer,
    const(VkRenderPassBeginInfo)* pRenderPassBegin,
    VkSubpassContents contents);

void vkCmdNextSubpass (
    VkCommandBuffer commandBuffer,
    VkSubpassContents contents);

void vkCmdEndRenderPass (VkCommandBuffer commandBuffer);

void vkCmdExecuteCommands (
    VkCommandBuffer commandBuffer,
    uint commandBufferCount,
    const(VkCommandBuffer)* pCommandBuffers);

enum VK_VERSION_1_1 = 1;

enum VK_API_VERSION_1_1 = VK_MAKE_VERSION(1, 1, 0);

struct VkSamplerYcbcrConversion_T;
alias VkSamplerYcbcrConversion = VkSamplerYcbcrConversion_T*;
struct VkDescriptorUpdateTemplate_T;
alias VkDescriptorUpdateTemplate = VkDescriptorUpdateTemplate_T*;

enum VK_MAX_DEVICE_GROUP_SIZE = 32;
enum VK_LUID_SIZE = 8;
enum VK_QUEUE_FAMILY_EXTERNAL = ~0U - 1;

enum VkPointClippingBehavior
{
    allClipPlanes = 0,
    userClipPlanesOnly = 1,
    allClipPlanesKhr = 0,
    userClipPlanesOnlyKhr = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkTessellationDomainOrigin
{
    upperLeft = 0,
    lowerLeft = 1,
    upperLeftKhr = 0,
    lowerLeftKhr = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkSamplerYcbcrModelConversion
{
    rgbIdentity = 0,
    ycbcrIdentity = 1,
    ycbcr709 = 2,
    ycbcr601 = 3,
    ycbcr2020 = 4,
    rgbIdentityKhr = 0,
    ycbcrIdentityKhr = 1,
    ycbcr709Khr = 2,
    ycbcr601Khr = 3,
    ycbcr2020Khr = 4,
    beginRange = 0,
    endRange = 4,
    rangeSize = 5,
    maxEnum = 2147483647
}

enum VkSamplerYcbcrRange
{
    ituFull = 0,
    ituNarrow = 1,
    ituFullKhr = 0,
    ituNarrowKhr = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkChromaLocation
{
    cositedEven = 0,
    midpoint = 1,
    cositedEvenKhr = 0,
    midpointKhr = 1,
    beginRange = 0,
    endRange = 1,
    rangeSize = 2,
    maxEnum = 2147483647
}

enum VkDescriptorUpdateTemplateType
{
    descriptorSet = 0,
    pushDescriptorsKhr = 1,
    descriptorSetKhr = 0,
    beginRange = 0,
    endRange = 0,
    rangeSize = 1,
    maxEnum = 2147483647
}

enum VkSubgroupFeatureFlag
{
    basicBit = 1,
    voteBit = 2,
    arithmeticBit = 4,
    ballotBit = 8,
    shuffleBit = 16,
    shuffleRelativeBit = 32,
    clusteredBit = 64,
    quadBit = 128,
    partitionedBitNv = 256,
    flagBitsMaxEnum = 2147483647
}

alias VkSubgroupFeatureFlags = uint;

enum VkPeerMemoryFeatureFlag
{
    copySrcBit = 1,
    copyDstBit = 2,
    genericSrcBit = 4,
    genericDstBit = 8,
    copySrcBitKhr = 1,
    copyDstBitKhr = 2,
    genericSrcBitKhr = 4,
    genericDstBitKhr = 8,
    flagBitsMaxEnum = 2147483647
}

alias VkPeerMemoryFeatureFlags = uint;

enum VkMemoryAllocateFlag
{
    deviceMaskBit = 1,
    deviceMaskBitKhr = 1,
    flagBitsMaxEnum = 2147483647
}

alias VkMemoryAllocateFlags = uint;
alias VkCommandPoolTrimFlags = uint;
alias VkDescriptorUpdateTemplateCreateFlags = uint;

enum VkExternalMemoryHandleTypeFlag
{
    opaqueFdBit = 1,
    opaqueWin32Bit = 2,
    opaqueWin32KmtBit = 4,
    d3d11TextureBit = 8,
    d3d11TextureKmtBit = 16,
    d3d12HeapBit = 32,
    d3d12ResourceBit = 64,
    dmaBufBitExt = 512,
    androidHardwareBufferBitAndroid = 1024,
    hostAllocationBitExt = 128,
    hostMappedForeignMemoryBitExt = 256,
    opaqueFdBitKhr = 1,
    opaqueWin32BitKhr = 2,
    opaqueWin32KmtBitKhr = 4,
    d3d11TextureBitKhr = 8,
    d3d11TextureKmtBitKhr = 16,
    d3d12HeapBitKhr = 32,
    d3d12ResourceBitKhr = 64,
    flagBitsMaxEnum = 2147483647
}

alias VkExternalMemoryHandleTypeFlags = uint;

enum VkExternalMemoryFeatureFlag
{
    dedicatedOnlyBit = 1,
    exportableBit = 2,
    importableBit = 4,
    dedicatedOnlyBitKhr = 1,
    exportableBitKhr = 2,
    importableBitKhr = 4,
    flagBitsMaxEnum = 2147483647
}

alias VkExternalMemoryFeatureFlags = uint;

enum VkExternalFenceHandleTypeFlag
{
    opaqueFdBit = 1,
    opaqueWin32Bit = 2,
    opaqueWin32KmtBit = 4,
    syncFdBit = 8,
    opaqueFdBitKhr = 1,
    opaqueWin32BitKhr = 2,
    opaqueWin32KmtBitKhr = 4,
    syncFdBitKhr = 8,
    flagBitsMaxEnum = 2147483647
}

alias VkExternalFenceHandleTypeFlags = uint;

enum VkExternalFenceFeatureFlag
{
    exportableBit = 1,
    importableBit = 2,
    exportableBitKhr = 1,
    importableBitKhr = 2,
    flagBitsMaxEnum = 2147483647
}

alias VkExternalFenceFeatureFlags = uint;

enum VkFenceImportFlag
{
    temporaryBit = 1,
    temporaryBitKhr = 1,
    flagBitsMaxEnum = 2147483647
}

alias VkFenceImportFlags = uint;

enum VkSemaphoreImportFlag
{
    temporaryBit = 1,
    temporaryBitKhr = 1,
    flagBitsMaxEnum = 2147483647
}

alias VkSemaphoreImportFlags = uint;

enum VkExternalSemaphoreHandleTypeFlag
{
    opaqueFdBit = 1,
    opaqueWin32Bit = 2,
    opaqueWin32KmtBit = 4,
    d3d12FenceBit = 8,
    syncFdBit = 16,
    opaqueFdBitKhr = 1,
    opaqueWin32BitKhr = 2,
    opaqueWin32KmtBitKhr = 4,
    d3d12FenceBitKhr = 8,
    syncFdBitKhr = 16,
    flagBitsMaxEnum = 2147483647
}

alias VkExternalSemaphoreHandleTypeFlags = uint;

enum VkExternalSemaphoreFeatureFlag
{
    exportableBit = 1,
    importableBit = 2,
    exportableBitKhr = 1,
    importableBitKhr = 2,
    flagBitsMaxEnum = 2147483647
}

alias VkExternalSemaphoreFeatureFlags = uint;

struct VkPhysicalDeviceSubgroupProperties
{
    VkStructureType sType;
    void* pNext;
    uint subgroupSize;
    VkShaderStageFlags supportedStages;
    VkSubgroupFeatureFlags supportedOperations;
    VkBool32 quadOperationsInAllStages;
}

struct VkBindBufferMemoryInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkBuffer buffer;
    VkDeviceMemory memory;
    VkDeviceSize memoryOffset;
}

struct VkBindImageMemoryInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkImage image;
    VkDeviceMemory memory;
    VkDeviceSize memoryOffset;
}

struct VkPhysicalDevice16BitStorageFeatures
{
    VkStructureType sType;
    void* pNext;
    VkBool32 storageBuffer16BitAccess;
    VkBool32 uniformAndStorageBuffer16BitAccess;
    VkBool32 storagePushConstant16;
    VkBool32 storageInputOutput16;
}

struct VkMemoryDedicatedRequirements
{
    VkStructureType sType;
    void* pNext;
    VkBool32 prefersDedicatedAllocation;
    VkBool32 requiresDedicatedAllocation;
}

struct VkMemoryDedicatedAllocateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkImage image;
    VkBuffer buffer;
}

struct VkMemoryAllocateFlagsInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkMemoryAllocateFlags flags;
    uint deviceMask;
}

struct VkDeviceGroupRenderPassBeginInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint deviceMask;
    uint deviceRenderAreaCount;
    const(VkRect2D)* pDeviceRenderAreas;
}

struct VkDeviceGroupCommandBufferBeginInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint deviceMask;
}

struct VkDeviceGroupSubmitInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint waitSemaphoreCount;
    const(uint)* pWaitSemaphoreDeviceIndices;
    uint commandBufferCount;
    const(uint)* pCommandBufferDeviceMasks;
    uint signalSemaphoreCount;
    const(uint)* pSignalSemaphoreDeviceIndices;
}

struct VkDeviceGroupBindSparseInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint resourceDeviceIndex;
    uint memoryDeviceIndex;
}

struct VkBindBufferMemoryDeviceGroupInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint deviceIndexCount;
    const(uint)* pDeviceIndices;
}

struct VkBindImageMemoryDeviceGroupInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint deviceIndexCount;
    const(uint)* pDeviceIndices;
    uint splitInstanceBindRegionCount;
    const(VkRect2D)* pSplitInstanceBindRegions;
}

struct VkPhysicalDeviceGroupProperties
{
    VkStructureType sType;
    void* pNext;
    uint physicalDeviceCount;
    VkPhysicalDevice[VK_MAX_DEVICE_GROUP_SIZE] physicalDevices;
    VkBool32 subsetAllocation;
}

struct VkDeviceGroupDeviceCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint physicalDeviceCount;
    const(VkPhysicalDevice)* pPhysicalDevices;
}

struct VkBufferMemoryRequirementsInfo2
{
    VkStructureType sType;
    const(void)* pNext;
    VkBuffer buffer;
}

struct VkImageMemoryRequirementsInfo2
{
    VkStructureType sType;
    const(void)* pNext;
    VkImage image;
}

struct VkImageSparseMemoryRequirementsInfo2
{
    VkStructureType sType;
    const(void)* pNext;
    VkImage image;
}

struct VkMemoryRequirements2
{
    VkStructureType sType;
    void* pNext;
    VkMemoryRequirements memoryRequirements;
}

alias VkMemoryRequirements2KHR = VkMemoryRequirements2;

struct VkSparseImageMemoryRequirements2
{
    VkStructureType sType;
    void* pNext;
    VkSparseImageMemoryRequirements memoryRequirements;
}

struct VkPhysicalDeviceFeatures2
{
    VkStructureType sType;
    void* pNext;
    VkPhysicalDeviceFeatures features;
}

struct VkPhysicalDeviceProperties2
{
    VkStructureType sType;
    void* pNext;
    VkPhysicalDeviceProperties properties;
}

struct VkFormatProperties2
{
    VkStructureType sType;
    void* pNext;
    VkFormatProperties formatProperties;
}

struct VkImageFormatProperties2
{
    VkStructureType sType;
    void* pNext;
    VkImageFormatProperties imageFormatProperties;
}

struct VkPhysicalDeviceImageFormatInfo2
{
    VkStructureType sType;
    const(void)* pNext;
    VkFormat format;
    VkImageType type;
    VkImageTiling tiling;
    VkImageUsageFlags usage;
    VkImageCreateFlags flags;
}

struct VkQueueFamilyProperties2
{
    VkStructureType sType;
    void* pNext;
    VkQueueFamilyProperties queueFamilyProperties;
}

struct VkPhysicalDeviceMemoryProperties2
{
    VkStructureType sType;
    void* pNext;
    VkPhysicalDeviceMemoryProperties memoryProperties;
}

struct VkSparseImageFormatProperties2
{
    VkStructureType sType;
    void* pNext;
    VkSparseImageFormatProperties properties;
}

struct VkPhysicalDeviceSparseImageFormatInfo2
{
    VkStructureType sType;
    const(void)* pNext;
    VkFormat format;
    VkImageType type;
    VkSampleCountFlag samples;
    VkImageUsageFlags usage;
    VkImageTiling tiling;
}

struct VkPhysicalDevicePointClippingProperties
{
    VkStructureType sType;
    void* pNext;
    VkPointClippingBehavior pointClippingBehavior;
}

struct VkInputAttachmentAspectReference
{
    uint subpass;
    uint inputAttachmentIndex;
    VkImageAspectFlags aspectMask;
}

struct VkRenderPassInputAttachmentAspectCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint aspectReferenceCount;
    const(VkInputAttachmentAspectReference)* pAspectReferences;
}

struct VkImageViewUsageCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkImageUsageFlags usage;
}

struct VkPipelineTessellationDomainOriginStateCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkTessellationDomainOrigin domainOrigin;
}

struct VkRenderPassMultiviewCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    uint subpassCount;
    const(uint)* pViewMasks;
    uint dependencyCount;
    const(int)* pViewOffsets;
    uint correlationMaskCount;
    const(uint)* pCorrelationMasks;
}

struct VkPhysicalDeviceMultiviewFeatures
{
    VkStructureType sType;
    void* pNext;
    VkBool32 multiview;
    VkBool32 multiviewGeometryShader;
    VkBool32 multiviewTessellationShader;
}

struct VkPhysicalDeviceMultiviewProperties
{
    VkStructureType sType;
    void* pNext;
    uint maxMultiviewViewCount;
    uint maxMultiviewInstanceIndex;
}

struct VkPhysicalDeviceVariablePointerFeatures
{
    VkStructureType sType;
    void* pNext;
    VkBool32 variablePointersStorageBuffer;
    VkBool32 variablePointers;
}

struct VkPhysicalDeviceProtectedMemoryFeatures
{
    VkStructureType sType;
    void* pNext;
    VkBool32 protectedMemory;
}

struct VkPhysicalDeviceProtectedMemoryProperties
{
    VkStructureType sType;
    void* pNext;
    VkBool32 protectedNoFault;
}

struct VkDeviceQueueInfo2
{
    VkStructureType sType;
    const(void)* pNext;
    VkDeviceQueueCreateFlags flags;
    uint queueFamilyIndex;
    uint queueIndex;
}

struct VkProtectedSubmitInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkBool32 protectedSubmit;
}

struct VkSamplerYcbcrConversionCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkFormat format;
    VkSamplerYcbcrModelConversion ycbcrModel;
    VkSamplerYcbcrRange ycbcrRange;
    VkComponentMapping components;
    VkChromaLocation xChromaOffset;
    VkChromaLocation yChromaOffset;
    VkFilter chromaFilter;
    VkBool32 forceExplicitReconstruction;
}

struct VkSamplerYcbcrConversionInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkSamplerYcbcrConversion conversion;
}

struct VkBindImagePlaneMemoryInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkImageAspectFlag planeAspect;
}

struct VkImagePlaneMemoryRequirementsInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkImageAspectFlag planeAspect;
}

struct VkPhysicalDeviceSamplerYcbcrConversionFeatures
{
    VkStructureType sType;
    void* pNext;
    VkBool32 samplerYcbcrConversion;
}

struct VkSamplerYcbcrConversionImageFormatProperties
{
    VkStructureType sType;
    void* pNext;
    uint combinedImageSamplerDescriptorCount;
}

struct VkDescriptorUpdateTemplateEntry
{
    uint dstBinding;
    uint dstArrayElement;
    uint descriptorCount;
    VkDescriptorType descriptorType;
    size_t offset;
    size_t stride;
}

struct VkDescriptorUpdateTemplateCreateInfo
{
    VkStructureType sType;
    void* pNext;
    VkDescriptorUpdateTemplateCreateFlags flags;
    uint descriptorUpdateEntryCount;
    const(VkDescriptorUpdateTemplateEntry)* pDescriptorUpdateEntries;
    VkDescriptorUpdateTemplateType templateType;
    VkDescriptorSetLayout descriptorSetLayout;
    VkPipelineBindPoint pipelineBindPoint;
    VkPipelineLayout pipelineLayout;
    uint set;
}

struct VkExternalMemoryProperties
{
    VkExternalMemoryFeatureFlags externalMemoryFeatures;
    VkExternalMemoryHandleTypeFlags exportFromImportedHandleTypes;
    VkExternalMemoryHandleTypeFlags compatibleHandleTypes;
}

struct VkPhysicalDeviceExternalImageFormatInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalMemoryHandleTypeFlag handleType;
}

struct VkExternalImageFormatProperties
{
    VkStructureType sType;
    void* pNext;
    VkExternalMemoryProperties externalMemoryProperties;
}

struct VkPhysicalDeviceExternalBufferInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkBufferCreateFlags flags;
    VkBufferUsageFlags usage;
    VkExternalMemoryHandleTypeFlag handleType;
}

struct VkExternalBufferProperties
{
    VkStructureType sType;
    void* pNext;
    VkExternalMemoryProperties externalMemoryProperties;
}

struct VkPhysicalDeviceIDProperties
{
    VkStructureType sType;
    void* pNext;
    ubyte[VK_UUID_SIZE] deviceUUID;
    ubyte[VK_UUID_SIZE] driverUUID;
    ubyte[VK_LUID_SIZE] deviceLUID;
    uint deviceNodeMask;
    VkBool32 deviceLUIDValid;
}

struct VkExternalMemoryImageCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalMemoryHandleTypeFlags handleTypes;
}

struct VkExternalMemoryBufferCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalMemoryHandleTypeFlags handleTypes;
}

struct VkExportMemoryAllocateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalMemoryHandleTypeFlags handleTypes;
}

struct VkPhysicalDeviceExternalFenceInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalFenceHandleTypeFlag handleType;
}

struct VkExternalFenceProperties
{
    VkStructureType sType;
    void* pNext;
    VkExternalFenceHandleTypeFlags exportFromImportedHandleTypes;
    VkExternalFenceHandleTypeFlags compatibleHandleTypes;
    VkExternalFenceFeatureFlags externalFenceFeatures;
}

struct VkExportFenceCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalFenceHandleTypeFlags handleTypes;
}

struct VkExportSemaphoreCreateInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalSemaphoreHandleTypeFlags handleTypes;
}

struct VkPhysicalDeviceExternalSemaphoreInfo
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalSemaphoreHandleTypeFlag handleType;
}

struct VkExternalSemaphoreProperties
{
    VkStructureType sType;
    void* pNext;
    VkExternalSemaphoreHandleTypeFlags exportFromImportedHandleTypes;
    VkExternalSemaphoreHandleTypeFlags compatibleHandleTypes;
    VkExternalSemaphoreFeatureFlags externalSemaphoreFeatures;
}

struct VkPhysicalDeviceMaintenance3Properties
{
    VkStructureType sType;
    void* pNext;
    uint maxPerSetDescriptors;
    VkDeviceSize maxMemoryAllocationSize;
}

struct VkDescriptorSetLayoutSupport
{
    VkStructureType sType;
    void* pNext;
    VkBool32 supported;
}

struct VkPhysicalDeviceShaderDrawParameterFeatures
{
    VkStructureType sType;
    void* pNext;
    VkBool32 shaderDrawParameters;
}

alias PFN_vkEnumerateInstanceVersion = VkResult function (uint* pApiVersion);
alias PFN_vkBindBufferMemory2 = VkResult function (VkDevice device, uint bindInfoCount, const(VkBindBufferMemoryInfo)* pBindInfos);
alias PFN_vkBindImageMemory2 = VkResult function (VkDevice device, uint bindInfoCount, const(VkBindImageMemoryInfo)* pBindInfos);
alias PFN_vkGetDeviceGroupPeerMemoryFeatures = void function (VkDevice device, uint heapIndex, uint localDeviceIndex, uint remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures);
alias PFN_vkCmdSetDeviceMask = void function (VkCommandBuffer commandBuffer, uint deviceMask);
alias PFN_vkCmdDispatchBase = void function (VkCommandBuffer commandBuffer, uint baseGroupX, uint baseGroupY, uint baseGroupZ, uint groupCountX, uint groupCountY, uint groupCountZ);
alias PFN_vkEnumeratePhysicalDeviceGroups = VkResult function (VkInstance instance, uint* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties);
alias PFN_vkGetImageMemoryRequirements2 = void function (VkDevice device, const(VkImageMemoryRequirementsInfo2)* pInfo, VkMemoryRequirements2* pMemoryRequirements);
alias PFN_vkGetBufferMemoryRequirements2 = void function (VkDevice device, const(VkBufferMemoryRequirementsInfo2)* pInfo, VkMemoryRequirements2* pMemoryRequirements);
alias PFN_vkGetImageSparseMemoryRequirements2 = void function (VkDevice device, const(VkImageSparseMemoryRequirementsInfo2)* pInfo, uint* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements);
alias PFN_vkGetPhysicalDeviceFeatures2 = void function (VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures);
alias PFN_vkGetPhysicalDeviceProperties2 = void function (VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties);
alias PFN_vkGetPhysicalDeviceFormatProperties2 = void function (VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties);
alias PFN_vkGetPhysicalDeviceImageFormatProperties2 = VkResult function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceImageFormatInfo2)* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties);
alias PFN_vkGetPhysicalDeviceQueueFamilyProperties2 = void function (VkPhysicalDevice physicalDevice, uint* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties);
alias PFN_vkGetPhysicalDeviceMemoryProperties2 = void function (VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties);
alias PFN_vkGetPhysicalDeviceSparseImageFormatProperties2 = void function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceSparseImageFormatInfo2)* pFormatInfo, uint* pPropertyCount, VkSparseImageFormatProperties2* pProperties);
alias PFN_vkTrimCommandPool = void function (VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags);
alias PFN_vkGetDeviceQueue2 = void function (VkDevice device, const(VkDeviceQueueInfo2)* pQueueInfo, VkQueue* pQueue);
alias PFN_vkCreateSamplerYcbcrConversion = VkResult function (VkDevice device, const(VkSamplerYcbcrConversionCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion);
alias PFN_vkDestroySamplerYcbcrConversion = void function (VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreateDescriptorUpdateTemplate = VkResult function (VkDevice device, const(VkDescriptorUpdateTemplateCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate);
alias PFN_vkDestroyDescriptorUpdateTemplate = void function (VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkUpdateDescriptorSetWithTemplate = void function (VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, const(void)* pData);
alias PFN_vkGetPhysicalDeviceExternalBufferProperties = void function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceExternalBufferInfo)* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties);
alias PFN_vkGetPhysicalDeviceExternalFenceProperties = void function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceExternalFenceInfo)* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties);
alias PFN_vkGetPhysicalDeviceExternalSemaphoreProperties = void function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceExternalSemaphoreInfo)* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties);
alias PFN_vkGetDescriptorSetLayoutSupport = void function (VkDevice device, const(VkDescriptorSetLayoutCreateInfo)* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport);

VkResult vkEnumerateInstanceVersion (uint* pApiVersion);

VkResult vkBindBufferMemory2 (
    VkDevice device,
    uint bindInfoCount,
    const(VkBindBufferMemoryInfo)* pBindInfos);

VkResult vkBindImageMemory2 (
    VkDevice device,
    uint bindInfoCount,
    const(VkBindImageMemoryInfo)* pBindInfos);

void vkGetDeviceGroupPeerMemoryFeatures (
    VkDevice device,
    uint heapIndex,
    uint localDeviceIndex,
    uint remoteDeviceIndex,
    VkPeerMemoryFeatureFlags* pPeerMemoryFeatures);

void vkCmdSetDeviceMask (VkCommandBuffer commandBuffer, uint deviceMask);

void vkCmdDispatchBase (
    VkCommandBuffer commandBuffer,
    uint baseGroupX,
    uint baseGroupY,
    uint baseGroupZ,
    uint groupCountX,
    uint groupCountY,
    uint groupCountZ);

VkResult vkEnumeratePhysicalDeviceGroups (
    VkInstance instance,
    uint* pPhysicalDeviceGroupCount,
    VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties);

void vkGetImageMemoryRequirements2 (
    VkDevice device,
    const(VkImageMemoryRequirementsInfo2)* pInfo,
    VkMemoryRequirements2* pMemoryRequirements);

void vkGetBufferMemoryRequirements2 (
    VkDevice device,
    const(VkBufferMemoryRequirementsInfo2)* pInfo,
    VkMemoryRequirements2* pMemoryRequirements);

void vkGetImageSparseMemoryRequirements2 (
    VkDevice device,
    const(VkImageSparseMemoryRequirementsInfo2)* pInfo,
    uint* pSparseMemoryRequirementCount,
    VkSparseImageMemoryRequirements2* pSparseMemoryRequirements);

void vkGetPhysicalDeviceFeatures2 (
    VkPhysicalDevice physicalDevice,
    VkPhysicalDeviceFeatures2* pFeatures);

void vkGetPhysicalDeviceProperties2 (
    VkPhysicalDevice physicalDevice,
    VkPhysicalDeviceProperties2* pProperties);

void vkGetPhysicalDeviceFormatProperties2 (
    VkPhysicalDevice physicalDevice,
    VkFormat format,
    VkFormatProperties2* pFormatProperties);

VkResult vkGetPhysicalDeviceImageFormatProperties2 (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceImageFormatInfo2)* pImageFormatInfo,
    VkImageFormatProperties2* pImageFormatProperties);

void vkGetPhysicalDeviceQueueFamilyProperties2 (
    VkPhysicalDevice physicalDevice,
    uint* pQueueFamilyPropertyCount,
    VkQueueFamilyProperties2* pQueueFamilyProperties);

void vkGetPhysicalDeviceMemoryProperties2 (
    VkPhysicalDevice physicalDevice,
    VkPhysicalDeviceMemoryProperties2* pMemoryProperties);

void vkGetPhysicalDeviceSparseImageFormatProperties2 (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceSparseImageFormatInfo2)* pFormatInfo,
    uint* pPropertyCount,
    VkSparseImageFormatProperties2* pProperties);

void vkTrimCommandPool (
    VkDevice device,
    VkCommandPool commandPool,
    VkCommandPoolTrimFlags flags);

void vkGetDeviceQueue2 (
    VkDevice device,
    const(VkDeviceQueueInfo2)* pQueueInfo,
    VkQueue* pQueue);

VkResult vkCreateSamplerYcbcrConversion (
    VkDevice device,
    const(VkSamplerYcbcrConversionCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkSamplerYcbcrConversion* pYcbcrConversion);

void vkDestroySamplerYcbcrConversion (
    VkDevice device,
    VkSamplerYcbcrConversion ycbcrConversion,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateDescriptorUpdateTemplate (
    VkDevice device,
    const(VkDescriptorUpdateTemplateCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate);

void vkDestroyDescriptorUpdateTemplate (
    VkDevice device,
    VkDescriptorUpdateTemplate descriptorUpdateTemplate,
    const(VkAllocationCallbacks)* pAllocator);

void vkUpdateDescriptorSetWithTemplate (
    VkDevice device,
    VkDescriptorSet descriptorSet,
    VkDescriptorUpdateTemplate descriptorUpdateTemplate,
    const(void)* pData);

void vkGetPhysicalDeviceExternalBufferProperties (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceExternalBufferInfo)* pExternalBufferInfo,
    VkExternalBufferProperties* pExternalBufferProperties);

void vkGetPhysicalDeviceExternalFenceProperties (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceExternalFenceInfo)* pExternalFenceInfo,
    VkExternalFenceProperties* pExternalFenceProperties);

void vkGetPhysicalDeviceExternalSemaphoreProperties (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceExternalSemaphoreInfo)* pExternalSemaphoreInfo,
    VkExternalSemaphoreProperties* pExternalSemaphoreProperties);

void vkGetDescriptorSetLayoutSupport (
    VkDevice device,
    const(VkDescriptorSetLayoutCreateInfo)* pCreateInfo,
    VkDescriptorSetLayoutSupport* pSupport);

enum VK_KHR_surface = 1;
struct VkSurfaceKHR_T;
alias VkSurfaceKHR = VkSurfaceKHR_T*;

enum VK_KHR_SURFACE_SPEC_VERSION = 25;
enum VK_KHR_SURFACE_EXTENSION_NAME = "VK_KHR_surface";

enum VkColorSpaceKHR
{
    colorSpaceSrgbNonlinearKhr = 0,
    colorSpaceDisplayP3NonlinearExt = 1000104001,
    colorSpaceExtendedSrgbLinearExt = 1000104002,
    colorSpaceDciP3LinearExt = 1000104003,
    colorSpaceDciP3NonlinearExt = 1000104004,
    colorSpaceBt709LinearExt = 1000104005,
    colorSpaceBt709NonlinearExt = 1000104006,
    colorSpaceBt2020LinearExt = 1000104007,
    colorSpaceHdr10St2084Ext = 1000104008,
    colorSpaceDolbyvisionExt = 1000104009,
    colorSpaceHdr10HlgExt = 1000104010,
    colorSpaceAdobergbLinearExt = 1000104011,
    colorSpaceAdobergbNonlinearExt = 1000104012,
    colorSpacePassThroughExt = 1000104013,
    colorSpaceExtendedSrgbNonlinearExt = 1000104014,
    colorspaceSrgbNonlinearKhr = 0,
    colorSpaceBeginRangeKhr = 0,
    colorSpaceEndRangeKhr = 0,
    colorSpaceRangeSizeKhr = 1,
    colorSpaceMaxEnumKhr = 2147483647
}

enum VkPresentModeKHR
{
    immediateKhr = 0,
    mailboxKhr = 1,
    fifoKhr = 2,
    fifoRelaxedKhr = 3,
    sharedDemandRefreshKhr = 1000111000,
    sharedContinuousRefreshKhr = 1000111001,
    beginRangeKhr = 0,
    endRangeKhr = 3,
    rangeSizeKhr = 4,
    maxEnumKhr = 2147483647
}

enum VkSurfaceTransformFlagKHR
{
    identityBitKhr = 1,
    rotate90BitKhr = 2,
    rotate180BitKhr = 4,
    rotate270BitKhr = 8,
    horizontalMirrorBitKhr = 16,
    horizontalMirrorRotate90BitKhr = 32,
    horizontalMirrorRotate180BitKhr = 64,
    horizontalMirrorRotate270BitKhr = 128,
    inheritBitKhr = 256,
    flagBitsMaxEnumKhr = 2147483647
}

alias VkSurfaceTransformFlagsKHR = uint;

enum VkCompositeAlphaFlagKHR
{
    opaqueBitKhr = 1,
    preMultipliedBitKhr = 2,
    postMultipliedBitKhr = 4,
    inheritBitKhr = 8,
    flagBitsMaxEnumKhr = 2147483647
}

alias VkCompositeAlphaFlagsKHR = uint;

struct VkSurfaceCapabilitiesKHR
{
    uint minImageCount;
    uint maxImageCount;
    VkExtent2D currentExtent;
    VkExtent2D minImageExtent;
    VkExtent2D maxImageExtent;
    uint maxImageArrayLayers;
    VkSurfaceTransformFlagsKHR supportedTransforms;
    VkSurfaceTransformFlagKHR currentTransform;
    VkCompositeAlphaFlagsKHR supportedCompositeAlpha;
    VkImageUsageFlags supportedUsageFlags;
}

struct VkSurfaceFormatKHR
{
    VkFormat format;
    VkColorSpaceKHR colorSpace;
}

alias PFN_vkDestroySurfaceKHR = void function (VkInstance instance, VkSurfaceKHR surface, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkGetPhysicalDeviceSurfaceSupportKHR = VkResult function (VkPhysicalDevice physicalDevice, uint queueFamilyIndex, VkSurfaceKHR surface, VkBool32* pSupported);
alias PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = VkResult function (VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilitiesKHR* pSurfaceCapabilities);
alias PFN_vkGetPhysicalDeviceSurfaceFormatsKHR = VkResult function (VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint* pSurfaceFormatCount, VkSurfaceFormatKHR* pSurfaceFormats);
alias PFN_vkGetPhysicalDeviceSurfacePresentModesKHR = VkResult function (VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint* pPresentModeCount, VkPresentModeKHR* pPresentModes);

void vkDestroySurfaceKHR (
    VkInstance instance,
    VkSurfaceKHR surface,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkGetPhysicalDeviceSurfaceSupportKHR (
    VkPhysicalDevice physicalDevice,
    uint queueFamilyIndex,
    VkSurfaceKHR surface,
    VkBool32* pSupported);

VkResult vkGetPhysicalDeviceSurfaceCapabilitiesKHR (
    VkPhysicalDevice physicalDevice,
    VkSurfaceKHR surface,
    VkSurfaceCapabilitiesKHR* pSurfaceCapabilities);

VkResult vkGetPhysicalDeviceSurfaceFormatsKHR (
    VkPhysicalDevice physicalDevice,
    VkSurfaceKHR surface,
    uint* pSurfaceFormatCount,
    VkSurfaceFormatKHR* pSurfaceFormats);

VkResult vkGetPhysicalDeviceSurfacePresentModesKHR (
    VkPhysicalDevice physicalDevice,
    VkSurfaceKHR surface,
    uint* pPresentModeCount,
    VkPresentModeKHR* pPresentModes);

enum VK_KHR_swapchain = 1;
struct VkSwapchainKHR_T;
alias VkSwapchainKHR = VkSwapchainKHR_T*;

enum VK_KHR_SWAPCHAIN_SPEC_VERSION = 70;
enum VK_KHR_SWAPCHAIN_EXTENSION_NAME = "VK_KHR_swapchain";

enum VkSwapchainCreateFlagKHR
{
    splitInstanceBindRegionsBitKhr = 1,
    protectedBitKhr = 2,
    flagBitsMaxEnumKhr = 2147483647
}

alias VkSwapchainCreateFlagsKHR = uint;

enum VkDeviceGroupPresentModeFlagKHR
{
    localBitKhr = 1,
    remoteBitKhr = 2,
    sumBitKhr = 4,
    localMultiDeviceBitKhr = 8,
    flagBitsMaxEnumKhr = 2147483647
}

alias VkDeviceGroupPresentModeFlagsKHR = uint;

struct VkSwapchainCreateInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkSwapchainCreateFlagsKHR flags;
    VkSurfaceKHR surface;
    uint minImageCount;
    VkFormat imageFormat;
    VkColorSpaceKHR imageColorSpace;
    VkExtent2D imageExtent;
    uint imageArrayLayers;
    VkImageUsageFlags imageUsage;
    VkSharingMode imageSharingMode;
    uint queueFamilyIndexCount;
    const(uint)* pQueueFamilyIndices;
    VkSurfaceTransformFlagKHR preTransform;
    VkCompositeAlphaFlagKHR compositeAlpha;
    VkPresentModeKHR presentMode;
    VkBool32 clipped;
    VkSwapchainKHR oldSwapchain;
}

struct VkPresentInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    uint waitSemaphoreCount;
    const(VkSemaphore)* pWaitSemaphores;
    uint swapchainCount;
    const(VkSwapchainKHR)* pSwapchains;
    const(uint)* pImageIndices;
    VkResult* pResults;
}

struct VkImageSwapchainCreateInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkSwapchainKHR swapchain;
}

struct VkBindImageMemorySwapchainInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkSwapchainKHR swapchain;
    uint imageIndex;
}

struct VkAcquireNextImageInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkSwapchainKHR swapchain;
    ulong timeout;
    VkSemaphore semaphore;
    VkFence fence;
    uint deviceMask;
}

struct VkDeviceGroupPresentCapabilitiesKHR
{
    VkStructureType sType;
    const(void)* pNext;
    uint[VK_MAX_DEVICE_GROUP_SIZE] presentMask;
    VkDeviceGroupPresentModeFlagsKHR modes;
}

struct VkDeviceGroupPresentInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    uint swapchainCount;
    const(uint)* pDeviceMasks;
    VkDeviceGroupPresentModeFlagKHR mode;
}

struct VkDeviceGroupSwapchainCreateInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkDeviceGroupPresentModeFlagsKHR modes;
}

alias PFN_vkCreateSwapchainKHR = VkResult function (VkDevice device, const(VkSwapchainCreateInfoKHR)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkSwapchainKHR* pSwapchain);
alias PFN_vkDestroySwapchainKHR = void function (VkDevice device, VkSwapchainKHR swapchain, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkGetSwapchainImagesKHR = VkResult function (VkDevice device, VkSwapchainKHR swapchain, uint* pSwapchainImageCount, VkImage* pSwapchainImages);
alias PFN_vkAcquireNextImageKHR = VkResult function (VkDevice device, VkSwapchainKHR swapchain, ulong timeout, VkSemaphore semaphore, VkFence fence, uint* pImageIndex);
alias PFN_vkQueuePresentKHR = VkResult function (VkQueue queue, const(VkPresentInfoKHR)* pPresentInfo);
alias PFN_vkGetDeviceGroupPresentCapabilitiesKHR = VkResult function (VkDevice device, VkDeviceGroupPresentCapabilitiesKHR* pDeviceGroupPresentCapabilities);
alias PFN_vkGetDeviceGroupSurfacePresentModesKHR = VkResult function (VkDevice device, VkSurfaceKHR surface, VkDeviceGroupPresentModeFlagsKHR* pModes);
alias PFN_vkGetPhysicalDevicePresentRectanglesKHR = VkResult function (VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint* pRectCount, VkRect2D* pRects);
alias PFN_vkAcquireNextImage2KHR = VkResult function (VkDevice device, const(VkAcquireNextImageInfoKHR)* pAcquireInfo, uint* pImageIndex);

VkResult vkCreateSwapchainKHR (
    VkDevice device,
    const(VkSwapchainCreateInfoKHR)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkSwapchainKHR* pSwapchain);

void vkDestroySwapchainKHR (
    VkDevice device,
    VkSwapchainKHR swapchain,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkGetSwapchainImagesKHR (
    VkDevice device,
    VkSwapchainKHR swapchain,
    uint* pSwapchainImageCount,
    VkImage* pSwapchainImages);

VkResult vkAcquireNextImageKHR (
    VkDevice device,
    VkSwapchainKHR swapchain,
    ulong timeout,
    VkSemaphore semaphore,
    VkFence fence,
    uint* pImageIndex);

VkResult vkQueuePresentKHR (
    VkQueue queue,
    const(VkPresentInfoKHR)* pPresentInfo);

VkResult vkGetDeviceGroupPresentCapabilitiesKHR (
    VkDevice device,
    VkDeviceGroupPresentCapabilitiesKHR* pDeviceGroupPresentCapabilities);

VkResult vkGetDeviceGroupSurfacePresentModesKHR (
    VkDevice device,
    VkSurfaceKHR surface,
    VkDeviceGroupPresentModeFlagsKHR* pModes);

VkResult vkGetPhysicalDevicePresentRectanglesKHR (
    VkPhysicalDevice physicalDevice,
    VkSurfaceKHR surface,
    uint* pRectCount,
    VkRect2D* pRects);

VkResult vkAcquireNextImage2KHR (
    VkDevice device,
    const(VkAcquireNextImageInfoKHR)* pAcquireInfo,
    uint* pImageIndex);

enum VK_KHR_display = 1;
struct VkDisplayKHR_T;
alias VkDisplayKHR = VkDisplayKHR_T*;
struct VkDisplayModeKHR_T;
alias VkDisplayModeKHR = VkDisplayModeKHR_T*;

enum VK_KHR_DISPLAY_SPEC_VERSION = 21;
enum VK_KHR_DISPLAY_EXTENSION_NAME = "VK_KHR_display";

enum VkDisplayPlaneAlphaFlagKHR
{
    opaqueBitKhr = 1,
    globalBitKhr = 2,
    perPixelBitKhr = 4,
    perPixelPremultipliedBitKhr = 8,
    flagBitsMaxEnumKhr = 2147483647
}

alias VkDisplayPlaneAlphaFlagsKHR = uint;
alias VkDisplayModeCreateFlagsKHR = uint;
alias VkDisplaySurfaceCreateFlagsKHR = uint;

struct VkDisplayPropertiesKHR
{
    VkDisplayKHR display;
    const(char)* displayName;
    VkExtent2D physicalDimensions;
    VkExtent2D physicalResolution;
    VkSurfaceTransformFlagsKHR supportedTransforms;
    VkBool32 planeReorderPossible;
    VkBool32 persistentContent;
}

struct VkDisplayModeParametersKHR
{
    VkExtent2D visibleRegion;
    uint refreshRate;
}

struct VkDisplayModePropertiesKHR
{
    VkDisplayModeKHR displayMode;
    VkDisplayModeParametersKHR parameters;
}

struct VkDisplayModeCreateInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkDisplayModeCreateFlagsKHR flags;
    VkDisplayModeParametersKHR parameters;
}

struct VkDisplayPlaneCapabilitiesKHR
{
    VkDisplayPlaneAlphaFlagsKHR supportedAlpha;
    VkOffset2D minSrcPosition;
    VkOffset2D maxSrcPosition;
    VkExtent2D minSrcExtent;
    VkExtent2D maxSrcExtent;
    VkOffset2D minDstPosition;
    VkOffset2D maxDstPosition;
    VkExtent2D minDstExtent;
    VkExtent2D maxDstExtent;
}

struct VkDisplayPlanePropertiesKHR
{
    VkDisplayKHR currentDisplay;
    uint currentStackIndex;
}

struct VkDisplaySurfaceCreateInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkDisplaySurfaceCreateFlagsKHR flags;
    VkDisplayModeKHR displayMode;
    uint planeIndex;
    uint planeStackIndex;
    VkSurfaceTransformFlagKHR transform;
    float globalAlpha;
    VkDisplayPlaneAlphaFlagKHR alphaMode;
    VkExtent2D imageExtent;
}

alias PFN_vkGetPhysicalDeviceDisplayPropertiesKHR = VkResult function (VkPhysicalDevice physicalDevice, uint* pPropertyCount, VkDisplayPropertiesKHR* pProperties);
alias PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR = VkResult function (VkPhysicalDevice physicalDevice, uint* pPropertyCount, VkDisplayPlanePropertiesKHR* pProperties);
alias PFN_vkGetDisplayPlaneSupportedDisplaysKHR = VkResult function (VkPhysicalDevice physicalDevice, uint planeIndex, uint* pDisplayCount, VkDisplayKHR* pDisplays);
alias PFN_vkGetDisplayModePropertiesKHR = VkResult function (VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint* pPropertyCount, VkDisplayModePropertiesKHR* pProperties);
alias PFN_vkCreateDisplayModeKHR = VkResult function (VkPhysicalDevice physicalDevice, VkDisplayKHR display, const(VkDisplayModeCreateInfoKHR)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkDisplayModeKHR* pMode);
alias PFN_vkGetDisplayPlaneCapabilitiesKHR = VkResult function (VkPhysicalDevice physicalDevice, VkDisplayModeKHR mode, uint planeIndex, VkDisplayPlaneCapabilitiesKHR* pCapabilities);
alias PFN_vkCreateDisplayPlaneSurfaceKHR = VkResult function (VkInstance instance, const(VkDisplaySurfaceCreateInfoKHR)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkSurfaceKHR* pSurface);

VkResult vkGetPhysicalDeviceDisplayPropertiesKHR (
    VkPhysicalDevice physicalDevice,
    uint* pPropertyCount,
    VkDisplayPropertiesKHR* pProperties);

VkResult vkGetPhysicalDeviceDisplayPlanePropertiesKHR (
    VkPhysicalDevice physicalDevice,
    uint* pPropertyCount,
    VkDisplayPlanePropertiesKHR* pProperties);

VkResult vkGetDisplayPlaneSupportedDisplaysKHR (
    VkPhysicalDevice physicalDevice,
    uint planeIndex,
    uint* pDisplayCount,
    VkDisplayKHR* pDisplays);

VkResult vkGetDisplayModePropertiesKHR (
    VkPhysicalDevice physicalDevice,
    VkDisplayKHR display,
    uint* pPropertyCount,
    VkDisplayModePropertiesKHR* pProperties);

VkResult vkCreateDisplayModeKHR (
    VkPhysicalDevice physicalDevice,
    VkDisplayKHR display,
    const(VkDisplayModeCreateInfoKHR)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkDisplayModeKHR* pMode);

VkResult vkGetDisplayPlaneCapabilitiesKHR (
    VkPhysicalDevice physicalDevice,
    VkDisplayModeKHR mode,
    uint planeIndex,
    VkDisplayPlaneCapabilitiesKHR* pCapabilities);

VkResult vkCreateDisplayPlaneSurfaceKHR (
    VkInstance instance,
    const(VkDisplaySurfaceCreateInfoKHR)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkSurfaceKHR* pSurface);

enum VK_KHR_display_swapchain = 1;
enum VK_KHR_DISPLAY_SWAPCHAIN_SPEC_VERSION = 9;
enum VK_KHR_DISPLAY_SWAPCHAIN_EXTENSION_NAME = "VK_KHR_display_swapchain";

struct VkDisplayPresentInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkRect2D srcRect;
    VkRect2D dstRect;
    VkBool32 persistent;
}

alias PFN_vkCreateSharedSwapchainsKHR = VkResult function (VkDevice device, uint swapchainCount, const(VkSwapchainCreateInfoKHR)* pCreateInfos, const(VkAllocationCallbacks)* pAllocator, VkSwapchainKHR* pSwapchains);

VkResult vkCreateSharedSwapchainsKHR (
    VkDevice device,
    uint swapchainCount,
    const(VkSwapchainCreateInfoKHR)* pCreateInfos,
    const(VkAllocationCallbacks)* pAllocator,
    VkSwapchainKHR* pSwapchains);

enum VK_KHR_sampler_mirror_clamp_to_edge = 1;
enum VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_SPEC_VERSION = 1;
enum VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_EXTENSION_NAME = "VK_KHR_sampler_mirror_clamp_to_edge";

enum VK_KHR_multiview = 1;
enum VK_KHR_MULTIVIEW_SPEC_VERSION = 1;
enum VK_KHR_MULTIVIEW_EXTENSION_NAME = "VK_KHR_multiview";

alias VkRenderPassMultiviewCreateInfoKHR = VkRenderPassMultiviewCreateInfo;

alias VkPhysicalDeviceMultiviewFeaturesKHR = VkPhysicalDeviceMultiviewFeatures;

alias VkPhysicalDeviceMultiviewPropertiesKHR = VkPhysicalDeviceMultiviewProperties;

enum VK_KHR_get_physical_device_properties2 = 1;
enum VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_SPEC_VERSION = 1;
enum VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME = "VK_KHR_get_physical_device_properties2";

alias VkPhysicalDeviceFeatures2KHR = VkPhysicalDeviceFeatures2;

alias VkPhysicalDeviceProperties2KHR = VkPhysicalDeviceProperties2;

alias VkFormatProperties2KHR = VkFormatProperties2;

alias VkImageFormatProperties2KHR = VkImageFormatProperties2;

alias VkPhysicalDeviceImageFormatInfo2KHR = VkPhysicalDeviceImageFormatInfo2;

alias VkQueueFamilyProperties2KHR = VkQueueFamilyProperties2;

alias VkPhysicalDeviceMemoryProperties2KHR = VkPhysicalDeviceMemoryProperties2;

alias VkSparseImageFormatProperties2KHR = VkSparseImageFormatProperties2;

alias VkPhysicalDeviceSparseImageFormatInfo2KHR = VkPhysicalDeviceSparseImageFormatInfo2;

alias PFN_vkGetPhysicalDeviceFeatures2KHR = void function (VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures);
alias PFN_vkGetPhysicalDeviceProperties2KHR = void function (VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties);
alias PFN_vkGetPhysicalDeviceFormatProperties2KHR = void function (VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties);
alias PFN_vkGetPhysicalDeviceImageFormatProperties2KHR = VkResult function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceImageFormatInfo2)* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties);
alias PFN_vkGetPhysicalDeviceQueueFamilyProperties2KHR = void function (VkPhysicalDevice physicalDevice, uint* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties);
alias PFN_vkGetPhysicalDeviceMemoryProperties2KHR = void function (VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties);
alias PFN_vkGetPhysicalDeviceSparseImageFormatProperties2KHR = void function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceSparseImageFormatInfo2)* pFormatInfo, uint* pPropertyCount, VkSparseImageFormatProperties2* pProperties);

void vkGetPhysicalDeviceFeatures2KHR (
    VkPhysicalDevice physicalDevice,
    VkPhysicalDeviceFeatures2* pFeatures);

void vkGetPhysicalDeviceProperties2KHR (
    VkPhysicalDevice physicalDevice,
    VkPhysicalDeviceProperties2* pProperties);

void vkGetPhysicalDeviceFormatProperties2KHR (
    VkPhysicalDevice physicalDevice,
    VkFormat format,
    VkFormatProperties2* pFormatProperties);

VkResult vkGetPhysicalDeviceImageFormatProperties2KHR (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceImageFormatInfo2)* pImageFormatInfo,
    VkImageFormatProperties2* pImageFormatProperties);

void vkGetPhysicalDeviceQueueFamilyProperties2KHR (
    VkPhysicalDevice physicalDevice,
    uint* pQueueFamilyPropertyCount,
    VkQueueFamilyProperties2* pQueueFamilyProperties);

void vkGetPhysicalDeviceMemoryProperties2KHR (
    VkPhysicalDevice physicalDevice,
    VkPhysicalDeviceMemoryProperties2* pMemoryProperties);

void vkGetPhysicalDeviceSparseImageFormatProperties2KHR (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceSparseImageFormatInfo2)* pFormatInfo,
    uint* pPropertyCount,
    VkSparseImageFormatProperties2* pProperties);

enum VK_KHR_device_group = 1;
enum VK_KHR_DEVICE_GROUP_SPEC_VERSION = 3;
enum VK_KHR_DEVICE_GROUP_EXTENSION_NAME = "VK_KHR_device_group";

alias VkPeerMemoryFeatureFlagsKHR = uint;

alias VkPeerMemoryFeatureFlagKHR = VkPeerMemoryFeatureFlag;

alias VkMemoryAllocateFlagsKHR = uint;

alias VkMemoryAllocateFlagKHR = VkMemoryAllocateFlag;

alias VkMemoryAllocateFlagsInfoKHR = VkMemoryAllocateFlagsInfo;

alias VkDeviceGroupRenderPassBeginInfoKHR = VkDeviceGroupRenderPassBeginInfo;

alias VkDeviceGroupCommandBufferBeginInfoKHR = VkDeviceGroupCommandBufferBeginInfo;

alias VkDeviceGroupSubmitInfoKHR = VkDeviceGroupSubmitInfo;

alias VkDeviceGroupBindSparseInfoKHR = VkDeviceGroupBindSparseInfo;

alias VkBindBufferMemoryDeviceGroupInfoKHR = VkBindBufferMemoryDeviceGroupInfo;

alias VkBindImageMemoryDeviceGroupInfoKHR = VkBindImageMemoryDeviceGroupInfo;

alias PFN_vkGetDeviceGroupPeerMemoryFeaturesKHR = void function (VkDevice device, uint heapIndex, uint localDeviceIndex, uint remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures);
alias PFN_vkCmdSetDeviceMaskKHR = void function (VkCommandBuffer commandBuffer, uint deviceMask);
alias PFN_vkCmdDispatchBaseKHR = void function (VkCommandBuffer commandBuffer, uint baseGroupX, uint baseGroupY, uint baseGroupZ, uint groupCountX, uint groupCountY, uint groupCountZ);

void vkGetDeviceGroupPeerMemoryFeaturesKHR (
    VkDevice device,
    uint heapIndex,
    uint localDeviceIndex,
    uint remoteDeviceIndex,
    VkPeerMemoryFeatureFlags* pPeerMemoryFeatures);

void vkCmdSetDeviceMaskKHR (VkCommandBuffer commandBuffer, uint deviceMask);

void vkCmdDispatchBaseKHR (
    VkCommandBuffer commandBuffer,
    uint baseGroupX,
    uint baseGroupY,
    uint baseGroupZ,
    uint groupCountX,
    uint groupCountY,
    uint groupCountZ);

enum VK_KHR_shader_draw_parameters = 1;
enum VK_KHR_SHADER_DRAW_PARAMETERS_SPEC_VERSION = 1;
enum VK_KHR_SHADER_DRAW_PARAMETERS_EXTENSION_NAME = "VK_KHR_shader_draw_parameters";

enum VK_KHR_maintenance1 = 1;
enum VK_KHR_MAINTENANCE1_SPEC_VERSION = 2;
enum VK_KHR_MAINTENANCE1_EXTENSION_NAME = "VK_KHR_maintenance1";

alias VkCommandPoolTrimFlagsKHR = uint;

alias PFN_vkTrimCommandPoolKHR = void function (VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags);

void vkTrimCommandPoolKHR (
    VkDevice device,
    VkCommandPool commandPool,
    VkCommandPoolTrimFlags flags);

enum VK_KHR_device_group_creation = 1;
enum VK_KHR_DEVICE_GROUP_CREATION_SPEC_VERSION = 1;
enum VK_KHR_DEVICE_GROUP_CREATION_EXTENSION_NAME = "VK_KHR_device_group_creation";
enum VK_MAX_DEVICE_GROUP_SIZE_KHR = VK_MAX_DEVICE_GROUP_SIZE;

alias VkPhysicalDeviceGroupPropertiesKHR = VkPhysicalDeviceGroupProperties;

alias VkDeviceGroupDeviceCreateInfoKHR = VkDeviceGroupDeviceCreateInfo;

alias PFN_vkEnumeratePhysicalDeviceGroupsKHR = VkResult function (VkInstance instance, uint* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties);

VkResult vkEnumeratePhysicalDeviceGroupsKHR (
    VkInstance instance,
    uint* pPhysicalDeviceGroupCount,
    VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties);

enum VK_KHR_external_memory_capabilities = 1;
enum VK_KHR_EXTERNAL_MEMORY_CAPABILITIES_SPEC_VERSION = 1;
enum VK_KHR_EXTERNAL_MEMORY_CAPABILITIES_EXTENSION_NAME = "VK_KHR_external_memory_capabilities";
enum VK_LUID_SIZE_KHR = VK_LUID_SIZE;

alias VkExternalMemoryHandleTypeFlagsKHR = uint;

alias VkExternalMemoryHandleTypeFlagKHR = VkExternalMemoryHandleTypeFlag;

alias VkExternalMemoryFeatureFlagsKHR = uint;

alias VkExternalMemoryFeatureFlagKHR = VkExternalMemoryFeatureFlag;

alias VkExternalMemoryPropertiesKHR = VkExternalMemoryProperties;

alias VkPhysicalDeviceExternalImageFormatInfoKHR = VkPhysicalDeviceExternalImageFormatInfo;

alias VkExternalImageFormatPropertiesKHR = VkExternalImageFormatProperties;

alias VkPhysicalDeviceExternalBufferInfoKHR = VkPhysicalDeviceExternalBufferInfo;

alias VkExternalBufferPropertiesKHR = VkExternalBufferProperties;

alias VkPhysicalDeviceIDPropertiesKHR = VkPhysicalDeviceIDProperties;

alias PFN_vkGetPhysicalDeviceExternalBufferPropertiesKHR = void function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceExternalBufferInfo)* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties);

void vkGetPhysicalDeviceExternalBufferPropertiesKHR (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceExternalBufferInfo)* pExternalBufferInfo,
    VkExternalBufferProperties* pExternalBufferProperties);

enum VK_KHR_external_memory = 1;
enum VK_KHR_EXTERNAL_MEMORY_SPEC_VERSION = 1;
enum VK_KHR_EXTERNAL_MEMORY_EXTENSION_NAME = "VK_KHR_external_memory";
enum VK_QUEUE_FAMILY_EXTERNAL_KHR = VK_QUEUE_FAMILY_EXTERNAL;

alias VkExternalMemoryImageCreateInfoKHR = VkExternalMemoryImageCreateInfo;

alias VkExternalMemoryBufferCreateInfoKHR = VkExternalMemoryBufferCreateInfo;

alias VkExportMemoryAllocateInfoKHR = VkExportMemoryAllocateInfo;

enum VK_KHR_external_memory_fd = 1;
enum VK_KHR_EXTERNAL_MEMORY_FD_SPEC_VERSION = 1;
enum VK_KHR_EXTERNAL_MEMORY_FD_EXTENSION_NAME = "VK_KHR_external_memory_fd";

struct VkImportMemoryFdInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalMemoryHandleTypeFlag handleType;
    int fd;
}

struct VkMemoryFdPropertiesKHR
{
    VkStructureType sType;
    void* pNext;
    uint memoryTypeBits;
}

struct VkMemoryGetFdInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkDeviceMemory memory;
    VkExternalMemoryHandleTypeFlag handleType;
}

alias PFN_vkGetMemoryFdKHR = VkResult function (VkDevice device, const(VkMemoryGetFdInfoKHR)* pGetFdInfo, int* pFd);
alias PFN_vkGetMemoryFdPropertiesKHR = VkResult function (VkDevice device, VkExternalMemoryHandleTypeFlag handleType, int fd, VkMemoryFdPropertiesKHR* pMemoryFdProperties);

VkResult vkGetMemoryFdKHR (
    VkDevice device,
    const(VkMemoryGetFdInfoKHR)* pGetFdInfo,
    int* pFd);

VkResult vkGetMemoryFdPropertiesKHR (
    VkDevice device,
    VkExternalMemoryHandleTypeFlag handleType,
    int fd,
    VkMemoryFdPropertiesKHR* pMemoryFdProperties);

enum VK_KHR_external_semaphore_capabilities = 1;
enum VK_KHR_EXTERNAL_SEMAPHORE_CAPABILITIES_SPEC_VERSION = 1;
enum VK_KHR_EXTERNAL_SEMAPHORE_CAPABILITIES_EXTENSION_NAME = "VK_KHR_external_semaphore_capabilities";

alias VkExternalSemaphoreHandleTypeFlagsKHR = uint;

alias VkExternalSemaphoreHandleTypeFlagKHR = VkExternalSemaphoreHandleTypeFlag;

alias VkExternalSemaphoreFeatureFlagsKHR = uint;

alias VkExternalSemaphoreFeatureFlagKHR = VkExternalSemaphoreFeatureFlag;

alias VkPhysicalDeviceExternalSemaphoreInfoKHR = VkPhysicalDeviceExternalSemaphoreInfo;

alias VkExternalSemaphorePropertiesKHR = VkExternalSemaphoreProperties;

alias PFN_vkGetPhysicalDeviceExternalSemaphorePropertiesKHR = void function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceExternalSemaphoreInfo)* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties);

void vkGetPhysicalDeviceExternalSemaphorePropertiesKHR (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceExternalSemaphoreInfo)* pExternalSemaphoreInfo,
    VkExternalSemaphoreProperties* pExternalSemaphoreProperties);

enum VK_KHR_external_semaphore = 1;
enum VK_KHR_EXTERNAL_SEMAPHORE_SPEC_VERSION = 1;
enum VK_KHR_EXTERNAL_SEMAPHORE_EXTENSION_NAME = "VK_KHR_external_semaphore";

alias VkSemaphoreImportFlagsKHR = uint;

alias VkSemaphoreImportFlagKHR = VkSemaphoreImportFlag;

alias VkExportSemaphoreCreateInfoKHR = VkExportSemaphoreCreateInfo;

enum VK_KHR_external_semaphore_fd = 1;
enum VK_KHR_EXTERNAL_SEMAPHORE_FD_SPEC_VERSION = 1;
enum VK_KHR_EXTERNAL_SEMAPHORE_FD_EXTENSION_NAME = "VK_KHR_external_semaphore_fd";

struct VkImportSemaphoreFdInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkSemaphore semaphore;
    VkSemaphoreImportFlags flags;
    VkExternalSemaphoreHandleTypeFlag handleType;
    int fd;
}

struct VkSemaphoreGetFdInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkSemaphore semaphore;
    VkExternalSemaphoreHandleTypeFlag handleType;
}

alias PFN_vkImportSemaphoreFdKHR = VkResult function (VkDevice device, const(VkImportSemaphoreFdInfoKHR)* pImportSemaphoreFdInfo);
alias PFN_vkGetSemaphoreFdKHR = VkResult function (VkDevice device, const(VkSemaphoreGetFdInfoKHR)* pGetFdInfo, int* pFd);

VkResult vkImportSemaphoreFdKHR (
    VkDevice device,
    const(VkImportSemaphoreFdInfoKHR)* pImportSemaphoreFdInfo);

VkResult vkGetSemaphoreFdKHR (
    VkDevice device,
    const(VkSemaphoreGetFdInfoKHR)* pGetFdInfo,
    int* pFd);

enum VK_KHR_push_descriptor = 1;
enum VK_KHR_PUSH_DESCRIPTOR_SPEC_VERSION = 2;
enum VK_KHR_PUSH_DESCRIPTOR_EXTENSION_NAME = "VK_KHR_push_descriptor";

struct VkPhysicalDevicePushDescriptorPropertiesKHR
{
    VkStructureType sType;
    void* pNext;
    uint maxPushDescriptors;
}

alias PFN_vkCmdPushDescriptorSetKHR = void function (VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint set, uint descriptorWriteCount, const(VkWriteDescriptorSet)* pDescriptorWrites);
alias PFN_vkCmdPushDescriptorSetWithTemplateKHR = void function (VkCommandBuffer commandBuffer, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkPipelineLayout layout, uint set, const(void)* pData);

void vkCmdPushDescriptorSetKHR (
    VkCommandBuffer commandBuffer,
    VkPipelineBindPoint pipelineBindPoint,
    VkPipelineLayout layout,
    uint set,
    uint descriptorWriteCount,
    const(VkWriteDescriptorSet)* pDescriptorWrites);

void vkCmdPushDescriptorSetWithTemplateKHR (
    VkCommandBuffer commandBuffer,
    VkDescriptorUpdateTemplate descriptorUpdateTemplate,
    VkPipelineLayout layout,
    uint set,
    const(void)* pData);

enum VK_KHR_16bit_storage = 1;
enum VK_KHR_16BIT_STORAGE_SPEC_VERSION = 1;
enum VK_KHR_16BIT_STORAGE_EXTENSION_NAME = "VK_KHR_16bit_storage";

alias VkPhysicalDevice16BitStorageFeaturesKHR = VkPhysicalDevice16BitStorageFeatures;

enum VK_KHR_incremental_present = 1;
enum VK_KHR_INCREMENTAL_PRESENT_SPEC_VERSION = 1;
enum VK_KHR_INCREMENTAL_PRESENT_EXTENSION_NAME = "VK_KHR_incremental_present";

struct VkRectLayerKHR
{
    VkOffset2D offset;
    VkExtent2D extent;
    uint layer;
}

struct VkPresentRegionKHR
{
    uint rectangleCount;
    const(VkRectLayerKHR)* pRectangles;
}

struct VkPresentRegionsKHR
{
    VkStructureType sType;
    const(void)* pNext;
    uint swapchainCount;
    const(VkPresentRegionKHR)* pRegions;
}

enum VK_KHR_descriptor_update_template = 1;
alias VkDescriptorUpdateTemplateKHR = VkDescriptorUpdateTemplate_T*;

enum VK_KHR_DESCRIPTOR_UPDATE_TEMPLATE_SPEC_VERSION = 1;
enum VK_KHR_DESCRIPTOR_UPDATE_TEMPLATE_EXTENSION_NAME = "VK_KHR_descriptor_update_template";

alias VkDescriptorUpdateTemplateTypeKHR = VkDescriptorUpdateTemplateType;

alias VkDescriptorUpdateTemplateCreateFlagsKHR = uint;

alias VkDescriptorUpdateTemplateEntryKHR = VkDescriptorUpdateTemplateEntry;

alias VkDescriptorUpdateTemplateCreateInfoKHR = VkDescriptorUpdateTemplateCreateInfo;

alias PFN_vkCreateDescriptorUpdateTemplateKHR = VkResult function (VkDevice device, const(VkDescriptorUpdateTemplateCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate);
alias PFN_vkDestroyDescriptorUpdateTemplateKHR = void function (VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkUpdateDescriptorSetWithTemplateKHR = void function (VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, const(void)* pData);

VkResult vkCreateDescriptorUpdateTemplateKHR (
    VkDevice device,
    const(VkDescriptorUpdateTemplateCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate);

void vkDestroyDescriptorUpdateTemplateKHR (
    VkDevice device,
    VkDescriptorUpdateTemplate descriptorUpdateTemplate,
    const(VkAllocationCallbacks)* pAllocator);

void vkUpdateDescriptorSetWithTemplateKHR (
    VkDevice device,
    VkDescriptorSet descriptorSet,
    VkDescriptorUpdateTemplate descriptorUpdateTemplate,
    const(void)* pData);

enum VK_KHR_create_renderpass2 = 1;
enum VK_KHR_CREATE_RENDERPASS_2_SPEC_VERSION = 1;
enum VK_KHR_CREATE_RENDERPASS_2_EXTENSION_NAME = "VK_KHR_create_renderpass2";

struct VkAttachmentDescription2KHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkAttachmentDescriptionFlags flags;
    VkFormat format;
    VkSampleCountFlag samples;
    VkAttachmentLoadOp loadOp;
    VkAttachmentStoreOp storeOp;
    VkAttachmentLoadOp stencilLoadOp;
    VkAttachmentStoreOp stencilStoreOp;
    VkImageLayout initialLayout;
    VkImageLayout finalLayout;
}

struct VkAttachmentReference2KHR
{
    VkStructureType sType;
    const(void)* pNext;
    uint attachment;
    VkImageLayout layout;
    VkImageAspectFlags aspectMask;
}

struct VkSubpassDescription2KHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkSubpassDescriptionFlags flags;
    VkPipelineBindPoint pipelineBindPoint;
    uint viewMask;
    uint inputAttachmentCount;
    const(VkAttachmentReference2KHR)* pInputAttachments;
    uint colorAttachmentCount;
    const(VkAttachmentReference2KHR)* pColorAttachments;
    const(VkAttachmentReference2KHR)* pResolveAttachments;
    const(VkAttachmentReference2KHR)* pDepthStencilAttachment;
    uint preserveAttachmentCount;
    const(uint)* pPreserveAttachments;
}

struct VkSubpassDependency2KHR
{
    VkStructureType sType;
    const(void)* pNext;
    uint srcSubpass;
    uint dstSubpass;
    VkPipelineStageFlags srcStageMask;
    VkPipelineStageFlags dstStageMask;
    VkAccessFlags srcAccessMask;
    VkAccessFlags dstAccessMask;
    VkDependencyFlags dependencyFlags;
    int viewOffset;
}

struct VkRenderPassCreateInfo2KHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkRenderPassCreateFlags flags;
    uint attachmentCount;
    const(VkAttachmentDescription2KHR)* pAttachments;
    uint subpassCount;
    const(VkSubpassDescription2KHR)* pSubpasses;
    uint dependencyCount;
    const(VkSubpassDependency2KHR)* pDependencies;
    uint correlatedViewMaskCount;
    const(uint)* pCorrelatedViewMasks;
}

struct VkSubpassBeginInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkSubpassContents contents;
}

struct VkSubpassEndInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
}

alias PFN_vkCreateRenderPass2KHR = VkResult function (VkDevice device, const(VkRenderPassCreateInfo2KHR)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkRenderPass* pRenderPass);
alias PFN_vkCmdBeginRenderPass2KHR = void function (VkCommandBuffer commandBuffer, const(VkRenderPassBeginInfo)* pRenderPassBegin, const(VkSubpassBeginInfoKHR)* pSubpassBeginInfo);
alias PFN_vkCmdNextSubpass2KHR = void function (VkCommandBuffer commandBuffer, const(VkSubpassBeginInfoKHR)* pSubpassBeginInfo, const(VkSubpassEndInfoKHR)* pSubpassEndInfo);
alias PFN_vkCmdEndRenderPass2KHR = void function (VkCommandBuffer commandBuffer, const(VkSubpassEndInfoKHR)* pSubpassEndInfo);

VkResult vkCreateRenderPass2KHR (
    VkDevice device,
    const(VkRenderPassCreateInfo2KHR)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkRenderPass* pRenderPass);

void vkCmdBeginRenderPass2KHR (
    VkCommandBuffer commandBuffer,
    const(VkRenderPassBeginInfo)* pRenderPassBegin,
    const(VkSubpassBeginInfoKHR)* pSubpassBeginInfo);

void vkCmdNextSubpass2KHR (
    VkCommandBuffer commandBuffer,
    const(VkSubpassBeginInfoKHR)* pSubpassBeginInfo,
    const(VkSubpassEndInfoKHR)* pSubpassEndInfo);

void vkCmdEndRenderPass2KHR (
    VkCommandBuffer commandBuffer,
    const(VkSubpassEndInfoKHR)* pSubpassEndInfo);

enum VK_KHR_shared_presentable_image = 1;
enum VK_KHR_SHARED_PRESENTABLE_IMAGE_SPEC_VERSION = 1;
enum VK_KHR_SHARED_PRESENTABLE_IMAGE_EXTENSION_NAME = "VK_KHR_shared_presentable_image";

struct VkSharedPresentSurfaceCapabilitiesKHR
{
    VkStructureType sType;
    void* pNext;
    VkImageUsageFlags sharedPresentSupportedUsageFlags;
}

alias PFN_vkGetSwapchainStatusKHR = VkResult function (VkDevice device, VkSwapchainKHR swapchain);

VkResult vkGetSwapchainStatusKHR (VkDevice device, VkSwapchainKHR swapchain);

enum VK_KHR_external_fence_capabilities = 1;
enum VK_KHR_EXTERNAL_FENCE_CAPABILITIES_SPEC_VERSION = 1;
enum VK_KHR_EXTERNAL_FENCE_CAPABILITIES_EXTENSION_NAME = "VK_KHR_external_fence_capabilities";

alias VkExternalFenceHandleTypeFlagsKHR = uint;

alias VkExternalFenceHandleTypeFlagKHR = VkExternalFenceHandleTypeFlag;

alias VkExternalFenceFeatureFlagsKHR = uint;

alias VkExternalFenceFeatureFlagKHR = VkExternalFenceFeatureFlag;

alias VkPhysicalDeviceExternalFenceInfoKHR = VkPhysicalDeviceExternalFenceInfo;

alias VkExternalFencePropertiesKHR = VkExternalFenceProperties;

alias PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR = void function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceExternalFenceInfo)* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties);

void vkGetPhysicalDeviceExternalFencePropertiesKHR (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceExternalFenceInfo)* pExternalFenceInfo,
    VkExternalFenceProperties* pExternalFenceProperties);

enum VK_KHR_external_fence = 1;
enum VK_KHR_EXTERNAL_FENCE_SPEC_VERSION = 1;
enum VK_KHR_EXTERNAL_FENCE_EXTENSION_NAME = "VK_KHR_external_fence";

alias VkFenceImportFlagsKHR = uint;

alias VkFenceImportFlagKHR = VkFenceImportFlag;

alias VkExportFenceCreateInfoKHR = VkExportFenceCreateInfo;

enum VK_KHR_external_fence_fd = 1;
enum VK_KHR_EXTERNAL_FENCE_FD_SPEC_VERSION = 1;
enum VK_KHR_EXTERNAL_FENCE_FD_EXTENSION_NAME = "VK_KHR_external_fence_fd";

struct VkImportFenceFdInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkFence fence;
    VkFenceImportFlags flags;
    VkExternalFenceHandleTypeFlag handleType;
    int fd;
}

struct VkFenceGetFdInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkFence fence;
    VkExternalFenceHandleTypeFlag handleType;
}

alias PFN_vkImportFenceFdKHR = VkResult function (VkDevice device, const(VkImportFenceFdInfoKHR)* pImportFenceFdInfo);
alias PFN_vkGetFenceFdKHR = VkResult function (VkDevice device, const(VkFenceGetFdInfoKHR)* pGetFdInfo, int* pFd);

VkResult vkImportFenceFdKHR (
    VkDevice device,
    const(VkImportFenceFdInfoKHR)* pImportFenceFdInfo);

VkResult vkGetFenceFdKHR (
    VkDevice device,
    const(VkFenceGetFdInfoKHR)* pGetFdInfo,
    int* pFd);

enum VK_KHR_maintenance2 = 1;
enum VK_KHR_MAINTENANCE2_SPEC_VERSION = 1;
enum VK_KHR_MAINTENANCE2_EXTENSION_NAME = "VK_KHR_maintenance2";

alias VkPointClippingBehaviorKHR = VkPointClippingBehavior;

alias VkTessellationDomainOriginKHR = VkTessellationDomainOrigin;

alias VkPhysicalDevicePointClippingPropertiesKHR = VkPhysicalDevicePointClippingProperties;

alias VkRenderPassInputAttachmentAspectCreateInfoKHR = VkRenderPassInputAttachmentAspectCreateInfo;

alias VkInputAttachmentAspectReferenceKHR = VkInputAttachmentAspectReference;

alias VkImageViewUsageCreateInfoKHR = VkImageViewUsageCreateInfo;

alias VkPipelineTessellationDomainOriginStateCreateInfoKHR = VkPipelineTessellationDomainOriginStateCreateInfo;

enum VK_KHR_get_surface_capabilities2 = 1;
enum VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION = 1;
enum VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME = "VK_KHR_get_surface_capabilities2";

struct VkPhysicalDeviceSurfaceInfo2KHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkSurfaceKHR surface;
}

struct VkSurfaceCapabilities2KHR
{
    VkStructureType sType;
    void* pNext;
    VkSurfaceCapabilitiesKHR surfaceCapabilities;
}

struct VkSurfaceFormat2KHR
{
    VkStructureType sType;
    void* pNext;
    VkSurfaceFormatKHR surfaceFormat;
}

alias PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR = VkResult function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceSurfaceInfo2KHR)* pSurfaceInfo, VkSurfaceCapabilities2KHR* pSurfaceCapabilities);
alias PFN_vkGetPhysicalDeviceSurfaceFormats2KHR = VkResult function (VkPhysicalDevice physicalDevice, const(VkPhysicalDeviceSurfaceInfo2KHR)* pSurfaceInfo, uint* pSurfaceFormatCount, VkSurfaceFormat2KHR* pSurfaceFormats);

VkResult vkGetPhysicalDeviceSurfaceCapabilities2KHR (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceSurfaceInfo2KHR)* pSurfaceInfo,
    VkSurfaceCapabilities2KHR* pSurfaceCapabilities);

VkResult vkGetPhysicalDeviceSurfaceFormats2KHR (
    VkPhysicalDevice physicalDevice,
    const(VkPhysicalDeviceSurfaceInfo2KHR)* pSurfaceInfo,
    uint* pSurfaceFormatCount,
    VkSurfaceFormat2KHR* pSurfaceFormats);

enum VK_KHR_variable_pointers = 1;
enum VK_KHR_VARIABLE_POINTERS_SPEC_VERSION = 1;
enum VK_KHR_VARIABLE_POINTERS_EXTENSION_NAME = "VK_KHR_variable_pointers";

alias VkPhysicalDeviceVariablePointerFeaturesKHR = VkPhysicalDeviceVariablePointerFeatures;

enum VK_KHR_get_display_properties2 = 1;
enum VK_KHR_GET_DISPLAY_PROPERTIES_2_SPEC_VERSION = 1;
enum VK_KHR_GET_DISPLAY_PROPERTIES_2_EXTENSION_NAME = "VK_KHR_get_display_properties2";

struct VkDisplayProperties2KHR
{
    VkStructureType sType;
    void* pNext;
    VkDisplayPropertiesKHR displayProperties;
}

struct VkDisplayPlaneProperties2KHR
{
    VkStructureType sType;
    void* pNext;
    VkDisplayPlanePropertiesKHR displayPlaneProperties;
}

struct VkDisplayModeProperties2KHR
{
    VkStructureType sType;
    void* pNext;
    VkDisplayModePropertiesKHR displayModeProperties;
}

struct VkDisplayPlaneInfo2KHR
{
    VkStructureType sType;
    const(void)* pNext;
    VkDisplayModeKHR mode;
    uint planeIndex;
}

struct VkDisplayPlaneCapabilities2KHR
{
    VkStructureType sType;
    void* pNext;
    VkDisplayPlaneCapabilitiesKHR capabilities;
}

alias PFN_vkGetPhysicalDeviceDisplayProperties2KHR = VkResult function (VkPhysicalDevice physicalDevice, uint* pPropertyCount, VkDisplayProperties2KHR* pProperties);
alias PFN_vkGetPhysicalDeviceDisplayPlaneProperties2KHR = VkResult function (VkPhysicalDevice physicalDevice, uint* pPropertyCount, VkDisplayPlaneProperties2KHR* pProperties);
alias PFN_vkGetDisplayModeProperties2KHR = VkResult function (VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint* pPropertyCount, VkDisplayModeProperties2KHR* pProperties);
alias PFN_vkGetDisplayPlaneCapabilities2KHR = VkResult function (VkPhysicalDevice physicalDevice, const(VkDisplayPlaneInfo2KHR)* pDisplayPlaneInfo, VkDisplayPlaneCapabilities2KHR* pCapabilities);

VkResult vkGetPhysicalDeviceDisplayProperties2KHR (
    VkPhysicalDevice physicalDevice,
    uint* pPropertyCount,
    VkDisplayProperties2KHR* pProperties);

VkResult vkGetPhysicalDeviceDisplayPlaneProperties2KHR (
    VkPhysicalDevice physicalDevice,
    uint* pPropertyCount,
    VkDisplayPlaneProperties2KHR* pProperties);

VkResult vkGetDisplayModeProperties2KHR (
    VkPhysicalDevice physicalDevice,
    VkDisplayKHR display,
    uint* pPropertyCount,
    VkDisplayModeProperties2KHR* pProperties);

VkResult vkGetDisplayPlaneCapabilities2KHR (
    VkPhysicalDevice physicalDevice,
    const(VkDisplayPlaneInfo2KHR)* pDisplayPlaneInfo,
    VkDisplayPlaneCapabilities2KHR* pCapabilities);

enum VK_KHR_dedicated_allocation = 1;
enum VK_KHR_DEDICATED_ALLOCATION_SPEC_VERSION = 3;
enum VK_KHR_DEDICATED_ALLOCATION_EXTENSION_NAME = "VK_KHR_dedicated_allocation";

alias VkMemoryDedicatedRequirementsKHR = VkMemoryDedicatedRequirements;

alias VkMemoryDedicatedAllocateInfoKHR = VkMemoryDedicatedAllocateInfo;

enum VK_KHR_storage_buffer_storage_class = 1;
enum VK_KHR_STORAGE_BUFFER_STORAGE_CLASS_SPEC_VERSION = 1;
enum VK_KHR_STORAGE_BUFFER_STORAGE_CLASS_EXTENSION_NAME = "VK_KHR_storage_buffer_storage_class";

enum VK_KHR_relaxed_block_layout = 1;
enum VK_KHR_RELAXED_BLOCK_LAYOUT_SPEC_VERSION = 1;
enum VK_KHR_RELAXED_BLOCK_LAYOUT_EXTENSION_NAME = "VK_KHR_relaxed_block_layout";

enum VK_KHR_get_memory_requirements2 = 1;
enum VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION = 1;
enum VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME = "VK_KHR_get_memory_requirements2";

alias VkBufferMemoryRequirementsInfo2KHR = VkBufferMemoryRequirementsInfo2;

alias VkImageMemoryRequirementsInfo2KHR = VkImageMemoryRequirementsInfo2;

alias VkImageSparseMemoryRequirementsInfo2KHR = VkImageSparseMemoryRequirementsInfo2;

alias VkSparseImageMemoryRequirements2KHR = VkSparseImageMemoryRequirements2;

alias PFN_vkGetImageMemoryRequirements2KHR = void function (VkDevice device, const(VkImageMemoryRequirementsInfo2)* pInfo, VkMemoryRequirements2* pMemoryRequirements);
alias PFN_vkGetBufferMemoryRequirements2KHR = void function (VkDevice device, const(VkBufferMemoryRequirementsInfo2)* pInfo, VkMemoryRequirements2* pMemoryRequirements);
alias PFN_vkGetImageSparseMemoryRequirements2KHR = void function (VkDevice device, const(VkImageSparseMemoryRequirementsInfo2)* pInfo, uint* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements);

void vkGetImageMemoryRequirements2KHR (
    VkDevice device,
    const(VkImageMemoryRequirementsInfo2)* pInfo,
    VkMemoryRequirements2* pMemoryRequirements);

void vkGetBufferMemoryRequirements2KHR (
    VkDevice device,
    const(VkBufferMemoryRequirementsInfo2)* pInfo,
    VkMemoryRequirements2* pMemoryRequirements);

void vkGetImageSparseMemoryRequirements2KHR (
    VkDevice device,
    const(VkImageSparseMemoryRequirementsInfo2)* pInfo,
    uint* pSparseMemoryRequirementCount,
    VkSparseImageMemoryRequirements2* pSparseMemoryRequirements);

enum VK_KHR_image_format_list = 1;
enum VK_KHR_IMAGE_FORMAT_LIST_SPEC_VERSION = 1;
enum VK_KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME = "VK_KHR_image_format_list";

struct VkImageFormatListCreateInfoKHR
{
    VkStructureType sType;
    const(void)* pNext;
    uint viewFormatCount;
    const(VkFormat)* pViewFormats;
}

enum VK_KHR_sampler_ycbcr_conversion = 1;
alias VkSamplerYcbcrConversionKHR = VkSamplerYcbcrConversion_T*;

enum VK_KHR_SAMPLER_YCBCR_CONVERSION_SPEC_VERSION = 1;
enum VK_KHR_SAMPLER_YCBCR_CONVERSION_EXTENSION_NAME = "VK_KHR_sampler_ycbcr_conversion";

alias VkSamplerYcbcrModelConversionKHR = VkSamplerYcbcrModelConversion;

alias VkSamplerYcbcrRangeKHR = VkSamplerYcbcrRange;

alias VkChromaLocationKHR = VkChromaLocation;

alias VkSamplerYcbcrConversionCreateInfoKHR = VkSamplerYcbcrConversionCreateInfo;

alias VkSamplerYcbcrConversionInfoKHR = VkSamplerYcbcrConversionInfo;

alias VkBindImagePlaneMemoryInfoKHR = VkBindImagePlaneMemoryInfo;

alias VkImagePlaneMemoryRequirementsInfoKHR = VkImagePlaneMemoryRequirementsInfo;

alias VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR = VkPhysicalDeviceSamplerYcbcrConversionFeatures;

alias VkSamplerYcbcrConversionImageFormatPropertiesKHR = VkSamplerYcbcrConversionImageFormatProperties;

alias PFN_vkCreateSamplerYcbcrConversionKHR = VkResult function (VkDevice device, const(VkSamplerYcbcrConversionCreateInfo)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion);
alias PFN_vkDestroySamplerYcbcrConversionKHR = void function (VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateSamplerYcbcrConversionKHR (
    VkDevice device,
    const(VkSamplerYcbcrConversionCreateInfo)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkSamplerYcbcrConversion* pYcbcrConversion);

void vkDestroySamplerYcbcrConversionKHR (
    VkDevice device,
    VkSamplerYcbcrConversion ycbcrConversion,
    const(VkAllocationCallbacks)* pAllocator);

enum VK_KHR_bind_memory2 = 1;
enum VK_KHR_BIND_MEMORY_2_SPEC_VERSION = 1;
enum VK_KHR_BIND_MEMORY_2_EXTENSION_NAME = "VK_KHR_bind_memory2";

alias VkBindBufferMemoryInfoKHR = VkBindBufferMemoryInfo;

alias VkBindImageMemoryInfoKHR = VkBindImageMemoryInfo;

alias PFN_vkBindBufferMemory2KHR = VkResult function (VkDevice device, uint bindInfoCount, const(VkBindBufferMemoryInfo)* pBindInfos);
alias PFN_vkBindImageMemory2KHR = VkResult function (VkDevice device, uint bindInfoCount, const(VkBindImageMemoryInfo)* pBindInfos);

VkResult vkBindBufferMemory2KHR (
    VkDevice device,
    uint bindInfoCount,
    const(VkBindBufferMemoryInfo)* pBindInfos);

VkResult vkBindImageMemory2KHR (
    VkDevice device,
    uint bindInfoCount,
    const(VkBindImageMemoryInfo)* pBindInfos);

enum VK_KHR_maintenance3 = 1;
enum VK_KHR_MAINTENANCE3_SPEC_VERSION = 1;
enum VK_KHR_MAINTENANCE3_EXTENSION_NAME = "VK_KHR_maintenance3";

alias VkPhysicalDeviceMaintenance3PropertiesKHR = VkPhysicalDeviceMaintenance3Properties;

alias VkDescriptorSetLayoutSupportKHR = VkDescriptorSetLayoutSupport;

alias PFN_vkGetDescriptorSetLayoutSupportKHR = void function (VkDevice device, const(VkDescriptorSetLayoutCreateInfo)* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport);

void vkGetDescriptorSetLayoutSupportKHR (
    VkDevice device,
    const(VkDescriptorSetLayoutCreateInfo)* pCreateInfo,
    VkDescriptorSetLayoutSupport* pSupport);

enum VK_KHR_draw_indirect_count = 1;
enum VK_KHR_DRAW_INDIRECT_COUNT_SPEC_VERSION = 1;
enum VK_KHR_DRAW_INDIRECT_COUNT_EXTENSION_NAME = "VK_KHR_draw_indirect_count";

alias PFN_vkCmdDrawIndirectCountKHR = void function (VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint maxDrawCount, uint stride);
alias PFN_vkCmdDrawIndexedIndirectCountKHR = void function (VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint maxDrawCount, uint stride);

void vkCmdDrawIndirectCountKHR (
    VkCommandBuffer commandBuffer,
    VkBuffer buffer,
    VkDeviceSize offset,
    VkBuffer countBuffer,
    VkDeviceSize countBufferOffset,
    uint maxDrawCount,
    uint stride);

void vkCmdDrawIndexedIndirectCountKHR (
    VkCommandBuffer commandBuffer,
    VkBuffer buffer,
    VkDeviceSize offset,
    VkBuffer countBuffer,
    VkDeviceSize countBufferOffset,
    uint maxDrawCount,
    uint stride);

enum VK_KHR_8bit_storage = 1;
enum VK_KHR_8BIT_STORAGE_SPEC_VERSION = 1;
enum VK_KHR_8BIT_STORAGE_EXTENSION_NAME = "VK_KHR_8bit_storage";

struct VkPhysicalDevice8BitStorageFeaturesKHR
{
    VkStructureType sType;
    void* pNext;
    VkBool32 storageBuffer8BitAccess;
    VkBool32 uniformAndStorageBuffer8BitAccess;
    VkBool32 storagePushConstant8;
}

enum VK_KHR_shader_atomic_int64 = 1;
enum VK_KHR_SHADER_ATOMIC_INT64_SPEC_VERSION = 1;
enum VK_KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME = "VK_KHR_shader_atomic_int64";

struct VkPhysicalDeviceShaderAtomicInt64FeaturesKHR
{
    VkStructureType sType;
    void* pNext;
    VkBool32 shaderBufferInt64Atomics;
    VkBool32 shaderSharedInt64Atomics;
}

enum VK_KHR_driver_properties = 1;
enum VK_MAX_DRIVER_NAME_SIZE_KHR = 256;
enum VK_MAX_DRIVER_INFO_SIZE_KHR = 256;
enum VK_KHR_DRIVER_PROPERTIES_SPEC_VERSION = 1;
enum VK_KHR_DRIVER_PROPERTIES_EXTENSION_NAME = "VK_KHR_driver_properties";

enum VkDriverIdKHR
{
    amdProprietaryKhr = 1,
    amdOpenSourceKhr = 2,
    mesaRadvKhr = 3,
    nvidiaProprietaryKhr = 4,
    intelProprietaryWindowsKhr = 5,
    intelOpenSourceMesaKhr = 6,
    imaginationProprietaryKhr = 7,
    qualcommProprietaryKhr = 8,
    armProprietaryKhr = 9,
    beginRangeKhr = 1,
    endRangeKhr = 9,
    rangeSizeKhr = 9,
    maxEnumKhr = 2147483647
}

struct VkConformanceVersionKHR
{
    ubyte major;
    ubyte minor;
    ubyte subminor;
    ubyte patch;
}

struct VkPhysicalDeviceDriverPropertiesKHR
{
    VkStructureType sType;
    void* pNext;
    VkDriverIdKHR driverID;
    char[VK_MAX_DRIVER_NAME_SIZE_KHR] driverName;
    char[VK_MAX_DRIVER_INFO_SIZE_KHR] driverInfo;
    VkConformanceVersionKHR conformanceVersion;
}

enum VK_KHR_vulkan_memory_model = 1;
enum VK_KHR_VULKAN_MEMORY_MODEL_SPEC_VERSION = 2;
enum VK_KHR_VULKAN_MEMORY_MODEL_EXTENSION_NAME = "VK_KHR_vulkan_memory_model";

struct VkPhysicalDeviceVulkanMemoryModelFeaturesKHR
{
    VkStructureType sType;
    void* pNext;
    VkBool32 vulkanMemoryModel;
    VkBool32 vulkanMemoryModelDeviceScope;
}

enum VK_EXT_debug_report = 1;
struct VkDebugReportCallbackEXT_T;
alias VkDebugReportCallbackEXT = VkDebugReportCallbackEXT_T*;

enum VK_EXT_DEBUG_REPORT_SPEC_VERSION = 9;
enum VK_EXT_DEBUG_REPORT_EXTENSION_NAME = "VK_EXT_debug_report";

enum VkDebugReportObjectTypeEXT
{
    unknownExt = 0,
    instanceExt = 1,
    physicalDeviceExt = 2,
    deviceExt = 3,
    queueExt = 4,
    semaphoreExt = 5,
    commandBufferExt = 6,
    fenceExt = 7,
    deviceMemoryExt = 8,
    bufferExt = 9,
    imageExt = 10,
    eventExt = 11,
    queryPoolExt = 12,
    bufferViewExt = 13,
    imageViewExt = 14,
    shaderModuleExt = 15,
    pipelineCacheExt = 16,
    pipelineLayoutExt = 17,
    renderPassExt = 18,
    pipelineExt = 19,
    descriptorSetLayoutExt = 20,
    samplerExt = 21,
    descriptorPoolExt = 22,
    descriptorSetExt = 23,
    framebufferExt = 24,
    commandPoolExt = 25,
    surfaceKhrExt = 26,
    swapchainKhrExt = 27,
    debugReportCallbackExtExt = 28,
    displayKhrExt = 29,
    displayModeKhrExt = 30,
    objectTableNvxExt = 31,
    indirectCommandsLayoutNvxExt = 32,
    validationCacheExtExt = 33,
    samplerYcbcrConversionExt = 1000156000,
    descriptorUpdateTemplateExt = 1000085000,
    accelerationStructureNvExt = 1000165000,
    debugReportExt = 28,
    validationCacheExt = 33,
    descriptorUpdateTemplateKhrExt = 1000085000,
    samplerYcbcrConversionKhrExt = 1000156000,
    beginRangeExt = 0,
    endRangeExt = 33,
    rangeSizeExt = 34,
    maxEnumExt = 2147483647
}

enum VkDebugReportFlagEXT
{
    informationBitExt = 1,
    warningBitExt = 2,
    performanceWarningBitExt = 4,
    errorBitExt = 8,
    debugBitExt = 16,
    flagBitsMaxEnumExt = 2147483647
}

alias VkDebugReportFlagsEXT = uint;

alias PFN_vkDebugReportCallbackEXT = uint function (
    VkDebugReportFlagsEXT flags,
    VkDebugReportObjectTypeEXT objectType,
    ulong object,
    size_t location,
    int messageCode,
    const(char)* pLayerPrefix,
    const(char)* pMessage,
    void* pUserData);

struct VkDebugReportCallbackCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkDebugReportFlagsEXT flags;
    PFN_vkDebugReportCallbackEXT pfnCallback;
    void* pUserData;
}

alias PFN_vkCreateDebugReportCallbackEXT = VkResult function (VkInstance instance, const(VkDebugReportCallbackCreateInfoEXT)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkDebugReportCallbackEXT* pCallback);
alias PFN_vkDestroyDebugReportCallbackEXT = void function (VkInstance instance, VkDebugReportCallbackEXT callback, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkDebugReportMessageEXT = void function (VkInstance instance, VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, ulong object, size_t location, int messageCode, const(char)* pLayerPrefix, const(char)* pMessage);

VkResult vkCreateDebugReportCallbackEXT (
    VkInstance instance,
    const(VkDebugReportCallbackCreateInfoEXT)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkDebugReportCallbackEXT* pCallback);

void vkDestroyDebugReportCallbackEXT (
    VkInstance instance,
    VkDebugReportCallbackEXT callback,
    const(VkAllocationCallbacks)* pAllocator);

void vkDebugReportMessageEXT (
    VkInstance instance,
    VkDebugReportFlagsEXT flags,
    VkDebugReportObjectTypeEXT objectType,
    ulong object,
    size_t location,
    int messageCode,
    const(char)* pLayerPrefix,
    const(char)* pMessage);

enum VK_NV_glsl_shader = 1;
enum VK_NV_GLSL_SHADER_SPEC_VERSION = 1;
enum VK_NV_GLSL_SHADER_EXTENSION_NAME = "VK_NV_glsl_shader";

enum VK_EXT_depth_range_unrestricted = 1;
enum VK_EXT_DEPTH_RANGE_UNRESTRICTED_SPEC_VERSION = 1;
enum VK_EXT_DEPTH_RANGE_UNRESTRICTED_EXTENSION_NAME = "VK_EXT_depth_range_unrestricted";

enum VK_IMG_filter_cubic = 1;
enum VK_IMG_FILTER_CUBIC_SPEC_VERSION = 1;
enum VK_IMG_FILTER_CUBIC_EXTENSION_NAME = "VK_IMG_filter_cubic";

enum VK_AMD_rasterization_order = 1;
enum VK_AMD_RASTERIZATION_ORDER_SPEC_VERSION = 1;
enum VK_AMD_RASTERIZATION_ORDER_EXTENSION_NAME = "VK_AMD_rasterization_order";

enum VkRasterizationOrderAMD
{
    strictAmd = 0,
    relaxedAmd = 1,
    beginRangeAmd = 0,
    endRangeAmd = 1,
    rangeSizeAmd = 2,
    maxEnumAmd = 2147483647
}

struct VkPipelineRasterizationStateRasterizationOrderAMD
{
    VkStructureType sType;
    const(void)* pNext;
    VkRasterizationOrderAMD rasterizationOrder;
}

enum VK_AMD_shader_trinary_minmax = 1;
enum VK_AMD_SHADER_TRINARY_MINMAX_SPEC_VERSION = 1;
enum VK_AMD_SHADER_TRINARY_MINMAX_EXTENSION_NAME = "VK_AMD_shader_trinary_minmax";

enum VK_AMD_shader_explicit_vertex_parameter = 1;
enum VK_AMD_SHADER_EXPLICIT_VERTEX_PARAMETER_SPEC_VERSION = 1;
enum VK_AMD_SHADER_EXPLICIT_VERTEX_PARAMETER_EXTENSION_NAME = "VK_AMD_shader_explicit_vertex_parameter";

enum VK_EXT_debug_marker = 1;
enum VK_EXT_DEBUG_MARKER_SPEC_VERSION = 4;
enum VK_EXT_DEBUG_MARKER_EXTENSION_NAME = "VK_EXT_debug_marker";

struct VkDebugMarkerObjectNameInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkDebugReportObjectTypeEXT objectType;
    ulong object;
    const(char)* pObjectName;
}

struct VkDebugMarkerObjectTagInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkDebugReportObjectTypeEXT objectType;
    ulong object;
    ulong tagName;
    size_t tagSize;
    const(void)* pTag;
}

struct VkDebugMarkerMarkerInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    const(char)* pMarkerName;
    float[4] color;
}

alias PFN_vkDebugMarkerSetObjectTagEXT = VkResult function (VkDevice device, const(VkDebugMarkerObjectTagInfoEXT)* pTagInfo);
alias PFN_vkDebugMarkerSetObjectNameEXT = VkResult function (VkDevice device, const(VkDebugMarkerObjectNameInfoEXT)* pNameInfo);
alias PFN_vkCmdDebugMarkerBeginEXT = void function (VkCommandBuffer commandBuffer, const(VkDebugMarkerMarkerInfoEXT)* pMarkerInfo);
alias PFN_vkCmdDebugMarkerEndEXT = void function (VkCommandBuffer commandBuffer);
alias PFN_vkCmdDebugMarkerInsertEXT = void function (VkCommandBuffer commandBuffer, const(VkDebugMarkerMarkerInfoEXT)* pMarkerInfo);

VkResult vkDebugMarkerSetObjectTagEXT (
    VkDevice device,
    const(VkDebugMarkerObjectTagInfoEXT)* pTagInfo);

VkResult vkDebugMarkerSetObjectNameEXT (
    VkDevice device,
    const(VkDebugMarkerObjectNameInfoEXT)* pNameInfo);

void vkCmdDebugMarkerBeginEXT (
    VkCommandBuffer commandBuffer,
    const(VkDebugMarkerMarkerInfoEXT)* pMarkerInfo);

void vkCmdDebugMarkerEndEXT (VkCommandBuffer commandBuffer);

void vkCmdDebugMarkerInsertEXT (
    VkCommandBuffer commandBuffer,
    const(VkDebugMarkerMarkerInfoEXT)* pMarkerInfo);

enum VK_AMD_gcn_shader = 1;
enum VK_AMD_GCN_SHADER_SPEC_VERSION = 1;
enum VK_AMD_GCN_SHADER_EXTENSION_NAME = "VK_AMD_gcn_shader";

enum VK_NV_dedicated_allocation = 1;
enum VK_NV_DEDICATED_ALLOCATION_SPEC_VERSION = 1;
enum VK_NV_DEDICATED_ALLOCATION_EXTENSION_NAME = "VK_NV_dedicated_allocation";

struct VkDedicatedAllocationImageCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkBool32 dedicatedAllocation;
}

struct VkDedicatedAllocationBufferCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkBool32 dedicatedAllocation;
}

struct VkDedicatedAllocationMemoryAllocateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkImage image;
    VkBuffer buffer;
}

enum VK_EXT_transform_feedback = 1;
enum VK_EXT_TRANSFORM_FEEDBACK_SPEC_VERSION = 1;
enum VK_EXT_TRANSFORM_FEEDBACK_EXTENSION_NAME = "VK_EXT_transform_feedback";

alias VkPipelineRasterizationStateStreamCreateFlagsEXT = uint;

struct VkPhysicalDeviceTransformFeedbackFeaturesEXT
{
    VkStructureType sType;
    void* pNext;
    VkBool32 transformFeedback;
    VkBool32 geometryStreams;
}

struct VkPhysicalDeviceTransformFeedbackPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    uint maxTransformFeedbackStreams;
    uint maxTransformFeedbackBuffers;
    VkDeviceSize maxTransformFeedbackBufferSize;
    uint maxTransformFeedbackStreamDataSize;
    uint maxTransformFeedbackBufferDataSize;
    uint maxTransformFeedbackBufferDataStride;
    VkBool32 transformFeedbackQueries;
    VkBool32 transformFeedbackStreamsLinesTriangles;
    VkBool32 transformFeedbackRasterizationStreamSelect;
    VkBool32 transformFeedbackDraw;
}

struct VkPipelineRasterizationStateStreamCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineRasterizationStateStreamCreateFlagsEXT flags;
    uint rasterizationStream;
}

alias PFN_vkCmdBindTransformFeedbackBuffersEXT = void function (VkCommandBuffer commandBuffer, uint firstBinding, uint bindingCount, const(VkBuffer)* pBuffers, const(VkDeviceSize)* pOffsets, const(VkDeviceSize)* pSizes);
alias PFN_vkCmdBeginTransformFeedbackEXT = void function (VkCommandBuffer commandBuffer, uint firstCounterBuffer, uint counterBufferCount, const(VkBuffer)* pCounterBuffers, const(VkDeviceSize)* pCounterBufferOffsets);
alias PFN_vkCmdEndTransformFeedbackEXT = void function (VkCommandBuffer commandBuffer, uint firstCounterBuffer, uint counterBufferCount, const(VkBuffer)* pCounterBuffers, const(VkDeviceSize)* pCounterBufferOffsets);
alias PFN_vkCmdBeginQueryIndexedEXT = void function (VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint query, VkQueryControlFlags flags, uint index);
alias PFN_vkCmdEndQueryIndexedEXT = void function (VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint query, uint index);
alias PFN_vkCmdDrawIndirectByteCountEXT = void function (VkCommandBuffer commandBuffer, uint instanceCount, uint firstInstance, VkBuffer counterBuffer, VkDeviceSize counterBufferOffset, uint counterOffset, uint vertexStride);

void vkCmdBindTransformFeedbackBuffersEXT (
    VkCommandBuffer commandBuffer,
    uint firstBinding,
    uint bindingCount,
    const(VkBuffer)* pBuffers,
    const(VkDeviceSize)* pOffsets,
    const(VkDeviceSize)* pSizes);

void vkCmdBeginTransformFeedbackEXT (
    VkCommandBuffer commandBuffer,
    uint firstCounterBuffer,
    uint counterBufferCount,
    const(VkBuffer)* pCounterBuffers,
    const(VkDeviceSize)* pCounterBufferOffsets);

void vkCmdEndTransformFeedbackEXT (
    VkCommandBuffer commandBuffer,
    uint firstCounterBuffer,
    uint counterBufferCount,
    const(VkBuffer)* pCounterBuffers,
    const(VkDeviceSize)* pCounterBufferOffsets);

void vkCmdBeginQueryIndexedEXT (
    VkCommandBuffer commandBuffer,
    VkQueryPool queryPool,
    uint query,
    VkQueryControlFlags flags,
    uint index);

void vkCmdEndQueryIndexedEXT (
    VkCommandBuffer commandBuffer,
    VkQueryPool queryPool,
    uint query,
    uint index);

void vkCmdDrawIndirectByteCountEXT (
    VkCommandBuffer commandBuffer,
    uint instanceCount,
    uint firstInstance,
    VkBuffer counterBuffer,
    VkDeviceSize counterBufferOffset,
    uint counterOffset,
    uint vertexStride);

enum VK_AMD_draw_indirect_count = 1;
enum VK_AMD_DRAW_INDIRECT_COUNT_SPEC_VERSION = 1;
enum VK_AMD_DRAW_INDIRECT_COUNT_EXTENSION_NAME = "VK_AMD_draw_indirect_count";

alias PFN_vkCmdDrawIndirectCountAMD = void function (VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint maxDrawCount, uint stride);
alias PFN_vkCmdDrawIndexedIndirectCountAMD = void function (VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint maxDrawCount, uint stride);

void vkCmdDrawIndirectCountAMD (
    VkCommandBuffer commandBuffer,
    VkBuffer buffer,
    VkDeviceSize offset,
    VkBuffer countBuffer,
    VkDeviceSize countBufferOffset,
    uint maxDrawCount,
    uint stride);

void vkCmdDrawIndexedIndirectCountAMD (
    VkCommandBuffer commandBuffer,
    VkBuffer buffer,
    VkDeviceSize offset,
    VkBuffer countBuffer,
    VkDeviceSize countBufferOffset,
    uint maxDrawCount,
    uint stride);

enum VK_AMD_negative_viewport_height = 1;
enum VK_AMD_NEGATIVE_VIEWPORT_HEIGHT_SPEC_VERSION = 1;
enum VK_AMD_NEGATIVE_VIEWPORT_HEIGHT_EXTENSION_NAME = "VK_AMD_negative_viewport_height";

enum VK_AMD_gpu_shader_half_float = 1;
enum VK_AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION = 1;
enum VK_AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME = "VK_AMD_gpu_shader_half_float";

enum VK_AMD_shader_ballot = 1;
enum VK_AMD_SHADER_BALLOT_SPEC_VERSION = 1;
enum VK_AMD_SHADER_BALLOT_EXTENSION_NAME = "VK_AMD_shader_ballot";

enum VK_AMD_texture_gather_bias_lod = 1;
enum VK_AMD_TEXTURE_GATHER_BIAS_LOD_SPEC_VERSION = 1;
enum VK_AMD_TEXTURE_GATHER_BIAS_LOD_EXTENSION_NAME = "VK_AMD_texture_gather_bias_lod";

struct VkTextureLODGatherFormatPropertiesAMD
{
    VkStructureType sType;
    void* pNext;
    VkBool32 supportsTextureGatherLODBiasAMD;
}

enum VK_AMD_shader_info = 1;
enum VK_AMD_SHADER_INFO_SPEC_VERSION = 1;
enum VK_AMD_SHADER_INFO_EXTENSION_NAME = "VK_AMD_shader_info";

enum VkShaderInfoTypeAMD
{
    statisticsAmd = 0,
    binaryAmd = 1,
    disassemblyAmd = 2,
    beginRangeAmd = 0,
    endRangeAmd = 2,
    rangeSizeAmd = 3,
    maxEnumAmd = 2147483647
}

struct VkShaderResourceUsageAMD
{
    uint numUsedVgprs;
    uint numUsedSgprs;
    uint ldsSizePerLocalWorkGroup;
    size_t ldsUsageSizeInBytes;
    size_t scratchMemUsageInBytes;
}

struct VkShaderStatisticsInfoAMD
{
    VkShaderStageFlags shaderStageMask;
    VkShaderResourceUsageAMD resourceUsage;
    uint numPhysicalVgprs;
    uint numPhysicalSgprs;
    uint numAvailableVgprs;
    uint numAvailableSgprs;
    uint[3] computeWorkGroupSize;
}

alias PFN_vkGetShaderInfoAMD = VkResult function (VkDevice device, VkPipeline pipeline, VkShaderStageFlag shaderStage, VkShaderInfoTypeAMD infoType, size_t* pInfoSize, void* pInfo);

VkResult vkGetShaderInfoAMD (
    VkDevice device,
    VkPipeline pipeline,
    VkShaderStageFlag shaderStage,
    VkShaderInfoTypeAMD infoType,
    size_t* pInfoSize,
    void* pInfo);

enum VK_AMD_shader_image_load_store_lod = 1;
enum VK_AMD_SHADER_IMAGE_LOAD_STORE_LOD_SPEC_VERSION = 1;
enum VK_AMD_SHADER_IMAGE_LOAD_STORE_LOD_EXTENSION_NAME = "VK_AMD_shader_image_load_store_lod";

enum VK_NV_corner_sampled_image = 1;
enum VK_NV_CORNER_SAMPLED_IMAGE_SPEC_VERSION = 2;
enum VK_NV_CORNER_SAMPLED_IMAGE_EXTENSION_NAME = "VK_NV_corner_sampled_image";

struct VkPhysicalDeviceCornerSampledImageFeaturesNV
{
    VkStructureType sType;
    void* pNext;
    VkBool32 cornerSampledImage;
}

enum VK_IMG_format_pvrtc = 1;
enum VK_IMG_FORMAT_PVRTC_SPEC_VERSION = 1;
enum VK_IMG_FORMAT_PVRTC_EXTENSION_NAME = "VK_IMG_format_pvrtc";

enum VK_NV_external_memory_capabilities = 1;
enum VK_NV_EXTERNAL_MEMORY_CAPABILITIES_SPEC_VERSION = 1;
enum VK_NV_EXTERNAL_MEMORY_CAPABILITIES_EXTENSION_NAME = "VK_NV_external_memory_capabilities";

enum VkExternalMemoryHandleTypeFlagNV
{
    opaqueWin32BitNv = 1,
    opaqueWin32KmtBitNv = 2,
    d3d11ImageBitNv = 4,
    d3d11ImageKmtBitNv = 8,
    flagBitsMaxEnumNv = 2147483647
}

alias VkExternalMemoryHandleTypeFlagsNV = uint;

enum VkExternalMemoryFeatureFlagNV
{
    dedicatedOnlyBitNv = 1,
    exportableBitNv = 2,
    importableBitNv = 4,
    flagBitsMaxEnumNv = 2147483647
}

alias VkExternalMemoryFeatureFlagsNV = uint;

struct VkExternalImageFormatPropertiesNV
{
    VkImageFormatProperties imageFormatProperties;
    VkExternalMemoryFeatureFlagsNV externalMemoryFeatures;
    VkExternalMemoryHandleTypeFlagsNV exportFromImportedHandleTypes;
    VkExternalMemoryHandleTypeFlagsNV compatibleHandleTypes;
}

alias PFN_vkGetPhysicalDeviceExternalImageFormatPropertiesNV = VkResult function (VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkExternalMemoryHandleTypeFlagsNV externalHandleType, VkExternalImageFormatPropertiesNV* pExternalImageFormatProperties);

VkResult vkGetPhysicalDeviceExternalImageFormatPropertiesNV (
    VkPhysicalDevice physicalDevice,
    VkFormat format,
    VkImageType type,
    VkImageTiling tiling,
    VkImageUsageFlags usage,
    VkImageCreateFlags flags,
    VkExternalMemoryHandleTypeFlagsNV externalHandleType,
    VkExternalImageFormatPropertiesNV* pExternalImageFormatProperties);

enum VK_NV_external_memory = 1;
enum VK_NV_EXTERNAL_MEMORY_SPEC_VERSION = 1;
enum VK_NV_EXTERNAL_MEMORY_EXTENSION_NAME = "VK_NV_external_memory";

struct VkExternalMemoryImageCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalMemoryHandleTypeFlagsNV handleTypes;
}

struct VkExportMemoryAllocateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalMemoryHandleTypeFlagsNV handleTypes;
}

enum VK_EXT_validation_flags = 1;
enum VK_EXT_VALIDATION_FLAGS_SPEC_VERSION = 1;
enum VK_EXT_VALIDATION_FLAGS_EXTENSION_NAME = "VK_EXT_validation_flags";

enum VkValidationCheckEXT
{
    allExt = 0,
    shadersExt = 1,
    beginRangeExt = 0,
    endRangeExt = 1,
    rangeSizeExt = 2,
    maxEnumExt = 2147483647
}

struct VkValidationFlagsEXT
{
    VkStructureType sType;
    const(void)* pNext;
    uint disabledValidationCheckCount;
    const(VkValidationCheckEXT)* pDisabledValidationChecks;
}

enum VK_EXT_shader_subgroup_ballot = 1;
enum VK_EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION = 1;
enum VK_EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME = "VK_EXT_shader_subgroup_ballot";

enum VK_EXT_shader_subgroup_vote = 1;
enum VK_EXT_SHADER_SUBGROUP_VOTE_SPEC_VERSION = 1;
enum VK_EXT_SHADER_SUBGROUP_VOTE_EXTENSION_NAME = "VK_EXT_shader_subgroup_vote";

enum VK_EXT_astc_decode_mode = 1;
enum VK_EXT_ASTC_DECODE_MODE_SPEC_VERSION = 1;
enum VK_EXT_ASTC_DECODE_MODE_EXTENSION_NAME = "VK_EXT_astc_decode_mode";

struct VkImageViewASTCDecodeModeEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkFormat decodeMode;
}

struct VkPhysicalDeviceASTCDecodeFeaturesEXT
{
    VkStructureType sType;
    void* pNext;
    VkBool32 decodeModeSharedExponent;
}

enum VK_EXT_conditional_rendering = 1;
enum VK_EXT_CONDITIONAL_RENDERING_SPEC_VERSION = 1;
enum VK_EXT_CONDITIONAL_RENDERING_EXTENSION_NAME = "VK_EXT_conditional_rendering";

enum VkConditionalRenderingFlagEXT
{
    invertedBitExt = 1,
    flagBitsMaxEnumExt = 2147483647
}

alias VkConditionalRenderingFlagsEXT = uint;

struct VkConditionalRenderingBeginInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkBuffer buffer;
    VkDeviceSize offset;
    VkConditionalRenderingFlagsEXT flags;
}

struct VkPhysicalDeviceConditionalRenderingFeaturesEXT
{
    VkStructureType sType;
    void* pNext;
    VkBool32 conditionalRendering;
    VkBool32 inheritedConditionalRendering;
}

struct VkCommandBufferInheritanceConditionalRenderingInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkBool32 conditionalRenderingEnable;
}

alias PFN_vkCmdBeginConditionalRenderingEXT = void function (VkCommandBuffer commandBuffer, const(VkConditionalRenderingBeginInfoEXT)* pConditionalRenderingBegin);
alias PFN_vkCmdEndConditionalRenderingEXT = void function (VkCommandBuffer commandBuffer);

void vkCmdBeginConditionalRenderingEXT (
    VkCommandBuffer commandBuffer,
    const(VkConditionalRenderingBeginInfoEXT)* pConditionalRenderingBegin);

void vkCmdEndConditionalRenderingEXT (VkCommandBuffer commandBuffer);

enum VK_NVX_device_generated_commands = 1;
struct VkObjectTableNVX_T;
alias VkObjectTableNVX = VkObjectTableNVX_T*;
struct VkIndirectCommandsLayoutNVX_T;
alias VkIndirectCommandsLayoutNVX = VkIndirectCommandsLayoutNVX_T*;

enum VK_NVX_DEVICE_GENERATED_COMMANDS_SPEC_VERSION = 3;
enum VK_NVX_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME = "VK_NVX_device_generated_commands";

enum VkIndirectCommandsTokenTypeNVX
{
    pipelineNvx = 0,
    descriptorSetNvx = 1,
    indexBufferNvx = 2,
    vertexBufferNvx = 3,
    pushConstantNvx = 4,
    drawIndexedNvx = 5,
    drawNvx = 6,
    dispatchNvx = 7,
    beginRangeNvx = 0,
    endRangeNvx = 7,
    rangeSizeNvx = 8,
    maxEnumNvx = 2147483647
}

enum VkObjectEntryTypeNVX
{
    descriptorSetNvx = 0,
    pipelineNvx = 1,
    indexBufferNvx = 2,
    vertexBufferNvx = 3,
    pushConstantNvx = 4,
    beginRangeNvx = 0,
    endRangeNvx = 4,
    rangeSizeNvx = 5,
    maxEnumNvx = 2147483647
}

enum VkIndirectCommandsLayoutUsageFlagNVX
{
    unorderedSequencesBitNvx = 1,
    sparseSequencesBitNvx = 2,
    emptyExecutionsBitNvx = 4,
    indexedSequencesBitNvx = 8,
    flagBitsMaxEnumNvx = 2147483647
}

alias VkIndirectCommandsLayoutUsageFlagsNVX = uint;

enum VkObjectEntryUsageFlagNVX
{
    graphicsBitNvx = 1,
    computeBitNvx = 2,
    flagBitsMaxEnumNvx = 2147483647
}

alias VkObjectEntryUsageFlagsNVX = uint;

struct VkDeviceGeneratedCommandsFeaturesNVX
{
    VkStructureType sType;
    const(void)* pNext;
    VkBool32 computeBindingPointSupport;
}

struct VkDeviceGeneratedCommandsLimitsNVX
{
    VkStructureType sType;
    const(void)* pNext;
    uint maxIndirectCommandsLayoutTokenCount;
    uint maxObjectEntryCounts;
    uint minSequenceCountBufferOffsetAlignment;
    uint minSequenceIndexBufferOffsetAlignment;
    uint minCommandsTokenBufferOffsetAlignment;
}

struct VkIndirectCommandsTokenNVX
{
    VkIndirectCommandsTokenTypeNVX tokenType;
    VkBuffer buffer;
    VkDeviceSize offset;
}

struct VkIndirectCommandsLayoutTokenNVX
{
    VkIndirectCommandsTokenTypeNVX tokenType;
    uint bindingUnit;
    uint dynamicCount;
    uint divisor;
}

struct VkIndirectCommandsLayoutCreateInfoNVX
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineBindPoint pipelineBindPoint;
    VkIndirectCommandsLayoutUsageFlagsNVX flags;
    uint tokenCount;
    const(VkIndirectCommandsLayoutTokenNVX)* pTokens;
}

struct VkCmdProcessCommandsInfoNVX
{
    VkStructureType sType;
    const(void)* pNext;
    VkObjectTableNVX objectTable;
    VkIndirectCommandsLayoutNVX indirectCommandsLayout;
    uint indirectCommandsTokenCount;
    const(VkIndirectCommandsTokenNVX)* pIndirectCommandsTokens;
    uint maxSequencesCount;
    VkCommandBuffer targetCommandBuffer;
    VkBuffer sequencesCountBuffer;
    VkDeviceSize sequencesCountOffset;
    VkBuffer sequencesIndexBuffer;
    VkDeviceSize sequencesIndexOffset;
}

struct VkCmdReserveSpaceForCommandsInfoNVX
{
    VkStructureType sType;
    const(void)* pNext;
    VkObjectTableNVX objectTable;
    VkIndirectCommandsLayoutNVX indirectCommandsLayout;
    uint maxSequencesCount;
}

struct VkObjectTableCreateInfoNVX
{
    VkStructureType sType;
    const(void)* pNext;
    uint objectCount;
    const(VkObjectEntryTypeNVX)* pObjectEntryTypes;
    const(uint)* pObjectEntryCounts;
    const(VkObjectEntryUsageFlagsNVX)* pObjectEntryUsageFlags;
    uint maxUniformBuffersPerDescriptor;
    uint maxStorageBuffersPerDescriptor;
    uint maxStorageImagesPerDescriptor;
    uint maxSampledImagesPerDescriptor;
    uint maxPipelineLayouts;
}

struct VkObjectTableEntryNVX
{
    VkObjectEntryTypeNVX type;
    VkObjectEntryUsageFlagsNVX flags;
}

struct VkObjectTablePipelineEntryNVX
{
    VkObjectEntryTypeNVX type;
    VkObjectEntryUsageFlagsNVX flags;
    VkPipeline pipeline;
}

struct VkObjectTableDescriptorSetEntryNVX
{
    VkObjectEntryTypeNVX type;
    VkObjectEntryUsageFlagsNVX flags;
    VkPipelineLayout pipelineLayout;
    VkDescriptorSet descriptorSet;
}

struct VkObjectTableVertexBufferEntryNVX
{
    VkObjectEntryTypeNVX type;
    VkObjectEntryUsageFlagsNVX flags;
    VkBuffer buffer;
}

struct VkObjectTableIndexBufferEntryNVX
{
    VkObjectEntryTypeNVX type;
    VkObjectEntryUsageFlagsNVX flags;
    VkBuffer buffer;
    VkIndexType indexType;
}

struct VkObjectTablePushConstantEntryNVX
{
    VkObjectEntryTypeNVX type;
    VkObjectEntryUsageFlagsNVX flags;
    VkPipelineLayout pipelineLayout;
    VkShaderStageFlags stageFlags;
}

alias PFN_vkCmdProcessCommandsNVX = void function (VkCommandBuffer commandBuffer, const(VkCmdProcessCommandsInfoNVX)* pProcessCommandsInfo);
alias PFN_vkCmdReserveSpaceForCommandsNVX = void function (VkCommandBuffer commandBuffer, const(VkCmdReserveSpaceForCommandsInfoNVX)* pReserveSpaceInfo);
alias PFN_vkCreateIndirectCommandsLayoutNVX = VkResult function (VkDevice device, const(VkIndirectCommandsLayoutCreateInfoNVX)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkIndirectCommandsLayoutNVX* pIndirectCommandsLayout);
alias PFN_vkDestroyIndirectCommandsLayoutNVX = void function (VkDevice device, VkIndirectCommandsLayoutNVX indirectCommandsLayout, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkCreateObjectTableNVX = VkResult function (VkDevice device, const(VkObjectTableCreateInfoNVX)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkObjectTableNVX* pObjectTable);
alias PFN_vkDestroyObjectTableNVX = void function (VkDevice device, VkObjectTableNVX objectTable, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkRegisterObjectsNVX = VkResult function (VkDevice device, VkObjectTableNVX objectTable, uint objectCount, const(VkObjectTableEntryNVX*)* ppObjectTableEntries, const(uint)* pObjectIndices);
alias PFN_vkUnregisterObjectsNVX = VkResult function (VkDevice device, VkObjectTableNVX objectTable, uint objectCount, const(VkObjectEntryTypeNVX)* pObjectEntryTypes, const(uint)* pObjectIndices);
alias PFN_vkGetPhysicalDeviceGeneratedCommandsPropertiesNVX = void function (VkPhysicalDevice physicalDevice, VkDeviceGeneratedCommandsFeaturesNVX* pFeatures, VkDeviceGeneratedCommandsLimitsNVX* pLimits);

void vkCmdProcessCommandsNVX (
    VkCommandBuffer commandBuffer,
    const(VkCmdProcessCommandsInfoNVX)* pProcessCommandsInfo);

void vkCmdReserveSpaceForCommandsNVX (
    VkCommandBuffer commandBuffer,
    const(VkCmdReserveSpaceForCommandsInfoNVX)* pReserveSpaceInfo);

VkResult vkCreateIndirectCommandsLayoutNVX (
    VkDevice device,
    const(VkIndirectCommandsLayoutCreateInfoNVX)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkIndirectCommandsLayoutNVX* pIndirectCommandsLayout);

void vkDestroyIndirectCommandsLayoutNVX (
    VkDevice device,
    VkIndirectCommandsLayoutNVX indirectCommandsLayout,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkCreateObjectTableNVX (
    VkDevice device,
    const(VkObjectTableCreateInfoNVX)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkObjectTableNVX* pObjectTable);

void vkDestroyObjectTableNVX (
    VkDevice device,
    VkObjectTableNVX objectTable,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkRegisterObjectsNVX (
    VkDevice device,
    VkObjectTableNVX objectTable,
    uint objectCount,
    const(VkObjectTableEntryNVX*)* ppObjectTableEntries,
    const(uint)* pObjectIndices);

VkResult vkUnregisterObjectsNVX (
    VkDevice device,
    VkObjectTableNVX objectTable,
    uint objectCount,
    const(VkObjectEntryTypeNVX)* pObjectEntryTypes,
    const(uint)* pObjectIndices);

void vkGetPhysicalDeviceGeneratedCommandsPropertiesNVX (
    VkPhysicalDevice physicalDevice,
    VkDeviceGeneratedCommandsFeaturesNVX* pFeatures,
    VkDeviceGeneratedCommandsLimitsNVX* pLimits);

enum VK_NV_clip_space_w_scaling = 1;
enum VK_NV_CLIP_SPACE_W_SCALING_SPEC_VERSION = 1;
enum VK_NV_CLIP_SPACE_W_SCALING_EXTENSION_NAME = "VK_NV_clip_space_w_scaling";

struct VkViewportWScalingNV
{
    float xcoeff;
    float ycoeff;
}

struct VkPipelineViewportWScalingStateCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkBool32 viewportWScalingEnable;
    uint viewportCount;
    const(VkViewportWScalingNV)* pViewportWScalings;
}

alias PFN_vkCmdSetViewportWScalingNV = void function (VkCommandBuffer commandBuffer, uint firstViewport, uint viewportCount, const(VkViewportWScalingNV)* pViewportWScalings);

void vkCmdSetViewportWScalingNV (
    VkCommandBuffer commandBuffer,
    uint firstViewport,
    uint viewportCount,
    const(VkViewportWScalingNV)* pViewportWScalings);

enum VK_EXT_direct_mode_display = 1;
enum VK_EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION = 1;
enum VK_EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME = "VK_EXT_direct_mode_display";

alias PFN_vkReleaseDisplayEXT = VkResult function (VkPhysicalDevice physicalDevice, VkDisplayKHR display);

VkResult vkReleaseDisplayEXT (
    VkPhysicalDevice physicalDevice,
    VkDisplayKHR display);

enum VK_EXT_display_surface_counter = 1;
enum VK_EXT_DISPLAY_SURFACE_COUNTER_SPEC_VERSION = 1;
enum VK_EXT_DISPLAY_SURFACE_COUNTER_EXTENSION_NAME = "VK_EXT_display_surface_counter";

enum VkSurfaceCounterFlagEXT
{
    vblankExt = 1,
    flagBitsMaxEnumExt = 2147483647
}

alias VkSurfaceCounterFlagsEXT = uint;

struct VkSurfaceCapabilities2EXT
{
    VkStructureType sType;
    void* pNext;
    uint minImageCount;
    uint maxImageCount;
    VkExtent2D currentExtent;
    VkExtent2D minImageExtent;
    VkExtent2D maxImageExtent;
    uint maxImageArrayLayers;
    VkSurfaceTransformFlagsKHR supportedTransforms;
    VkSurfaceTransformFlagKHR currentTransform;
    VkCompositeAlphaFlagsKHR supportedCompositeAlpha;
    VkImageUsageFlags supportedUsageFlags;
    VkSurfaceCounterFlagsEXT supportedSurfaceCounters;
}

alias PFN_vkGetPhysicalDeviceSurfaceCapabilities2EXT = VkResult function (VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilities2EXT* pSurfaceCapabilities);

VkResult vkGetPhysicalDeviceSurfaceCapabilities2EXT (
    VkPhysicalDevice physicalDevice,
    VkSurfaceKHR surface,
    VkSurfaceCapabilities2EXT* pSurfaceCapabilities);

enum VK_EXT_display_control = 1;
enum VK_EXT_DISPLAY_CONTROL_SPEC_VERSION = 1;
enum VK_EXT_DISPLAY_CONTROL_EXTENSION_NAME = "VK_EXT_display_control";

enum VkDisplayPowerStateEXT
{
    offExt = 0,
    suspendExt = 1,
    onExt = 2,
    beginRangeExt = 0,
    endRangeExt = 2,
    rangeSizeExt = 3,
    maxEnumExt = 2147483647
}

enum VkDeviceEventTypeEXT
{
    displayHotplugExt = 0,
    beginRangeExt = 0,
    endRangeExt = 0,
    rangeSizeExt = 1,
    maxEnumExt = 2147483647
}

enum VkDisplayEventTypeEXT
{
    firstPixelOutExt = 0,
    beginRangeExt = 0,
    endRangeExt = 0,
    rangeSizeExt = 1,
    maxEnumExt = 2147483647
}

struct VkDisplayPowerInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkDisplayPowerStateEXT powerState;
}

struct VkDeviceEventInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkDeviceEventTypeEXT deviceEvent;
}

struct VkDisplayEventInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkDisplayEventTypeEXT displayEvent;
}

struct VkSwapchainCounterCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkSurfaceCounterFlagsEXT surfaceCounters;
}

alias PFN_vkDisplayPowerControlEXT = VkResult function (VkDevice device, VkDisplayKHR display, const(VkDisplayPowerInfoEXT)* pDisplayPowerInfo);
alias PFN_vkRegisterDeviceEventEXT = VkResult function (VkDevice device, const(VkDeviceEventInfoEXT)* pDeviceEventInfo, const(VkAllocationCallbacks)* pAllocator, VkFence* pFence);
alias PFN_vkRegisterDisplayEventEXT = VkResult function (VkDevice device, VkDisplayKHR display, const(VkDisplayEventInfoEXT)* pDisplayEventInfo, const(VkAllocationCallbacks)* pAllocator, VkFence* pFence);
alias PFN_vkGetSwapchainCounterEXT = VkResult function (VkDevice device, VkSwapchainKHR swapchain, VkSurfaceCounterFlagEXT counter, ulong* pCounterValue);

VkResult vkDisplayPowerControlEXT (
    VkDevice device,
    VkDisplayKHR display,
    const(VkDisplayPowerInfoEXT)* pDisplayPowerInfo);

VkResult vkRegisterDeviceEventEXT (
    VkDevice device,
    const(VkDeviceEventInfoEXT)* pDeviceEventInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkFence* pFence);

VkResult vkRegisterDisplayEventEXT (
    VkDevice device,
    VkDisplayKHR display,
    const(VkDisplayEventInfoEXT)* pDisplayEventInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkFence* pFence);

VkResult vkGetSwapchainCounterEXT (
    VkDevice device,
    VkSwapchainKHR swapchain,
    VkSurfaceCounterFlagEXT counter,
    ulong* pCounterValue);

enum VK_GOOGLE_display_timing = 1;
enum VK_GOOGLE_DISPLAY_TIMING_SPEC_VERSION = 1;
enum VK_GOOGLE_DISPLAY_TIMING_EXTENSION_NAME = "VK_GOOGLE_display_timing";

struct VkRefreshCycleDurationGOOGLE
{
    ulong refreshDuration;
}

struct VkPastPresentationTimingGOOGLE
{
    uint presentID;
    ulong desiredPresentTime;
    ulong actualPresentTime;
    ulong earliestPresentTime;
    ulong presentMargin;
}

struct VkPresentTimeGOOGLE
{
    uint presentID;
    ulong desiredPresentTime;
}

struct VkPresentTimesInfoGOOGLE
{
    VkStructureType sType;
    const(void)* pNext;
    uint swapchainCount;
    const(VkPresentTimeGOOGLE)* pTimes;
}

alias PFN_vkGetRefreshCycleDurationGOOGLE = VkResult function (VkDevice device, VkSwapchainKHR swapchain, VkRefreshCycleDurationGOOGLE* pDisplayTimingProperties);
alias PFN_vkGetPastPresentationTimingGOOGLE = VkResult function (VkDevice device, VkSwapchainKHR swapchain, uint* pPresentationTimingCount, VkPastPresentationTimingGOOGLE* pPresentationTimings);

VkResult vkGetRefreshCycleDurationGOOGLE (
    VkDevice device,
    VkSwapchainKHR swapchain,
    VkRefreshCycleDurationGOOGLE* pDisplayTimingProperties);

VkResult vkGetPastPresentationTimingGOOGLE (
    VkDevice device,
    VkSwapchainKHR swapchain,
    uint* pPresentationTimingCount,
    VkPastPresentationTimingGOOGLE* pPresentationTimings);

enum VK_NV_sample_mask_override_coverage = 1;
enum VK_NV_SAMPLE_MASK_OVERRIDE_COVERAGE_SPEC_VERSION = 1;
enum VK_NV_SAMPLE_MASK_OVERRIDE_COVERAGE_EXTENSION_NAME = "VK_NV_sample_mask_override_coverage";

enum VK_NV_geometry_shader_passthrough = 1;
enum VK_NV_GEOMETRY_SHADER_PASSTHROUGH_SPEC_VERSION = 1;
enum VK_NV_GEOMETRY_SHADER_PASSTHROUGH_EXTENSION_NAME = "VK_NV_geometry_shader_passthrough";

enum VK_NV_viewport_array2 = 1;
enum VK_NV_VIEWPORT_ARRAY2_SPEC_VERSION = 1;
enum VK_NV_VIEWPORT_ARRAY2_EXTENSION_NAME = "VK_NV_viewport_array2";

enum VK_NVX_multiview_per_view_attributes = 1;
enum VK_NVX_MULTIVIEW_PER_VIEW_ATTRIBUTES_SPEC_VERSION = 1;
enum VK_NVX_MULTIVIEW_PER_VIEW_ATTRIBUTES_EXTENSION_NAME = "VK_NVX_multiview_per_view_attributes";

struct VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX
{
    VkStructureType sType;
    void* pNext;
    VkBool32 perViewPositionAllComponents;
}

enum VK_NV_viewport_swizzle = 1;
enum VK_NV_VIEWPORT_SWIZZLE_SPEC_VERSION = 1;
enum VK_NV_VIEWPORT_SWIZZLE_EXTENSION_NAME = "VK_NV_viewport_swizzle";

enum VkViewportCoordinateSwizzleNV
{
    positiveXNv = 0,
    negativeXNv = 1,
    positiveYNv = 2,
    negativeYNv = 3,
    positiveZNv = 4,
    negativeZNv = 5,
    positiveWNv = 6,
    negativeWNv = 7,
    beginRangeNv = 0,
    endRangeNv = 7,
    rangeSizeNv = 8,
    maxEnumNv = 2147483647
}

alias VkPipelineViewportSwizzleStateCreateFlagsNV = uint;

struct VkViewportSwizzleNV
{
    VkViewportCoordinateSwizzleNV x;
    VkViewportCoordinateSwizzleNV y;
    VkViewportCoordinateSwizzleNV z;
    VkViewportCoordinateSwizzleNV w;
}

struct VkPipelineViewportSwizzleStateCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineViewportSwizzleStateCreateFlagsNV flags;
    uint viewportCount;
    const(VkViewportSwizzleNV)* pViewportSwizzles;
}

enum VK_EXT_discard_rectangles = 1;
enum VK_EXT_DISCARD_RECTANGLES_SPEC_VERSION = 1;
enum VK_EXT_DISCARD_RECTANGLES_EXTENSION_NAME = "VK_EXT_discard_rectangles";

enum VkDiscardRectangleModeEXT
{
    inclusiveExt = 0,
    exclusiveExt = 1,
    beginRangeExt = 0,
    endRangeExt = 1,
    rangeSizeExt = 2,
    maxEnumExt = 2147483647
}

alias VkPipelineDiscardRectangleStateCreateFlagsEXT = uint;

struct VkPhysicalDeviceDiscardRectanglePropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    uint maxDiscardRectangles;
}

struct VkPipelineDiscardRectangleStateCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineDiscardRectangleStateCreateFlagsEXT flags;
    VkDiscardRectangleModeEXT discardRectangleMode;
    uint discardRectangleCount;
    const(VkRect2D)* pDiscardRectangles;
}

alias PFN_vkCmdSetDiscardRectangleEXT = void function (VkCommandBuffer commandBuffer, uint firstDiscardRectangle, uint discardRectangleCount, const(VkRect2D)* pDiscardRectangles);

void vkCmdSetDiscardRectangleEXT (
    VkCommandBuffer commandBuffer,
    uint firstDiscardRectangle,
    uint discardRectangleCount,
    const(VkRect2D)* pDiscardRectangles);

enum VK_EXT_conservative_rasterization = 1;
enum VK_EXT_CONSERVATIVE_RASTERIZATION_SPEC_VERSION = 1;
enum VK_EXT_CONSERVATIVE_RASTERIZATION_EXTENSION_NAME = "VK_EXT_conservative_rasterization";

enum VkConservativeRasterizationModeEXT
{
    disabledExt = 0,
    overestimateExt = 1,
    underestimateExt = 2,
    beginRangeExt = 0,
    endRangeExt = 2,
    rangeSizeExt = 3,
    maxEnumExt = 2147483647
}

alias VkPipelineRasterizationConservativeStateCreateFlagsEXT = uint;

struct VkPhysicalDeviceConservativeRasterizationPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    float primitiveOverestimationSize;
    float maxExtraPrimitiveOverestimationSize;
    float extraPrimitiveOverestimationSizeGranularity;
    VkBool32 primitiveUnderestimation;
    VkBool32 conservativePointAndLineRasterization;
    VkBool32 degenerateTrianglesRasterized;
    VkBool32 degenerateLinesRasterized;
    VkBool32 fullyCoveredFragmentShaderInputVariable;
    VkBool32 conservativeRasterizationPostDepthCoverage;
}

struct VkPipelineRasterizationConservativeStateCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineRasterizationConservativeStateCreateFlagsEXT flags;
    VkConservativeRasterizationModeEXT conservativeRasterizationMode;
    float extraPrimitiveOverestimationSize;
}

enum VK_EXT_swapchain_colorspace = 1;
enum VK_EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION = 3;
enum VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME = "VK_EXT_swapchain_colorspace";

enum VK_EXT_hdr_metadata = 1;
enum VK_EXT_HDR_METADATA_SPEC_VERSION = 1;
enum VK_EXT_HDR_METADATA_EXTENSION_NAME = "VK_EXT_hdr_metadata";

struct VkXYColorEXT
{
    float x;
    float y;
}

struct VkHdrMetadataEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkXYColorEXT displayPrimaryRed;
    VkXYColorEXT displayPrimaryGreen;
    VkXYColorEXT displayPrimaryBlue;
    VkXYColorEXT whitePoint;
    float maxLuminance;
    float minLuminance;
    float maxContentLightLevel;
    float maxFrameAverageLightLevel;
}

alias PFN_vkSetHdrMetadataEXT = void function (VkDevice device, uint swapchainCount, const(VkSwapchainKHR)* pSwapchains, const(VkHdrMetadataEXT)* pMetadata);

void vkSetHdrMetadataEXT (
    VkDevice device,
    uint swapchainCount,
    const(VkSwapchainKHR)* pSwapchains,
    const(VkHdrMetadataEXT)* pMetadata);

enum VK_EXT_external_memory_dma_buf = 1;
enum VK_EXT_EXTERNAL_MEMORY_DMA_BUF_SPEC_VERSION = 1;
enum VK_EXT_EXTERNAL_MEMORY_DMA_BUF_EXTENSION_NAME = "VK_EXT_external_memory_dma_buf";

enum VK_EXT_queue_family_foreign = 1;
enum VK_EXT_QUEUE_FAMILY_FOREIGN_SPEC_VERSION = 1;
enum VK_EXT_QUEUE_FAMILY_FOREIGN_EXTENSION_NAME = "VK_EXT_queue_family_foreign";
enum VK_QUEUE_FAMILY_FOREIGN_EXT = ~0U - 2;

enum VK_EXT_debug_utils = 1;
struct VkDebugUtilsMessengerEXT_T;
alias VkDebugUtilsMessengerEXT = VkDebugUtilsMessengerEXT_T*;

enum VK_EXT_DEBUG_UTILS_SPEC_VERSION = 1;
enum VK_EXT_DEBUG_UTILS_EXTENSION_NAME = "VK_EXT_debug_utils";

alias VkDebugUtilsMessengerCallbackDataFlagsEXT = uint;
alias VkDebugUtilsMessengerCreateFlagsEXT = uint;

enum VkDebugUtilsMessageSeverityFlagEXT
{
    verboseBitExt = 1,
    infoBitExt = 16,
    warningBitExt = 256,
    errorBitExt = 4096,
    flagBitsMaxEnumExt = 2147483647
}

alias VkDebugUtilsMessageSeverityFlagsEXT = uint;

enum VkDebugUtilsMessageTypeFlagEXT
{
    generalBitExt = 1,
    validationBitExt = 2,
    performanceBitExt = 4,
    flagBitsMaxEnumExt = 2147483647
}

alias VkDebugUtilsMessageTypeFlagsEXT = uint;

struct VkDebugUtilsObjectNameInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkObjectType objectType;
    ulong objectHandle;
    const(char)* pObjectName;
}

struct VkDebugUtilsObjectTagInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkObjectType objectType;
    ulong objectHandle;
    ulong tagName;
    size_t tagSize;
    const(void)* pTag;
}

struct VkDebugUtilsLabelEXT
{
    VkStructureType sType;
    const(void)* pNext;
    const(char)* pLabelName;
    float[4] color;
}

struct VkDebugUtilsMessengerCallbackDataEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkDebugUtilsMessengerCallbackDataFlagsEXT flags;
    const(char)* pMessageIdName;
    int messageIdNumber;
    const(char)* pMessage;
    uint queueLabelCount;
    VkDebugUtilsLabelEXT* pQueueLabels;
    uint cmdBufLabelCount;
    VkDebugUtilsLabelEXT* pCmdBufLabels;
    uint objectCount;
    VkDebugUtilsObjectNameInfoEXT* pObjects;
}

alias PFN_vkDebugUtilsMessengerCallbackEXT = uint function (
    VkDebugUtilsMessageSeverityFlagEXT messageSeverity,
    VkDebugUtilsMessageTypeFlagsEXT messageTypes,
    const(VkDebugUtilsMessengerCallbackDataEXT)* pCallbackData,
    void* pUserData);

struct VkDebugUtilsMessengerCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkDebugUtilsMessengerCreateFlagsEXT flags;
    VkDebugUtilsMessageSeverityFlagsEXT messageSeverity;
    VkDebugUtilsMessageTypeFlagsEXT messageType;
    PFN_vkDebugUtilsMessengerCallbackEXT pfnUserCallback;
    void* pUserData;
}

alias PFN_vkSetDebugUtilsObjectNameEXT = VkResult function (VkDevice device, const(VkDebugUtilsObjectNameInfoEXT)* pNameInfo);
alias PFN_vkSetDebugUtilsObjectTagEXT = VkResult function (VkDevice device, const(VkDebugUtilsObjectTagInfoEXT)* pTagInfo);
alias PFN_vkQueueBeginDebugUtilsLabelEXT = void function (VkQueue queue, const(VkDebugUtilsLabelEXT)* pLabelInfo);
alias PFN_vkQueueEndDebugUtilsLabelEXT = void function (VkQueue queue);
alias PFN_vkQueueInsertDebugUtilsLabelEXT = void function (VkQueue queue, const(VkDebugUtilsLabelEXT)* pLabelInfo);
alias PFN_vkCmdBeginDebugUtilsLabelEXT = void function (VkCommandBuffer commandBuffer, const(VkDebugUtilsLabelEXT)* pLabelInfo);
alias PFN_vkCmdEndDebugUtilsLabelEXT = void function (VkCommandBuffer commandBuffer);
alias PFN_vkCmdInsertDebugUtilsLabelEXT = void function (VkCommandBuffer commandBuffer, const(VkDebugUtilsLabelEXT)* pLabelInfo);
alias PFN_vkCreateDebugUtilsMessengerEXT = VkResult function (VkInstance instance, const(VkDebugUtilsMessengerCreateInfoEXT)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkDebugUtilsMessengerEXT* pMessenger);
alias PFN_vkDestroyDebugUtilsMessengerEXT = void function (VkInstance instance, VkDebugUtilsMessengerEXT messenger, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkSubmitDebugUtilsMessageEXT = void function (VkInstance instance, VkDebugUtilsMessageSeverityFlagEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, const(VkDebugUtilsMessengerCallbackDataEXT)* pCallbackData);

VkResult vkSetDebugUtilsObjectNameEXT (
    VkDevice device,
    const(VkDebugUtilsObjectNameInfoEXT)* pNameInfo);

VkResult vkSetDebugUtilsObjectTagEXT (
    VkDevice device,
    const(VkDebugUtilsObjectTagInfoEXT)* pTagInfo);

void vkQueueBeginDebugUtilsLabelEXT (
    VkQueue queue,
    const(VkDebugUtilsLabelEXT)* pLabelInfo);

void vkQueueEndDebugUtilsLabelEXT (VkQueue queue);

void vkQueueInsertDebugUtilsLabelEXT (
    VkQueue queue,
    const(VkDebugUtilsLabelEXT)* pLabelInfo);

void vkCmdBeginDebugUtilsLabelEXT (
    VkCommandBuffer commandBuffer,
    const(VkDebugUtilsLabelEXT)* pLabelInfo);

void vkCmdEndDebugUtilsLabelEXT (VkCommandBuffer commandBuffer);

void vkCmdInsertDebugUtilsLabelEXT (
    VkCommandBuffer commandBuffer,
    const(VkDebugUtilsLabelEXT)* pLabelInfo);

VkResult vkCreateDebugUtilsMessengerEXT (
    VkInstance instance,
    const(VkDebugUtilsMessengerCreateInfoEXT)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkDebugUtilsMessengerEXT* pMessenger);

void vkDestroyDebugUtilsMessengerEXT (
    VkInstance instance,
    VkDebugUtilsMessengerEXT messenger,
    const(VkAllocationCallbacks)* pAllocator);

void vkSubmitDebugUtilsMessageEXT (
    VkInstance instance,
    VkDebugUtilsMessageSeverityFlagEXT messageSeverity,
    VkDebugUtilsMessageTypeFlagsEXT messageTypes,
    const(VkDebugUtilsMessengerCallbackDataEXT)* pCallbackData);

enum VK_EXT_sampler_filter_minmax = 1;
enum VK_EXT_SAMPLER_FILTER_MINMAX_SPEC_VERSION = 1;
enum VK_EXT_SAMPLER_FILTER_MINMAX_EXTENSION_NAME = "VK_EXT_sampler_filter_minmax";

enum VkSamplerReductionModeEXT
{
    weightedAverageExt = 0,
    minExt = 1,
    maxExt = 2,
    beginRangeExt = 0,
    endRangeExt = 2,
    rangeSizeExt = 3,
    maxEnumExt = 2147483647
}

struct VkSamplerReductionModeCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkSamplerReductionModeEXT reductionMode;
}

struct VkPhysicalDeviceSamplerFilterMinmaxPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    VkBool32 filterMinmaxSingleComponentFormats;
    VkBool32 filterMinmaxImageComponentMapping;
}

enum VK_AMD_gpu_shader_int16 = 1;
enum VK_AMD_GPU_SHADER_INT16_SPEC_VERSION = 1;
enum VK_AMD_GPU_SHADER_INT16_EXTENSION_NAME = "VK_AMD_gpu_shader_int16";

enum VK_AMD_mixed_attachment_samples = 1;
enum VK_AMD_MIXED_ATTACHMENT_SAMPLES_SPEC_VERSION = 1;
enum VK_AMD_MIXED_ATTACHMENT_SAMPLES_EXTENSION_NAME = "VK_AMD_mixed_attachment_samples";

enum VK_AMD_shader_fragment_mask = 1;
enum VK_AMD_SHADER_FRAGMENT_MASK_SPEC_VERSION = 1;
enum VK_AMD_SHADER_FRAGMENT_MASK_EXTENSION_NAME = "VK_AMD_shader_fragment_mask";

enum VK_EXT_inline_uniform_block = 1;
enum VK_EXT_INLINE_UNIFORM_BLOCK_SPEC_VERSION = 1;
enum VK_EXT_INLINE_UNIFORM_BLOCK_EXTENSION_NAME = "VK_EXT_inline_uniform_block";

struct VkPhysicalDeviceInlineUniformBlockFeaturesEXT
{
    VkStructureType sType;
    void* pNext;
    VkBool32 inlineUniformBlock;
    VkBool32 descriptorBindingInlineUniformBlockUpdateAfterBind;
}

struct VkPhysicalDeviceInlineUniformBlockPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    uint maxInlineUniformBlockSize;
    uint maxPerStageDescriptorInlineUniformBlocks;
    uint maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks;
    uint maxDescriptorSetInlineUniformBlocks;
    uint maxDescriptorSetUpdateAfterBindInlineUniformBlocks;
}

struct VkWriteDescriptorSetInlineUniformBlockEXT
{
    VkStructureType sType;
    const(void)* pNext;
    uint dataSize;
    const(void)* pData;
}

struct VkDescriptorPoolInlineUniformBlockCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    uint maxInlineUniformBlockBindings;
}

enum VK_EXT_shader_stencil_export = 1;
enum VK_EXT_SHADER_STENCIL_EXPORT_SPEC_VERSION = 1;
enum VK_EXT_SHADER_STENCIL_EXPORT_EXTENSION_NAME = "VK_EXT_shader_stencil_export";

enum VK_EXT_sample_locations = 1;
enum VK_EXT_SAMPLE_LOCATIONS_SPEC_VERSION = 1;
enum VK_EXT_SAMPLE_LOCATIONS_EXTENSION_NAME = "VK_EXT_sample_locations";

struct VkSampleLocationEXT
{
    float x;
    float y;
}

struct VkSampleLocationsInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkSampleCountFlag sampleLocationsPerPixel;
    VkExtent2D sampleLocationGridSize;
    uint sampleLocationsCount;
    const(VkSampleLocationEXT)* pSampleLocations;
}

struct VkAttachmentSampleLocationsEXT
{
    uint attachmentIndex;
    VkSampleLocationsInfoEXT sampleLocationsInfo;
}

struct VkSubpassSampleLocationsEXT
{
    uint subpassIndex;
    VkSampleLocationsInfoEXT sampleLocationsInfo;
}

struct VkRenderPassSampleLocationsBeginInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    uint attachmentInitialSampleLocationsCount;
    const(VkAttachmentSampleLocationsEXT)* pAttachmentInitialSampleLocations;
    uint postSubpassSampleLocationsCount;
    const(VkSubpassSampleLocationsEXT)* pPostSubpassSampleLocations;
}

struct VkPipelineSampleLocationsStateCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkBool32 sampleLocationsEnable;
    VkSampleLocationsInfoEXT sampleLocationsInfo;
}

struct VkPhysicalDeviceSampleLocationsPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    VkSampleCountFlags sampleLocationSampleCounts;
    VkExtent2D maxSampleLocationGridSize;
    float[2] sampleLocationCoordinateRange;
    uint sampleLocationSubPixelBits;
    VkBool32 variableSampleLocations;
}

struct VkMultisamplePropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    VkExtent2D maxSampleLocationGridSize;
}

alias PFN_vkCmdSetSampleLocationsEXT = void function (VkCommandBuffer commandBuffer, const(VkSampleLocationsInfoEXT)* pSampleLocationsInfo);
alias PFN_vkGetPhysicalDeviceMultisamplePropertiesEXT = void function (VkPhysicalDevice physicalDevice, VkSampleCountFlag samples, VkMultisamplePropertiesEXT* pMultisampleProperties);

void vkCmdSetSampleLocationsEXT (
    VkCommandBuffer commandBuffer,
    const(VkSampleLocationsInfoEXT)* pSampleLocationsInfo);

void vkGetPhysicalDeviceMultisamplePropertiesEXT (
    VkPhysicalDevice physicalDevice,
    VkSampleCountFlag samples,
    VkMultisamplePropertiesEXT* pMultisampleProperties);

enum VK_EXT_blend_operation_advanced = 1;
enum VK_EXT_BLEND_OPERATION_ADVANCED_SPEC_VERSION = 2;
enum VK_EXT_BLEND_OPERATION_ADVANCED_EXTENSION_NAME = "VK_EXT_blend_operation_advanced";

enum VkBlendOverlapEXT
{
    uncorrelatedExt = 0,
    disjointExt = 1,
    conjointExt = 2,
    beginRangeExt = 0,
    endRangeExt = 2,
    rangeSizeExt = 3,
    maxEnumExt = 2147483647
}

struct VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT
{
    VkStructureType sType;
    void* pNext;
    VkBool32 advancedBlendCoherentOperations;
}

struct VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    uint advancedBlendMaxColorAttachments;
    VkBool32 advancedBlendIndependentBlend;
    VkBool32 advancedBlendNonPremultipliedSrcColor;
    VkBool32 advancedBlendNonPremultipliedDstColor;
    VkBool32 advancedBlendCorrelatedOverlap;
    VkBool32 advancedBlendAllOperations;
}

struct VkPipelineColorBlendAdvancedStateCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkBool32 srcPremultiplied;
    VkBool32 dstPremultiplied;
    VkBlendOverlapEXT blendOverlap;
}

enum VK_NV_fragment_coverage_to_color = 1;
enum VK_NV_FRAGMENT_COVERAGE_TO_COLOR_SPEC_VERSION = 1;
enum VK_NV_FRAGMENT_COVERAGE_TO_COLOR_EXTENSION_NAME = "VK_NV_fragment_coverage_to_color";

alias VkPipelineCoverageToColorStateCreateFlagsNV = uint;

struct VkPipelineCoverageToColorStateCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineCoverageToColorStateCreateFlagsNV flags;
    VkBool32 coverageToColorEnable;
    uint coverageToColorLocation;
}

enum VK_NV_framebuffer_mixed_samples = 1;
enum VK_NV_FRAMEBUFFER_MIXED_SAMPLES_SPEC_VERSION = 1;
enum VK_NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME = "VK_NV_framebuffer_mixed_samples";

enum VkCoverageModulationModeNV
{
    noneNv = 0,
    rgbNv = 1,
    alphaNv = 2,
    rgbaNv = 3,
    beginRangeNv = 0,
    endRangeNv = 3,
    rangeSizeNv = 4,
    maxEnumNv = 2147483647
}

alias VkPipelineCoverageModulationStateCreateFlagsNV = uint;

struct VkPipelineCoverageModulationStateCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineCoverageModulationStateCreateFlagsNV flags;
    VkCoverageModulationModeNV coverageModulationMode;
    VkBool32 coverageModulationTableEnable;
    uint coverageModulationTableCount;
    const(float)* pCoverageModulationTable;
}

enum VK_NV_fill_rectangle = 1;
enum VK_NV_FILL_RECTANGLE_SPEC_VERSION = 1;
enum VK_NV_FILL_RECTANGLE_EXTENSION_NAME = "VK_NV_fill_rectangle";

enum VK_EXT_post_depth_coverage = 1;
enum VK_EXT_POST_DEPTH_COVERAGE_SPEC_VERSION = 1;
enum VK_EXT_POST_DEPTH_COVERAGE_EXTENSION_NAME = "VK_EXT_post_depth_coverage";

enum VK_EXT_image_drm_format_modifier = 1;
enum VK_EXT_IMAGE_DRM_FORMAT_MODIFIER_SPEC_VERSION = 1;
enum VK_EXT_IMAGE_DRM_FORMAT_MODIFIER_EXTENSION_NAME = "VK_EXT_image_drm_format_modifier";

struct VkDrmFormatModifierPropertiesEXT
{
    ulong drmFormatModifier;
    uint drmFormatModifierPlaneCount;
    VkFormatFeatureFlags drmFormatModifierTilingFeatures;
}

struct VkDrmFormatModifierPropertiesListEXT
{
    VkStructureType sType;
    void* pNext;
    uint drmFormatModifierCount;
    VkDrmFormatModifierPropertiesEXT* pDrmFormatModifierProperties;
}

struct VkPhysicalDeviceImageDrmFormatModifierInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    ulong drmFormatModifier;
    VkSharingMode sharingMode;
    uint queueFamilyIndexCount;
    const(uint)* pQueueFamilyIndices;
}

struct VkImageDrmFormatModifierListCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    uint drmFormatModifierCount;
    const(ulong)* pDrmFormatModifiers;
}

struct VkImageDrmFormatModifierExplicitCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    ulong drmFormatModifier;
    uint drmFormatModifierPlaneCount;
    const(VkSubresourceLayout)* pPlaneLayouts;
}

struct VkImageDrmFormatModifierPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    ulong drmFormatModifier;
}

alias PFN_vkGetImageDrmFormatModifierPropertiesEXT = VkResult function (VkDevice device, VkImage image, VkImageDrmFormatModifierPropertiesEXT* pProperties);

VkResult vkGetImageDrmFormatModifierPropertiesEXT (
    VkDevice device,
    VkImage image,
    VkImageDrmFormatModifierPropertiesEXT* pProperties);

enum VK_EXT_validation_cache = 1;
struct VkValidationCacheEXT_T;
alias VkValidationCacheEXT = VkValidationCacheEXT_T*;

enum VK_EXT_VALIDATION_CACHE_SPEC_VERSION = 1;
enum VK_EXT_VALIDATION_CACHE_EXTENSION_NAME = "VK_EXT_validation_cache";

enum VkValidationCacheHeaderVersionEXT
{
    oneExt = 1,
    beginRangeExt = 1,
    endRangeExt = 1,
    rangeSizeExt = 1,
    maxEnumExt = 2147483647
}

alias VkValidationCacheCreateFlagsEXT = uint;

struct VkValidationCacheCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkValidationCacheCreateFlagsEXT flags;
    size_t initialDataSize;
    const(void)* pInitialData;
}

struct VkShaderModuleValidationCacheCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkValidationCacheEXT validationCache;
}

alias PFN_vkCreateValidationCacheEXT = VkResult function (VkDevice device, const(VkValidationCacheCreateInfoEXT)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkValidationCacheEXT* pValidationCache);
alias PFN_vkDestroyValidationCacheEXT = void function (VkDevice device, VkValidationCacheEXT validationCache, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkMergeValidationCachesEXT = VkResult function (VkDevice device, VkValidationCacheEXT dstCache, uint srcCacheCount, const(VkValidationCacheEXT)* pSrcCaches);
alias PFN_vkGetValidationCacheDataEXT = VkResult function (VkDevice device, VkValidationCacheEXT validationCache, size_t* pDataSize, void* pData);

VkResult vkCreateValidationCacheEXT (
    VkDevice device,
    const(VkValidationCacheCreateInfoEXT)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkValidationCacheEXT* pValidationCache);

void vkDestroyValidationCacheEXT (
    VkDevice device,
    VkValidationCacheEXT validationCache,
    const(VkAllocationCallbacks)* pAllocator);

VkResult vkMergeValidationCachesEXT (
    VkDevice device,
    VkValidationCacheEXT dstCache,
    uint srcCacheCount,
    const(VkValidationCacheEXT)* pSrcCaches);

VkResult vkGetValidationCacheDataEXT (
    VkDevice device,
    VkValidationCacheEXT validationCache,
    size_t* pDataSize,
    void* pData);

enum VK_EXT_descriptor_indexing = 1;
enum VK_EXT_DESCRIPTOR_INDEXING_SPEC_VERSION = 2;
enum VK_EXT_DESCRIPTOR_INDEXING_EXTENSION_NAME = "VK_EXT_descriptor_indexing";

enum VkDescriptorBindingFlagEXT
{
    updateAfterBindBitExt = 1,
    updateUnusedWhilePendingBitExt = 2,
    partiallyBoundBitExt = 4,
    variableDescriptorCountBitExt = 8,
    flagBitsMaxEnumExt = 2147483647
}

alias VkDescriptorBindingFlagsEXT = uint;

struct VkDescriptorSetLayoutBindingFlagsCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    uint bindingCount;
    const(VkDescriptorBindingFlagsEXT)* pBindingFlags;
}

struct VkPhysicalDeviceDescriptorIndexingFeaturesEXT
{
    VkStructureType sType;
    void* pNext;
    VkBool32 shaderInputAttachmentArrayDynamicIndexing;
    VkBool32 shaderUniformTexelBufferArrayDynamicIndexing;
    VkBool32 shaderStorageTexelBufferArrayDynamicIndexing;
    VkBool32 shaderUniformBufferArrayNonUniformIndexing;
    VkBool32 shaderSampledImageArrayNonUniformIndexing;
    VkBool32 shaderStorageBufferArrayNonUniformIndexing;
    VkBool32 shaderStorageImageArrayNonUniformIndexing;
    VkBool32 shaderInputAttachmentArrayNonUniformIndexing;
    VkBool32 shaderUniformTexelBufferArrayNonUniformIndexing;
    VkBool32 shaderStorageTexelBufferArrayNonUniformIndexing;
    VkBool32 descriptorBindingUniformBufferUpdateAfterBind;
    VkBool32 descriptorBindingSampledImageUpdateAfterBind;
    VkBool32 descriptorBindingStorageImageUpdateAfterBind;
    VkBool32 descriptorBindingStorageBufferUpdateAfterBind;
    VkBool32 descriptorBindingUniformTexelBufferUpdateAfterBind;
    VkBool32 descriptorBindingStorageTexelBufferUpdateAfterBind;
    VkBool32 descriptorBindingUpdateUnusedWhilePending;
    VkBool32 descriptorBindingPartiallyBound;
    VkBool32 descriptorBindingVariableDescriptorCount;
    VkBool32 runtimeDescriptorArray;
}

struct VkPhysicalDeviceDescriptorIndexingPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    uint maxUpdateAfterBindDescriptorsInAllPools;
    VkBool32 shaderUniformBufferArrayNonUniformIndexingNative;
    VkBool32 shaderSampledImageArrayNonUniformIndexingNative;
    VkBool32 shaderStorageBufferArrayNonUniformIndexingNative;
    VkBool32 shaderStorageImageArrayNonUniformIndexingNative;
    VkBool32 shaderInputAttachmentArrayNonUniformIndexingNative;
    VkBool32 robustBufferAccessUpdateAfterBind;
    VkBool32 quadDivergentImplicitLod;
    uint maxPerStageDescriptorUpdateAfterBindSamplers;
    uint maxPerStageDescriptorUpdateAfterBindUniformBuffers;
    uint maxPerStageDescriptorUpdateAfterBindStorageBuffers;
    uint maxPerStageDescriptorUpdateAfterBindSampledImages;
    uint maxPerStageDescriptorUpdateAfterBindStorageImages;
    uint maxPerStageDescriptorUpdateAfterBindInputAttachments;
    uint maxPerStageUpdateAfterBindResources;
    uint maxDescriptorSetUpdateAfterBindSamplers;
    uint maxDescriptorSetUpdateAfterBindUniformBuffers;
    uint maxDescriptorSetUpdateAfterBindUniformBuffersDynamic;
    uint maxDescriptorSetUpdateAfterBindStorageBuffers;
    uint maxDescriptorSetUpdateAfterBindStorageBuffersDynamic;
    uint maxDescriptorSetUpdateAfterBindSampledImages;
    uint maxDescriptorSetUpdateAfterBindStorageImages;
    uint maxDescriptorSetUpdateAfterBindInputAttachments;
}

struct VkDescriptorSetVariableDescriptorCountAllocateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    uint descriptorSetCount;
    const(uint)* pDescriptorCounts;
}

struct VkDescriptorSetVariableDescriptorCountLayoutSupportEXT
{
    VkStructureType sType;
    void* pNext;
    uint maxVariableDescriptorCount;
}

enum VK_EXT_shader_viewport_index_layer = 1;
enum VK_EXT_SHADER_VIEWPORT_INDEX_LAYER_SPEC_VERSION = 1;
enum VK_EXT_SHADER_VIEWPORT_INDEX_LAYER_EXTENSION_NAME = "VK_EXT_shader_viewport_index_layer";

enum VK_NV_shading_rate_image = 1;
enum VK_NV_SHADING_RATE_IMAGE_SPEC_VERSION = 3;
enum VK_NV_SHADING_RATE_IMAGE_EXTENSION_NAME = "VK_NV_shading_rate_image";

enum VkShadingRatePaletteEntryNV
{
    noInvocationsNv = 0,
    i16InvocationsPerPixelNv = 1,
    i8InvocationsPerPixelNv = 2,
    i4InvocationsPerPixelNv = 3,
    i2InvocationsPerPixelNv = 4,
    i1InvocationPerPixelNv = 5,
    i1InvocationPer2x1PixelsNv = 6,
    i1InvocationPer1x2PixelsNv = 7,
    i1InvocationPer2x2PixelsNv = 8,
    i1InvocationPer4x2PixelsNv = 9,
    i1InvocationPer2x4PixelsNv = 10,
    i1InvocationPer4x4PixelsNv = 11,
    beginRangeNv = 0,
    endRangeNv = 11,
    rangeSizeNv = 12,
    maxEnumNv = 2147483647
}

enum VkCoarseSampleOrderTypeNV
{
    defaultNv = 0,
    customNv = 1,
    pixelMajorNv = 2,
    sampleMajorNv = 3,
    beginRangeNv = 0,
    endRangeNv = 3,
    rangeSizeNv = 4,
    maxEnumNv = 2147483647
}

struct VkShadingRatePaletteNV
{
    uint shadingRatePaletteEntryCount;
    const(VkShadingRatePaletteEntryNV)* pShadingRatePaletteEntries;
}

struct VkPipelineViewportShadingRateImageStateCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkBool32 shadingRateImageEnable;
    uint viewportCount;
    const(VkShadingRatePaletteNV)* pShadingRatePalettes;
}

struct VkPhysicalDeviceShadingRateImageFeaturesNV
{
    VkStructureType sType;
    void* pNext;
    VkBool32 shadingRateImage;
    VkBool32 shadingRateCoarseSampleOrder;
}

struct VkPhysicalDeviceShadingRateImagePropertiesNV
{
    VkStructureType sType;
    void* pNext;
    VkExtent2D shadingRateTexelSize;
    uint shadingRatePaletteSize;
    uint shadingRateMaxCoarseSamples;
}

struct VkCoarseSampleLocationNV
{
    uint pixelX;
    uint pixelY;
    uint sample;
}

struct VkCoarseSampleOrderCustomNV
{
    VkShadingRatePaletteEntryNV shadingRate;
    uint sampleCount;
    uint sampleLocationCount;
    const(VkCoarseSampleLocationNV)* pSampleLocations;
}

struct VkPipelineViewportCoarseSampleOrderStateCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkCoarseSampleOrderTypeNV sampleOrderType;
    uint customSampleOrderCount;
    const(VkCoarseSampleOrderCustomNV)* pCustomSampleOrders;
}

alias PFN_vkCmdBindShadingRateImageNV = void function (VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout);
alias PFN_vkCmdSetViewportShadingRatePaletteNV = void function (VkCommandBuffer commandBuffer, uint firstViewport, uint viewportCount, const(VkShadingRatePaletteNV)* pShadingRatePalettes);
alias PFN_vkCmdSetCoarseSampleOrderNV = void function (VkCommandBuffer commandBuffer, VkCoarseSampleOrderTypeNV sampleOrderType, uint customSampleOrderCount, const(VkCoarseSampleOrderCustomNV)* pCustomSampleOrders);

void vkCmdBindShadingRateImageNV (
    VkCommandBuffer commandBuffer,
    VkImageView imageView,
    VkImageLayout imageLayout);

void vkCmdSetViewportShadingRatePaletteNV (
    VkCommandBuffer commandBuffer,
    uint firstViewport,
    uint viewportCount,
    const(VkShadingRatePaletteNV)* pShadingRatePalettes);

void vkCmdSetCoarseSampleOrderNV (
    VkCommandBuffer commandBuffer,
    VkCoarseSampleOrderTypeNV sampleOrderType,
    uint customSampleOrderCount,
    const(VkCoarseSampleOrderCustomNV)* pCustomSampleOrders);

enum VK_NV_ray_tracing = 1;
struct VkAccelerationStructureNV_T;
alias VkAccelerationStructureNV = VkAccelerationStructureNV_T*;

enum VK_NV_RAY_TRACING_SPEC_VERSION = 2;
enum VK_NV_RAY_TRACING_EXTENSION_NAME = "VK_NV_ray_tracing";
enum VK_SHADER_UNUSED_NV = ~0U;

enum VkRayTracingShaderGroupTypeNV
{
    generalNv = 0,
    trianglesHitGroupNv = 1,
    proceduralHitGroupNv = 2,
    beginRangeNv = 0,
    endRangeNv = 2,
    rangeSizeNv = 3,
    maxEnumNv = 2147483647
}

enum VkGeometryTypeNV
{
    TrianglesNv = 0,
    AabbsNv = 1,
    BeginRangeNv = 0,
    EndRangeNv = 1,
    RangeSizeNv = 2,
    MaxEnumNv = 2147483647
}

enum VkAccelerationStructureTypeNV
{
    topLevelNv = 0,
    bottomLevelNv = 1,
    beginRangeNv = 0,
    endRangeNv = 1,
    rangeSizeNv = 2,
    maxEnumNv = 2147483647
}

enum VkCopyAccelerationStructureModeNV
{
    cloneNv = 0,
    compactNv = 1,
    beginRangeNv = 0,
    endRangeNv = 1,
    rangeSizeNv = 2,
    maxEnumNv = 2147483647
}

enum VkAccelerationStructureMemoryRequirementsTypeNV
{
    objectNv = 0,
    buildScratchNv = 1,
    updateScratchNv = 2,
    beginRangeNv = 0,
    endRangeNv = 2,
    rangeSizeNv = 3,
    maxEnumNv = 2147483647
}

enum VkGeometryFlagNV
{
    opaqueBitNv = 1,
    noDuplicateAnyHitInvocationBitNv = 2,
    flagBitsMaxEnumNv = 2147483647
}

alias VkGeometryFlagsNV = uint;

enum VkGeometryInstanceFlagNV
{
    triangleCullDisableBitNv = 1,
    triangleFrontCounterclockwiseBitNv = 2,
    forceOpaqueBitNv = 4,
    forceNoOpaqueBitNv = 8,
    flagBitsMaxEnumNv = 2147483647
}

alias VkGeometryInstanceFlagsNV = uint;

enum VkBuildAccelerationStructureFlagNV
{
    allowUpdateBitNv = 1,
    allowCompactionBitNv = 2,
    preferFastTraceBitNv = 4,
    preferFastBuildBitNv = 8,
    lowMemoryBitNv = 16,
    flagBitsMaxEnumNv = 2147483647
}

alias VkBuildAccelerationStructureFlagsNV = uint;

struct VkRayTracingShaderGroupCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkRayTracingShaderGroupTypeNV type;
    uint generalShader;
    uint closestHitShader;
    uint anyHitShader;
    uint intersectionShader;
}

struct VkRayTracingPipelineCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkPipelineCreateFlags flags;
    uint stageCount;
    const(VkPipelineShaderStageCreateInfo)* pStages;
    uint groupCount;
    const(VkRayTracingShaderGroupCreateInfoNV)* pGroups;
    uint maxRecursionDepth;
    VkPipelineLayout layout;
    VkPipeline basePipelineHandle;
    int basePipelineIndex;
}

struct VkGeometryTrianglesNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkBuffer vertexData;
    VkDeviceSize vertexOffset;
    uint vertexCount;
    VkDeviceSize vertexStride;
    VkFormat vertexFormat;
    VkBuffer indexData;
    VkDeviceSize indexOffset;
    uint indexCount;
    VkIndexType indexType;
    VkBuffer transformData;
    VkDeviceSize transformOffset;
}

struct VkGeometryAABBNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkBuffer aabbData;
    uint numAABBs;
    uint stride;
    VkDeviceSize offset;
}

struct VkGeometryDataNV
{
    VkGeometryTrianglesNV triangles;
    VkGeometryAABBNV aabbs;
}

struct VkGeometryNV
{
    VkStructureType sType;

    const(void)* pNext;
    VkGeometryTypeNV geometryType;
    VkGeometryDataNV geometry;
    VkGeometryFlagsNV flags;
}

struct VkAccelerationStructureInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkAccelerationStructureTypeNV type;
    VkBuildAccelerationStructureFlagsNV flags;
    uint instanceCount;
    uint geometryCount;
    const(VkGeometryNV)* pGeometries;
}

struct VkAccelerationStructureCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkDeviceSize compactedSize;
    VkAccelerationStructureInfoNV info;
}

struct VkBindAccelerationStructureMemoryInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkAccelerationStructureNV accelerationStructure;
    VkDeviceMemory memory;
    VkDeviceSize memoryOffset;
    uint deviceIndexCount;
    const(uint)* pDeviceIndices;
}

struct VkWriteDescriptorSetAccelerationStructureNV
{
    VkStructureType sType;
    const(void)* pNext;
    uint accelerationStructureCount;
    const(VkAccelerationStructureNV)* pAccelerationStructures;
}

struct VkAccelerationStructureMemoryRequirementsInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkAccelerationStructureMemoryRequirementsTypeNV type;
    VkAccelerationStructureNV accelerationStructure;
}

struct VkPhysicalDeviceRayTracingPropertiesNV
{
    VkStructureType sType;
    void* pNext;
    uint shaderGroupHandleSize;
    uint maxRecursionDepth;
    uint maxShaderGroupStride;
    uint shaderGroupBaseAlignment;
    ulong maxGeometryCount;
    ulong maxInstanceCount;
    ulong maxTriangleCount;
    uint maxDescriptorSetAccelerationStructures;
}

alias PFN_vkCreateAccelerationStructureNV = VkResult function (VkDevice device, const(VkAccelerationStructureCreateInfoNV)* pCreateInfo, const(VkAllocationCallbacks)* pAllocator, VkAccelerationStructureNV* pAccelerationStructure);
alias PFN_vkDestroyAccelerationStructureNV = void function (VkDevice device, VkAccelerationStructureNV accelerationStructure, const(VkAllocationCallbacks)* pAllocator);
alias PFN_vkGetAccelerationStructureMemoryRequirementsNV = void function (VkDevice device, const(VkAccelerationStructureMemoryRequirementsInfoNV)* pInfo, VkMemoryRequirements2KHR* pMemoryRequirements);
alias PFN_vkBindAccelerationStructureMemoryNV = VkResult function (VkDevice device, uint bindInfoCount, const(VkBindAccelerationStructureMemoryInfoNV)* pBindInfos);
alias PFN_vkCmdBuildAccelerationStructureNV = void function (VkCommandBuffer commandBuffer, const(VkAccelerationStructureInfoNV)* pInfo, VkBuffer instanceData, VkDeviceSize instanceOffset, VkBool32 update, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkBuffer scratch, VkDeviceSize scratchOffset);
alias PFN_vkCmdCopyAccelerationStructureNV = void function (VkCommandBuffer commandBuffer, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkCopyAccelerationStructureModeNV mode);
alias PFN_vkCmdTraceRaysNV = void function (VkCommandBuffer commandBuffer, VkBuffer raygenShaderBindingTableBuffer, VkDeviceSize raygenShaderBindingOffset, VkBuffer missShaderBindingTableBuffer, VkDeviceSize missShaderBindingOffset, VkDeviceSize missShaderBindingStride, VkBuffer hitShaderBindingTableBuffer, VkDeviceSize hitShaderBindingOffset, VkDeviceSize hitShaderBindingStride, VkBuffer callableShaderBindingTableBuffer, VkDeviceSize callableShaderBindingOffset, VkDeviceSize callableShaderBindingStride, uint width, uint height, uint depth);
alias PFN_vkCreateRayTracingPipelinesNV = VkResult function (VkDevice device, VkPipelineCache pipelineCache, uint createInfoCount, const(VkRayTracingPipelineCreateInfoNV)* pCreateInfos, const(VkAllocationCallbacks)* pAllocator, VkPipeline* pPipelines);
alias PFN_vkGetRayTracingShaderGroupHandlesNV = VkResult function (VkDevice device, VkPipeline pipeline, uint firstGroup, uint groupCount, size_t dataSize, void* pData);
alias PFN_vkGetAccelerationStructureHandleNV = VkResult function (VkDevice device, VkAccelerationStructureNV accelerationStructure, size_t dataSize, void* pData);
alias PFN_vkCmdWriteAccelerationStructuresPropertiesNV = void function (VkCommandBuffer commandBuffer, uint accelerationStructureCount, const(VkAccelerationStructureNV)* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint firstQuery);
alias PFN_vkCompileDeferredNV = VkResult function (VkDevice device, VkPipeline pipeline, uint shader);

VkResult vkCreateAccelerationStructureNV (
    VkDevice device,
    const(VkAccelerationStructureCreateInfoNV)* pCreateInfo,
    const(VkAllocationCallbacks)* pAllocator,
    VkAccelerationStructureNV* pAccelerationStructure);

void vkDestroyAccelerationStructureNV (
    VkDevice device,
    VkAccelerationStructureNV accelerationStructure,
    const(VkAllocationCallbacks)* pAllocator);

void vkGetAccelerationStructureMemoryRequirementsNV (
    VkDevice device,
    const(VkAccelerationStructureMemoryRequirementsInfoNV)* pInfo,
    VkMemoryRequirements2KHR* pMemoryRequirements);

VkResult vkBindAccelerationStructureMemoryNV (
    VkDevice device,
    uint bindInfoCount,
    const(VkBindAccelerationStructureMemoryInfoNV)* pBindInfos);

void vkCmdBuildAccelerationStructureNV (
    VkCommandBuffer commandBuffer,
    const(VkAccelerationStructureInfoNV)* pInfo,
    VkBuffer instanceData,
    VkDeviceSize instanceOffset,
    VkBool32 update,
    VkAccelerationStructureNV dst,
    VkAccelerationStructureNV src,
    VkBuffer scratch,
    VkDeviceSize scratchOffset);

void vkCmdCopyAccelerationStructureNV (
    VkCommandBuffer commandBuffer,
    VkAccelerationStructureNV dst,
    VkAccelerationStructureNV src,
    VkCopyAccelerationStructureModeNV mode);

void vkCmdTraceRaysNV (
    VkCommandBuffer commandBuffer,
    VkBuffer raygenShaderBindingTableBuffer,
    VkDeviceSize raygenShaderBindingOffset,
    VkBuffer missShaderBindingTableBuffer,
    VkDeviceSize missShaderBindingOffset,
    VkDeviceSize missShaderBindingStride,
    VkBuffer hitShaderBindingTableBuffer,
    VkDeviceSize hitShaderBindingOffset,
    VkDeviceSize hitShaderBindingStride,
    VkBuffer callableShaderBindingTableBuffer,
    VkDeviceSize callableShaderBindingOffset,
    VkDeviceSize callableShaderBindingStride,
    uint width,
    uint height,
    uint depth);

VkResult vkCreateRayTracingPipelinesNV (
    VkDevice device,
    VkPipelineCache pipelineCache,
    uint createInfoCount,
    const(VkRayTracingPipelineCreateInfoNV)* pCreateInfos,
    const(VkAllocationCallbacks)* pAllocator,
    VkPipeline* pPipelines);

VkResult vkGetRayTracingShaderGroupHandlesNV (
    VkDevice device,
    VkPipeline pipeline,
    uint firstGroup,
    uint groupCount,
    size_t dataSize,
    void* pData);

VkResult vkGetAccelerationStructureHandleNV (
    VkDevice device,
    VkAccelerationStructureNV accelerationStructure,
    size_t dataSize,
    void* pData);

void vkCmdWriteAccelerationStructuresPropertiesNV (
    VkCommandBuffer commandBuffer,
    uint accelerationStructureCount,
    const(VkAccelerationStructureNV)* pAccelerationStructures,
    VkQueryType queryType,
    VkQueryPool queryPool,
    uint firstQuery);

VkResult vkCompileDeferredNV (
    VkDevice device,
    VkPipeline pipeline,
    uint shader);

enum VK_NV_representative_fragment_test = 1;
enum VK_NV_REPRESENTATIVE_FRAGMENT_TEST_SPEC_VERSION = 1;
enum VK_NV_REPRESENTATIVE_FRAGMENT_TEST_EXTENSION_NAME = "VK_NV_representative_fragment_test";

struct VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV
{
    VkStructureType sType;
    void* pNext;
    VkBool32 representativeFragmentTest;
}

struct VkPipelineRepresentativeFragmentTestStateCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    VkBool32 representativeFragmentTestEnable;
}

enum VK_EXT_global_priority = 1;
enum VK_EXT_GLOBAL_PRIORITY_SPEC_VERSION = 2;
enum VK_EXT_GLOBAL_PRIORITY_EXTENSION_NAME = "VK_EXT_global_priority";

enum VkQueueGlobalPriorityEXT
{
    lowExt = 128,
    mediumExt = 256,
    highExt = 512,
    realtimeExt = 1024,
    beginRangeExt = 128,
    endRangeExt = 1024,
    rangeSizeExt = 897,
    maxEnumExt = 2147483647
}

struct VkDeviceQueueGlobalPriorityCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkQueueGlobalPriorityEXT globalPriority;
}

enum VK_EXT_external_memory_host = 1;
enum VK_EXT_EXTERNAL_MEMORY_HOST_SPEC_VERSION = 1;
enum VK_EXT_EXTERNAL_MEMORY_HOST_EXTENSION_NAME = "VK_EXT_external_memory_host";

struct VkImportMemoryHostPointerInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkExternalMemoryHandleTypeFlag handleType;
    void* pHostPointer;
}

struct VkMemoryHostPointerPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    uint memoryTypeBits;
}

struct VkPhysicalDeviceExternalMemoryHostPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    VkDeviceSize minImportedHostPointerAlignment;
}

alias PFN_vkGetMemoryHostPointerPropertiesEXT = VkResult function (VkDevice device, VkExternalMemoryHandleTypeFlag handleType, const(void)* pHostPointer, VkMemoryHostPointerPropertiesEXT* pMemoryHostPointerProperties);

VkResult vkGetMemoryHostPointerPropertiesEXT (
    VkDevice device,
    VkExternalMemoryHandleTypeFlag handleType,
    const(void)* pHostPointer,
    VkMemoryHostPointerPropertiesEXT* pMemoryHostPointerProperties);

enum VK_AMD_buffer_marker = 1;
enum VK_AMD_BUFFER_MARKER_SPEC_VERSION = 1;
enum VK_AMD_BUFFER_MARKER_EXTENSION_NAME = "VK_AMD_buffer_marker";

alias PFN_vkCmdWriteBufferMarkerAMD = void function (VkCommandBuffer commandBuffer, VkPipelineStageFlag pipelineStage, VkBuffer dstBuffer, VkDeviceSize dstOffset, uint marker);

void vkCmdWriteBufferMarkerAMD (
    VkCommandBuffer commandBuffer,
    VkPipelineStageFlag pipelineStage,
    VkBuffer dstBuffer,
    VkDeviceSize dstOffset,
    uint marker);

enum VK_EXT_calibrated_timestamps = 1;
enum VK_EXT_CALIBRATED_TIMESTAMPS_SPEC_VERSION = 1;
enum VK_EXT_CALIBRATED_TIMESTAMPS_EXTENSION_NAME = "VK_EXT_calibrated_timestamps";

enum VkTimeDomainEXT
{
    deviceExt = 0,
    clockMonotonicExt = 1,
    clockMonotonicRawExt = 2,
    queryPerformanceCounterExt = 3,
    beginRangeExt = 0,
    endRangeExt = 3,
    rangeSizeExt = 4,
    maxEnumExt = 2147483647
}

struct VkCalibratedTimestampInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    VkTimeDomainEXT timeDomain;
}

alias PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT = VkResult function (VkPhysicalDevice physicalDevice, uint* pTimeDomainCount, VkTimeDomainEXT* pTimeDomains);
alias PFN_vkGetCalibratedTimestampsEXT = VkResult function (VkDevice device, uint timestampCount, const(VkCalibratedTimestampInfoEXT)* pTimestampInfos, ulong* pTimestamps, ulong* pMaxDeviation);

VkResult vkGetPhysicalDeviceCalibrateableTimeDomainsEXT (
    VkPhysicalDevice physicalDevice,
    uint* pTimeDomainCount,
    VkTimeDomainEXT* pTimeDomains);

VkResult vkGetCalibratedTimestampsEXT (
    VkDevice device,
    uint timestampCount,
    const(VkCalibratedTimestampInfoEXT)* pTimestampInfos,
    ulong* pTimestamps,
    ulong* pMaxDeviation);

enum VK_AMD_shader_core_properties = 1;
enum VK_AMD_SHADER_CORE_PROPERTIES_SPEC_VERSION = 1;
enum VK_AMD_SHADER_CORE_PROPERTIES_EXTENSION_NAME = "VK_AMD_shader_core_properties";

struct VkPhysicalDeviceShaderCorePropertiesAMD
{
    VkStructureType sType;
    void* pNext;
    uint shaderEngineCount;
    uint shaderArraysPerEngineCount;
    uint computeUnitsPerShaderArray;
    uint simdPerComputeUnit;
    uint wavefrontsPerSimd;
    uint wavefrontSize;
    uint sgprsPerSimd;
    uint minSgprAllocation;
    uint maxSgprAllocation;
    uint sgprAllocationGranularity;
    uint vgprsPerSimd;
    uint minVgprAllocation;
    uint maxVgprAllocation;
    uint vgprAllocationGranularity;
}

enum VK_AMD_memory_overallocation_behavior = 1;
enum VK_AMD_MEMORY_OVERALLOCATION_BEHAVIOR_SPEC_VERSION = 1;
enum VK_AMD_MEMORY_OVERALLOCATION_BEHAVIOR_EXTENSION_NAME = "VK_AMD_memory_overallocation_behavior";

enum VkMemoryOverallocationBehaviorAMD
{
    defaultAmd = 0,
    allowedAmd = 1,
    disallowedAmd = 2,
    beginRangeAmd = 0,
    endRangeAmd = 2,
    rangeSizeAmd = 3,
    maxEnumAmd = 2147483647
}

struct VkDeviceMemoryOverallocationCreateInfoAMD
{
    VkStructureType sType;
    const(void)* pNext;
    VkMemoryOverallocationBehaviorAMD overallocationBehavior;
}

enum VK_EXT_vertex_attribute_divisor = 1;
enum VK_EXT_VERTEX_ATTRIBUTE_DIVISOR_SPEC_VERSION = 3;
enum VK_EXT_VERTEX_ATTRIBUTE_DIVISOR_EXTENSION_NAME = "VK_EXT_vertex_attribute_divisor";

struct VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    uint maxVertexAttribDivisor;
}

struct VkVertexInputBindingDivisorDescriptionEXT
{
    uint binding;
    uint divisor;
}

struct VkPipelineVertexInputDivisorStateCreateInfoEXT
{
    VkStructureType sType;
    const(void)* pNext;
    uint vertexBindingDivisorCount;
    const(VkVertexInputBindingDivisorDescriptionEXT)* pVertexBindingDivisors;
}

struct VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
{
    VkStructureType sType;
    void* pNext;
    VkBool32 vertexAttributeInstanceRateDivisor;
    VkBool32 vertexAttributeInstanceRateZeroDivisor;
}

enum VK_NV_shader_subgroup_partitioned = 1;
enum VK_NV_SHADER_SUBGROUP_PARTITIONED_SPEC_VERSION = 1;
enum VK_NV_SHADER_SUBGROUP_PARTITIONED_EXTENSION_NAME = "VK_NV_shader_subgroup_partitioned";

enum VK_NV_compute_shader_derivatives = 1;
enum VK_NV_COMPUTE_SHADER_DERIVATIVES_SPEC_VERSION = 1;
enum VK_NV_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME = "VK_NV_compute_shader_derivatives";

struct VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
{
    VkStructureType sType;
    void* pNext;
    VkBool32 computeDerivativeGroupQuads;
    VkBool32 computeDerivativeGroupLinear;
}

enum VK_NV_mesh_shader = 1;
enum VK_NV_MESH_SHADER_SPEC_VERSION = 1;
enum VK_NV_MESH_SHADER_EXTENSION_NAME = "VK_NV_mesh_shader";

struct VkPhysicalDeviceMeshShaderFeaturesNV
{
    VkStructureType sType;
    void* pNext;
    VkBool32 taskShader;
    VkBool32 meshShader;
}

struct VkPhysicalDeviceMeshShaderPropertiesNV
{
    VkStructureType sType;
    void* pNext;
    uint maxDrawMeshTasksCount;
    uint maxTaskWorkGroupInvocations;
    uint[3] maxTaskWorkGroupSize;
    uint maxTaskTotalMemorySize;
    uint maxTaskOutputCount;
    uint maxMeshWorkGroupInvocations;
    uint[3] maxMeshWorkGroupSize;
    uint maxMeshTotalMemorySize;
    uint maxMeshOutputVertices;
    uint maxMeshOutputPrimitives;
    uint maxMeshMultiviewViewCount;
    uint meshOutputPerVertexGranularity;
    uint meshOutputPerPrimitiveGranularity;
}

struct VkDrawMeshTasksIndirectCommandNV
{
    uint taskCount;
    uint firstTask;
}

alias PFN_vkCmdDrawMeshTasksNV = void function (VkCommandBuffer commandBuffer, uint taskCount, uint firstTask);
alias PFN_vkCmdDrawMeshTasksIndirectNV = void function (VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint drawCount, uint stride);
alias PFN_vkCmdDrawMeshTasksIndirectCountNV = void function (VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint maxDrawCount, uint stride);

void vkCmdDrawMeshTasksNV (
    VkCommandBuffer commandBuffer,
    uint taskCount,
    uint firstTask);

void vkCmdDrawMeshTasksIndirectNV (
    VkCommandBuffer commandBuffer,
    VkBuffer buffer,
    VkDeviceSize offset,
    uint drawCount,
    uint stride);

void vkCmdDrawMeshTasksIndirectCountNV (
    VkCommandBuffer commandBuffer,
    VkBuffer buffer,
    VkDeviceSize offset,
    VkBuffer countBuffer,
    VkDeviceSize countBufferOffset,
    uint maxDrawCount,
    uint stride);

enum VK_NV_fragment_shader_barycentric = 1;
enum VK_NV_FRAGMENT_SHADER_BARYCENTRIC_SPEC_VERSION = 1;
enum VK_NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME = "VK_NV_fragment_shader_barycentric";

struct VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV
{
    VkStructureType sType;
    void* pNext;
    VkBool32 fragmentShaderBarycentric;
}

enum VK_NV_shader_image_footprint = 1;
enum VK_NV_SHADER_IMAGE_FOOTPRINT_SPEC_VERSION = 1;
enum VK_NV_SHADER_IMAGE_FOOTPRINT_EXTENSION_NAME = "VK_NV_shader_image_footprint";

struct VkPhysicalDeviceShaderImageFootprintFeaturesNV
{
    VkStructureType sType;
    void* pNext;
    VkBool32 imageFootprint;
}

enum VK_NV_scissor_exclusive = 1;
enum VK_NV_SCISSOR_EXCLUSIVE_SPEC_VERSION = 1;
enum VK_NV_SCISSOR_EXCLUSIVE_EXTENSION_NAME = "VK_NV_scissor_exclusive";

struct VkPipelineViewportExclusiveScissorStateCreateInfoNV
{
    VkStructureType sType;
    const(void)* pNext;
    uint exclusiveScissorCount;
    const(VkRect2D)* pExclusiveScissors;
}

struct VkPhysicalDeviceExclusiveScissorFeaturesNV
{
    VkStructureType sType;
    void* pNext;
    VkBool32 exclusiveScissor;
}

alias PFN_vkCmdSetExclusiveScissorNV = void function (VkCommandBuffer commandBuffer, uint firstExclusiveScissor, uint exclusiveScissorCount, const(VkRect2D)* pExclusiveScissors);

void vkCmdSetExclusiveScissorNV (
    VkCommandBuffer commandBuffer,
    uint firstExclusiveScissor,
    uint exclusiveScissorCount,
    const(VkRect2D)* pExclusiveScissors);

enum VK_NV_device_diagnostic_checkpoints = 1;
enum VK_NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_SPEC_VERSION = 2;
enum VK_NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_EXTENSION_NAME = "VK_NV_device_diagnostic_checkpoints";

struct VkQueueFamilyCheckpointPropertiesNV
{
    VkStructureType sType;
    void* pNext;
    VkPipelineStageFlags checkpointExecutionStageMask;
}

struct VkCheckpointDataNV
{
    VkStructureType sType;
    void* pNext;
    VkPipelineStageFlag stage;
    void* pCheckpointMarker;
}

alias PFN_vkCmdSetCheckpointNV = void function (VkCommandBuffer commandBuffer, const(void)* pCheckpointMarker);
alias PFN_vkGetQueueCheckpointDataNV = void function (VkQueue queue, uint* pCheckpointDataCount, VkCheckpointDataNV* pCheckpointData);

void vkCmdSetCheckpointNV (
    VkCommandBuffer commandBuffer,
    const(void)* pCheckpointMarker);

void vkGetQueueCheckpointDataNV (
    VkQueue queue,
    uint* pCheckpointDataCount,
    VkCheckpointDataNV* pCheckpointData);

enum VK_EXT_pci_bus_info = 1;
enum VK_EXT_PCI_BUS_INFO_SPEC_VERSION = 1;
enum VK_EXT_PCI_BUS_INFO_EXTENSION_NAME = "VK_EXT_pci_bus_info";

struct VkPhysicalDevicePCIBusInfoPropertiesEXT
{
    VkStructureType sType;
    void* pNext;
    ushort pciDomain;
    ubyte pciBus;
    ubyte pciDevice;
    ubyte pciFunction;
}

enum VK_GOOGLE_hlsl_functionality1 = 1;
enum VK_GOOGLE_HLSL_FUNCTIONALITY1_SPEC_VERSION = 0;
enum VK_GOOGLE_HLSL_FUNCTIONALITY1_EXTENSION_NAME = "VK_GOOGLE_hlsl_functionality1";

enum VK_GOOGLE_decorate_string = 1;
enum VK_GOOGLE_DECORATE_STRING_SPEC_VERSION = 0;
enum VK_GOOGLE_DECORATE_STRING_EXTENSION_NAME = "VK_GOOGLE_decorate_string";
