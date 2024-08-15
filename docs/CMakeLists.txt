add_custom_target(${PROJECT_NAME}_DOCS
    COMMAND doxygen ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile
)