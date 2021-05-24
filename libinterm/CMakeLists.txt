add_library(cudalink_interm STATIC)
set_target_properties(cudalink_interm PROPERTIES EXPORT_NAME interm)

target_sources(cudalink_interm PRIVATE interm2.cpp)

if(CMAKE_BUILD_TYPE MATCHES "Debug")
    add_compile_options("$<$<COMPILE_LANGUAGE:CUDA>:-lineinfo>")
endif()

set(cuda_sources interm1.cu)
target_sources(cudalink_interm PRIVATE ${cuda_sources})

set_target_properties(cudalink_interm PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON
    CUDA_STANDARD 14
    # CUDA_RESOLVE_DEVICE_SYMBOLS ON
    POSITION_INDEPENDENT_CODE ON)

target_link_libraries(cudalink_interm cudalink_demo)
