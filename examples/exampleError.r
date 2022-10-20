/*
	This example explicitly triggers an error to check, if
	the stack machine handles obviuos errors accordingly and to test
	if the given error output is meaningful enough, eg. the line number gets printed out, too.
*/
push $1
push $2
push $3
push $4			// ToS = 4, 3, 2, 1
mul				// ToS = 12, 2, 1
mul				// ToS = 24, 1
add				// ToS = 25
push $0			// ToS = 0, 25
div				// oh oh ;-)
print
