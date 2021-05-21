cmake_minimum_required(VERSION 3.17)

project(cuda_link)

enable_language(CUDA)
foreach(GENCODE ${CUDALINK_CUDA_CAPABILITY})
  string(REPLACE "." "" GENCODE ${GENCODE})
  add_compile_options("$<$<COMPILE_LANGUAGE:CUDA>:-gencode=arch=compute_${GENCODE},code=sm_${GENCODE}>")
endforeach()

include_directories(SYSTEM ${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})

add_subdirectory(libdemo)
add_subdirectory(exedemo)
