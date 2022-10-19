#include <stdio.h>
#include <stdlib.h>

// berechne Quersumme rekursiv
int qSumRecursive(int val) {
	if(val > 0) 
		return ((val % 10) + qSumRecursive(val/10));
	else
		return 0;
}

// berechne Quersumme iterativ (wie wir später in "example8.r" umsetzen werden)
int qSumIterative(int val) {
	int tmp = val % 10;
	while((val /= 10) > 0) {
		tmp += val % 10;
	}
	return tmp;
}

int main(int argc, char **argv) {
	printf("qSumRecursive(12345): %d\n", qSumRecursive(12345));
	printf("qSumIterative(12345): %d\n", qSumIterative(12345));	

	return EXIT_SUCCESS;
}
