add_executable(cudalink_exe)

target_link_libraries(cudalink_exe cudalink_demo)

target_sources(cudalink_exe PRIVATE exe2.cpp)

if(CMAKE_BUILD_TYPE MATCHES "Debug")
    add_compile_options("$<$<COMPILE_LANGUAGE:CUDA>:-lineinfo>")
endif()

set(cuda_sources exe1.cu)
target_sources(cudalink_exe PRIVATE ${cuda_sources})

set_target_properties(cudalink_exe PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON
    CUDA_STANDARD 14
    CUDA_RESOLVE_DEVICE_SYMBOLS ON
    POSITION_INDEPENDENT_CODE ON)