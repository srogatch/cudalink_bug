#include <cstdio>
#include "exe3.h"
#include "../libdemo/demo3.h"

__global__ void AnotherKernel() {
    Demo d;
    int r = d.Test1(2, 3);
    printf("%d", r);
}

void Exe::AnotherLaunch() {
    AnotherKernel<<<2, 2>>>();
}