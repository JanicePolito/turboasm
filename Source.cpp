#include <iostream>
extern "C" void mboxtest(); // Declare the PROC
extern "C" int vret(); // Declare the PROC

void main()
{
	std::cout << "Hello, World from standard c++ code!" << std::endl;
	int result = vret();
	std::cout << "The result from asm file: " << result << std::endl;
	mboxtest();
}