/*
	This example calculates the average of two given integers.
	(But not in a obvious way :-D)
	Date: 05/05/17
	hm89
*/
push $22
push $48
xor 
pop r1
push $1
push r1
shr
pop r1
push $22
push $48
and
push r1
add
print
