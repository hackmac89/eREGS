#include <stdio.h>
#include <stdlib.h>

// Faculty iterative
long long facIter(int start) {
	long long res = 1;
	for(int i = start; i > 1; i--)
		res *= i;
	return res;
}

// Faculty recursive
long long facRec(long long start) {
	if( start > 1 )
		return start * facRec(start - 1);
	else 
		return 1;
}

int main(int argc, char **argv) {
	printf("Faculty of \"5\" (iterative): %lld\n", facIter(5));
	printf("Faculty of \"5\" (recursive): %lld\n", facRec((long long) 5));
	
	return EXIT_SUCCESS;
}

