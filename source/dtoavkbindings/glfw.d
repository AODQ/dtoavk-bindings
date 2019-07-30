module dtoavkbindings.glfw;

public import bindbc.glfw;

import core.stdc.stdint;
import dtoavkbindings.vk;

version ( linux ) {
  mixin(bindGLFW_X11);

  alias XID      = ulong;
  alias Window   = XID;
  alias RROutput = XID;
  alias RRCrtc   = XID;
  alias XPointer = char *;
  alias Display  = void *;
}

mixin(bindGLFW_Vulkan);

