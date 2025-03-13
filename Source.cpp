extern "C" void mboxtest();							// Declare the mboxtest PROC
extern "C" int vret();								// Declare the vret PROC (returning a int value)
extern "C" const char* lowerCase();					// Declare the lowerCase PROC (returning a string)
extern "C" const char* lowerCaseWithArg(char* str); // Declare the lowerCaseWithArg PROC (with argument and returning string)

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
/*
The above code is a simple example of how to call an assembly function from a C++ code.
The  mboxtest()  function is defined in the assembly file and it is called from the C++ code.
The  vret()  function is defined in the assembly file and it is called from the C++ code.
The  lowerCase()  function is defined in the assembly file and it is called from the C++ code.
The  lowerCaseWithArg()  function is defined in the assembly file and it is called from the C++ code.
The  main()  function is the entry point of the program.
The  std::cout  is used to print the output to the console.
The  std::endl  is used to print the new line.
The  lowerCaseStr  is a pointer to the string that is returned from the assembly function.
The  myStr  is a character array that is passed as an argument to the assembly function.
The  mboxtest()  function is called from the C++ code.
The  vret()  function is called from the C++ code.
The  lowerCase()  function is called from the C++ code.
The  lowerCaseWithArg()  function is called from the C++ code.
The  main()  function is called from the C++ code.
The  main()  function is the entry point of the program
*/