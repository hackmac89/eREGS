/*
	Folgendes Stackmaschinenprogramm addiert einfach nur ein wenig ;)
	Author: Jeff Wagner
	Date:	23.04.2017
	Aufruf:	./eregs example2.r
*/
push $0		// ToS = 0
push $22	// ToS = 22, 0
add		// ToS = 22
pop r1		// r1 = 22, ToS = {}
push r1		// ToS = 22
print		// ToS = {}
push r1		// ToS = 22
push $26	// ToS = 26
add		// ToS = 48
print		// ToS = {}
