/*
	This examples calculates the factorial of a given base number.
		{(n * n-1 * n-2 * n-3...) | n >= 1}

	// Factorial iterative
	long long facIter(int start) {
        	long long res = 1;
        	for(int i = start; i > 1; i--)
                	res *= i;
        	return res;
	}

	r1 = Iteration counter
	r2 = Result
*/
	push $5			// ToS = 5
	pop r1			// r1 = 5, ToS = {}
	push $1			// ToS = {}
	pop r2			// r2 = 1, ToS = {}
L0:	
	push r1			// ToS = 5, 4, 3...
	push r2			// ToS = 1, 20...
	mul				// ToS = 5, 20...
	pop r2			// r2 = 5, 20..., ToS = {}
	push $1			// ToS = 1
	push r1			// ToS = 5, 1
	sub				// ToS = 4
	pop r1			// r1 = 4, ToS = {}
	push r1			// ToS = 4
	push $1			// ToS = 1, 4
	cmpg			// ToS = 1
	jfalse L1		// ToS = {}, result of comparison does not matter
	jmp L0		
L1:
	push r2
	print
L2:
	/* DEBUG MARKER, PRINT FROM STACK AND JUMP TO THIS LOCATION TO 
	   GUARANTEE A SUCCESSFUL PROGRAMM RUN */
