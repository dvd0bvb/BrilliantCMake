add_library(${PROJECT_NAME} INTERFACE)

target_include_directories(
    ${PROJECT_NAME} 
    INTERFACE 
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

include(${CMAKE_SOURCE_DIR}/cmake/CompilerOptions.cmake)
target_compile_options(
    ${PROJECT_NAME}
    INTERFACE 
        ${PROJECT_WARNINGS}
)

# TODO: add dependencies
# find_package(NAME REQUIRED [options])
# ... find other packages

# target_link_libraries(
#     ${MAIN_TARGET}
#     PRIVATE
#         dep 1
#         dep 2
#         ...
# )