/*
	Folgendes Stackmaschinenprogramm durchläuft rückwarts eine 
	Schleife von 5-0 und gibt den derzeitigen Iterationswert an.
*/
	push $5		// 5 auf den Stack legen
	pop r2		// r2 = 5, ToS = {} 	
L0: 	
	push r2		// ToS = 5
	print		// ToS = {}
	push $1		// ToS = 1
	push r2		// ToS = 5, 1
	sub		// ToS = 4
	pop r2		// r2 = 4, ToS = {}
	push r2		// ToS = 4
	push $0		// ToS = 0, 4
	cmpge	
        jfalse L1
        jmp L0
L1:
