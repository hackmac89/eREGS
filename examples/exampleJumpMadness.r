/*
	Dieses Beispiel springt einfach nur ein wenig hin und her.
	Das könnte man später mal noch ein wenig besser
	und weniger impulsiv gestalten (als "reversing"-Beispiel oder so).
*/
	push $10
	push $2	
	jmp L1
L0:
	push $999
	push $1000
	sub
	pop r2
	jmp L2
L1:
	mul
	pop r1
	jmp L0
L2:
	push r1
	push r2
	add
	pop r1 
	push $0
	pop r3 
	jmp L3
L3:
	push r3	
	push $1
	cmpeq
	jfalse L4
L4:
	push r3
	push r2
	push r1
	print
	print
	print
L5:
	// DEBUG MARKER
