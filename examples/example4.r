/*
	The following stack machine calculates the power of its
	iterations and sums them up.
		{(i*i) + (i*i)... | solange i in {0..9}}
*/
	push $0
	pop r1		
L0:
	push r1
	push r1
	mul
	push r2
	add
	pop r2
	push r1
	push $1
	add
	pop r1
	push r1
	push $9
	cmple
	jfalse L1
	jmp L0
L1:
	push r2
	print
