option(${PROJECT_NAME}_BUILD_EXECUTABLE "Build the project as an executable"
       OFF
)
option(${PROJECT_NAME}_BUILD_HEADER_ONLY
       "Build project as a header only library" OFF
)
option(${PROJECT_NAME}_CODE_COVERAGE "Build project with code coverage" OFF)

set(${PROJECT_NAME}_SANITIZER
    ""
    CACHE STRING "Sanitizer option"
)
set_property(CACHE ${PROJECT_NAME}_SANITIZER PROPERTY STRINGS ASAN TSAN MSAN)

set(${PROJECT_NAME}_MSAN_LIBCXX_INCLUDE_DIR
    ""
    CACHE STRING "Include path to the MSAN std lib"
)
set(${PROJECT_NAME}_MSAN_LIBCXX_LINK_DIR
    ""
    CACHE STRING "Link path to the MSAN std lib"
)
