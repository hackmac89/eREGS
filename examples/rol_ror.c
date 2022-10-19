#include <stdio.h>
#include <stdlib.h>

unsigned int rol(unsigned int x, unsigned int s) {
	return (x << s) | (x >> (32 - s));
}

unsigned int ror(unsigned int x, unsigned int s) {
	return (x >> s) | (x << (32 - s));
}

int main(int argc, char **argv) {
	// Deklarationen
	unsigned int a, b;
	a = 128;
	b = 2;
	printf("rol(128, 2) = %u\nror(128, 2) = %u\n", rol(a, b), ror(a, b));

	return EXIT_SUCCESS;
}
