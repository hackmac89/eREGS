#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
	int res = 0;
	for(int i = 0; i <= 9; i++)
		res += i*i;
	printf("Ergebnis: %d\n", res);

	return EXIT_SUCCESS;
}

