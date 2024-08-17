# MSVC C runtime linking option

# MD[d] MultiThreaded[Debug]DLL is the CMake default omit the DLL portion if you
# want static linking to the msvc c runtime

# Note: gtest default is to link to msvc runtime statically, the github workflow
# included in this repo will build gtest with the dynamic runtime so your
# binaries can be also be built linking to the dynamic runtime see gtest's
# readme for more detail
# https://github.com/google/googletest/blob/main/googletest/README.md

function(set_msvc_runtime TARGET)
  set(TARGET ${PROJECT_NAME} PROPERTY MSVC_RUNTIME_LIBRARY
             "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL"
  )
endfunction(set_msvc_runtime TARGET)
