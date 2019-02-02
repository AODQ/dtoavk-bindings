# dtoavk bindings

Static bindings for [dtoavk](https://github.com/AODQ/dtoavk). I pretty much
can't use any existing D bindings outside of the few from BindBC, because dtoavk
is written in BetterC. They're all autogenerated and manually sifted through to
remove weird autogen quirks.

Really this should be split out into multiple modules, possibly BindBC, but
these don't exist as dynamic bindings so they really aren't polished for
external usage.  I don't plan on allowing dynamic bindings to work with dtoavk
any time soon either.

Currently supports:
  - Vulkan
  - GLFW
  - Imgui through cimgui, with additional BC-port for glfw+vulkan implementation
