//Implemented By Christopher Masloub
//Student Number: 20052223

#include <stdio.h>
#include <cuda_runtime.h>
#include <helper_cuda.h>

#include <iostream>
#include <memory>
#include <string>

void printDevProp(cudaDeviceProp devProp)
{
	printf("Device Name:                          %s\n", devProp.name);
	printf("GPU Clock:                %.0f MHz (%0.2f ""GHz)\n", devProp.clockRate * 1e-3f, devProp.clockRate * 1e-6f);
	printf("Number of cuda cores:          %d\n", _ConvertSMVer2Cores(devProp.major, devProp.minor) * devProp.multiProcessorCount);
	printf("Number SMs:                    %d\n", devProp.multiProcessorCount);
	printf("Warp size:                     %d\n", devProp.warpSize);
	printf("Total global memory:           %lu\n", devProp.totalGlobalMem);
	printf("Total constant memory:         %lu\n", devProp.totalConstMem);
	printf("Total shared memory per block: %lu\n", devProp.sharedMemPerBlock);
	printf("Total registers per block:     %d\n", devProp.regsPerBlock);
	printf("Maximum threads per block:     %d\n", devProp.maxThreadsPerBlock);
	for (int i = 0; i < 3; ++i)
		printf("Maximum dimension %d of block:  %d\n", i, devProp.maxThreadsDim[i]);
	for (int i = 0; i < 3; ++i)
		printf("Maximum dimension %d of grid:   %d\n", i, devProp.maxGridSize[i]);



}

int main()
{
	int devCount;
	cudaGetDeviceCount(&devCount);
	printf("CUDA Device Query\n");
	printf("CUDA devices : [%d] \n", devCount);

	for (int i = 0; i < devCount; ++i)
	{
		printf("\nCUDA Device #%d\n", i);
		cudaDeviceProp devProp;
		cudaGetDeviceProperties(&devProp, i);
		printDevProp(devProp);

	}

	
}