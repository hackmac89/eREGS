#include <stdio.h>
#include <stdlib.h>

// Fakultät iterativ
long long fakIter(int start) {
	long long res = 1;
	for(int i = start; i > 1; i--)
		res *= i;
	return res;
}

long long fakRek(long long start) {
	if( start > 1 )
		return start * fakRek(start - 1);
	else 
		return 1;
}

int main(int argc, char **argv) {
	printf("Fakultät Iterativ mit \"5\": %lld\n", fakIter(5));
	printf("Fakultät Rekursiv mit \"5\": %lld\n", fakRek((long long) 5));
	
	return EXIT_SUCCESS;
}

