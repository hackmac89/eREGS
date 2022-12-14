/*
	This example calculates the following series:
		{(n * n-1)+(n-1 * n-2)+(n-2 * n-3)... | n-... >= 0}
*/
	push $5			// ToS = 5
	pop r1			// r1 = 5, ToS = {}
L0:	
	push r1			// ToS = 5
	push $1			// ToS = 1, 5
	push r1			// ToS = 5, 1, 5
	sub				// ToS = 4, 5
	mul				// ToS = 20
	push r2			// push previous result onto the stack (0 for first iteration)
	add
	pop r2			// r2 = 20
	push $1			// ToS = 1
	push r1			// ToS = 5, 1
	sub				// ToS = 4
	pop r1			// r1 = 4, ToS = {}
	push r1			// ToS = 4
	push $1			// ToS = 1, 4
	cmpge			// ToS = 1
	jfalse L1		// ToS = {}, comparison result does not matter
	jmp L0
L1:
	push r2
	print
