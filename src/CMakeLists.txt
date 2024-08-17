include(${CMAKE_SOURCE_DIR}/cmake/CompilerOptions.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/SanitizerOptions.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/MsvcRuntime.cmake)

# TODO: set the sources
set(MAIN_TARGET_SOURCES project.cpp # source 1
    # ...
)

if(${PROJECT_NAME}_BUILD_EXECUTABLE)
  add_executable(${PROJECT_NAME} ${MAIN_TARGET_SOURCES})
else()
  add_library(${PROJECT_NAME} ${MAIN_TARGET_SOURCES})
endif()

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/include)

target_compile_features(${PROJECT_NAME} PRIVATE ${THIS_CXX_VERSION})

set_compiler_flags(${PROJECT_NAME} PRIVATE)
set_sanitizer_options(${PROJECT_NAME})
set_msvc_runtime(${PROJECT_NAME})

# TODO: add dependencies find_package(NAME REQUIRED [options]) ... find other
# packages

# target_link_libraries( ${PROJECT_NAME} PRIVATE dep1 dep2 ... )
