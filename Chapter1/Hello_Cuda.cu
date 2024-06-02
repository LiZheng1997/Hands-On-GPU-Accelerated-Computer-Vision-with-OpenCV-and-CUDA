/*
 * @Descripttion: Zhengli's codes
 * @version: 1.0.0
 * @Author: Zhengli
 * @Date: 2024-05-31 12:51:24
 * @LastEditors: Zhengli
 * @LastEditTime: 2024-06-02 19:55:16
 */

#include <iostream>
#include <stdio.h>
//使用一个__global__函数定义全局的Kernel函数，这个函数是设备上运行的函数，当前定义的是一个空函数。
__global__ void myfirstkernel(void) {
}

int main(void) {
	myfirstkernel << <1, 1 >> >();
	printf("Hello, CUDA!\n");
	return 0;
}
