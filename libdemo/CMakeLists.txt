add_library(cudalink_demo STATIC)
set_target_properties(cudalink_demo PROPERTIES EXPORT_NAME demo)

target_sources(cudalink_demo PRIVATE demo2.cpp)

if(CMAKE_BUILD_TYPE MATCHES "Debug")
    add_compile_options("$<$<COMPILE_LANGUAGE:CUDA>:-lineinfo>")
endif()

set(cuda_sources demo1.cu)
target_sources(cudalink_demo PRIVATE ${cuda_sources})

set_target_properties(cudalink_demo PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON
    CUDA_STANDARD 14
    # CUDA_RESOLVE_DEVICE_SYMBOLS ON
    POSITION_INDEPENDENT_CODE ON)
