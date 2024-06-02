/*
 * @Descripttion: Zhengli's codes
 * @version: 1.0.0
 * @Author: Zhengli
 * @Date: 2024-05-31 12:51:24
 * @LastEditors: Zhengli
 * @LastEditTime: 2024-06-02 20:00:35
 */


#include <iostream>
#include <cuda.h>
#include <cuda_runtime.h>
#include <stdio.h>

//Definition of kernel function to add two variables
//定义了一个核函数，用来进行两个变量的加法运算
__global__ void gpuAdd(int d_a, int d_b, int *d_c) {
	*d_c = d_a + d_b;
}

//main function
//主函数
int main(void) {
	//Defining host variable to store answer
	//定义一个主机上存储结果的变量
	int h_c;
	//Defining device pointer
	//定义一个设备指针
	int *d_c;
	//Allocating memory for device pointer
	//给设备指针分配存储空间
	cudaMalloc((void**)&d_c, sizeof(int));
	//Kernel call by passing 1 and 4 as inputs and storing answer in d_c
	//<< <1,1> >> means 1 block is executed with 1 thread per block
	//内核函数被调用后，传递1和4作为输入，同时存储结果到d_c设备比变量中
	//<< <1,1> >>含义是一个块被执行时在每个块中有一个线程
	gpuAdd << <1, 1 >> > (1, 4, d_c);
	//Copy result from device memory to host memory
	//从设备内存中复制结果到主机内存中
	cudaMemcpy(&h_c, d_c, sizeof(int), cudaMemcpyDeviceToHost);
	printf("1 + 4 = %d\n", h_c);
	//Free up memory
	//释放占用的内存空间
	cudaFree(d_c);
	return 0;
}
