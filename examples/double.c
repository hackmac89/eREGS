#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
	// Deklarationen
	double a, b;
	a = 12;
	b = 10;
	double c = a + b;
	printf("[*] %f (double + double = double, cast to %%f)\n", c);
	// Würde das Konzept ad absurdum führen, da Man Bei erhaltener Ganzzahl
	// so oder so keine Nachkommastellen bei der Eingabe benötigen würde ;)
	printf("[*] %d (double + double = double, cast to %%d)\n", (int)c);	

	return EXIT_SUCCESS;
}
