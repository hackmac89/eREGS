/*
	Dieses Beispiel demonstriert den Links-Shift,
	den Rechts-Shift, den NOT-Operator sowie den AND-Operator.
*/
	// Links-Shift
	push $1		// n
	push $6 	// x
	shl		// entspicht x * 2^n
	print
	// "Fehlerfall"
	push $0
	push $6
	shl
	push $6
	cmpeq
	jfalse L1
	push $8
	push $2
	shl
	print
	
	// Rechts-Shift
	push $2		// n
	push $100	// x
	shr		// entspricht x / 2^n
	print
	
	// NOT
	push $0
	not
	print
	push $1
	not
	print
	push $5		// Nicht booleanscher Wert
	not
	print

	// AND
	push $1
	push $1
	and
	print
	push $123
	push $654
	and
	print
	jmp L2
L1:
	/* Sollte nie ausgeführt werden */
	push $-1
	print 
L2:
	/* ENDE */
