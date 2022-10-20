#include <stdio.h>
#include <stdlib.h>

// This is the according C code done in "example4.r"
int main(int argc, char **argv) {
	int res = 0;
	for(int i = 0; i <= 9; i++)
		res += i*i;
	printf("Result: %d\n", res);

	return EXIT_SUCCESS;
}

