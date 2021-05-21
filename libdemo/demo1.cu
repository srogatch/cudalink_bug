#include <cstdio>
#include "demo3.h"

__device__ int Demo::Test1(int a, int b) {
    return a+b;
}

__global__ void TestKernel() {
    printf("Demo");
}

void Demo::TestLaunch() {
    TestKernel<<<1,2>>>();
}