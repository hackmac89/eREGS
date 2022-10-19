	push $12345678
	pop r1
	push $0
	pop r2
L1:
	push r1
	push $10
	mod
	pop r1
	push r1
	push r2
	add
	pop r2
	push r1
	push $10
	div
	pop r1
	push r1
	push $0
	cmpge
	jfalse L2
	jmp L1
L2:
	push r1
	print
	
