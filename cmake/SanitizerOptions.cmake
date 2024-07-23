include(${CMAKE_SOURCE_DIR}/cmake/CompilerOptions.cmake)

set(GCC_ASAN_FLAGS -fsanitize=address -fno-omit-frame-pointer)

set(ASAN_FLAGS
    "$<$<BOOL:${MSVCISH}>:/fsanitize=address>"
    "$<$<BOOL:${GCCISH}>:${GCC_ASAN_FLAGS}>"
    "$<$<BOOL:${CLANGISH}>:${GCC_ASAN_FLAGS}>"
)

set(TSAN_FLAGS
    "$<$<BOOL:${MSVCISH}>:/fsanitize=thread>"
    "$<$<BOOL:{GCCISH}>:-fsanitize=thread>"
    "$<$<BOOL:{CLANGISH}>:-fsanitize=thread>"
)

set(UBSAN_FLAGS
    "$<$<BOOL:${MSVCISH}>:/fsanitize=undefined>"
    "$<$<BOOL:${GCCISH}>:-fsanitize=undefined>"
    "$<$<BOOL:${CLANGISH}>:-fsanitize=undefined>"
)

Option(ASAN Off)
Option(TSAN Off)
Option(UBSAN Off)

function(set_sanitizer_options TARGET)
    if ((ASAN AND (TSAN OR UBSAN)) OR
        (TSAN AND UBSAN))
        return()
    endif()
    
    set(SAN_FLAGS 
        "$<$<BOOL:${ASAN}>:${ASAN_FLAGS}>"
        "$<$<BOOL:${TSAN}>:${TSAN_FLAGS}>"
        "$<$<BOOL:${UBSAN}>:${UBSAN_FLAGS}>"
    )

    target_compile_options(${TARGET} PRIVATE ${SAN_FLAGS})
    target_link_options(${TARGET} PRIVATE ${SAN_FLAGS})
endfunction()