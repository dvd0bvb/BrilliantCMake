option(BRILLIANT_CMAKE_BUILD_EXECUTABLE "Build the project as an executable"
       OFF
)
option(BRILLIANT_CMAKE_BUILD_SHARED "Build project as a shared library" OFF)
option(BRILLIANT_CMAKE_BUILD_HEADER_ONLY
       "Build project as a header only library" OFF
)
option(BRILLIANT_CMAKE_CODE_COVERAGE "Build project with code coverage" OFF)

set(BRILLIANT_CMAKE_SANITIZER
    ""
    CACHE STRING "Sanitizer option"
)
set_property(CACHE BRILLIANT_CMAKE_SANITIZER PROPERTY STRINGS ASAN TSAN MSAN)

set(BRILLIANT_CMAKE_MSAN_LIBCXX_INCLUDE_DIR
    ""
    CACHE STRING "Include path to the MSAN std lib"
)
set(BRILLIANT_CMAKE_MSAN_LIBCXX_LINK_DIR
    ""
    CACHE STRING "Link path to the MSAN std lib"
)
