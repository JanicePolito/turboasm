extern "C" void mboxtest(); // Declare the PROC
extern "C" int vret(); // Declare the PROC
extern "C" const char* lowerCase(); // Declare the PROC
extern "C" const char* lowerCaseWithArg(char* str); // Declare the PROC

#include <iostream>

void main()
{
	std::cout << "Hello, World from standard c++ code!" << std::endl;

	int result = vret();
	std::cout << "The result from asm file: " << result << std::endl;

	const char* lowerCaseStr = lowerCase();
	std::cout << "convertion to lower case from asm file: " << lowerCaseStr << std::endl;

	char myStr[] = "EFGH";
	std::cout << "convertion to lower case from asm file with passing the arguments: " << lowerCaseWithArg(myStr) << std::endl;

	mboxtest();
}