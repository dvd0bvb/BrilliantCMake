include(${CMAKE_SOURCE_DIR}/cmake/CompilerOptions.cmake)

set(ASAN_FLAGS
    "$<$<CONFIG:DEBUG>:
        $<${MSVCISH}:/fsanitize=address>
        $<$<OR:${GCCISH}, ${CLANGISH}>:-fsanitize=address;-fno-omit-frame-pointer>
    >"
)

set(TSAN_FLAGS
    "$<$<CONFIG:DEBUG>:
        $<${MSVCISH}:/fsanitize=thread>
        $<$<OR:${GCCISH}, ${CLANGISH}>:-fsanitize=thread>
    >"
)

set(UBSAN_FLAGS
    "$<$<CONFIG:DEBUG>:
        $<${MSVCISH}:/fsanitize=undefined>
        $<$<OR:${GCCISH}, ${CLANGISH}>:-fsanitize=undefined>
    >"
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