#pragma once

#include <cuda_runtime.h>

class Demo {
public:
    __device__ int Test1(int a, int b);
    void TestLaunch();
    void TestCpp();
};
