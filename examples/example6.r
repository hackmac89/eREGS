/*
	This examples demonstrates the binary left shift,
	the binary right shift, the binary NOT operator as well as
	the binary AND operator.
*/
	// left shift
	push $1				// n
	push $6				// x
	shl					// (x * 2^n)
	print
	// "Error case"
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
	
	// right shift
	push $2				// n
	push $100			// x
	shr					// (x / 2^n)
	print
	
	// NOT
	push $0
	not
	print
	push $1
	not
	print
	push $5				// Non boolean value
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
	/* Should never get executed */
	push $-1
	print 
L2:
	/* END */
