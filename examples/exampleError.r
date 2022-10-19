/*
	Dieses Beispiel dient dazu, einmal einen Fehler zu provozieren,
	um zu sehen, ob auf Fehler reagiert wird und ob die Zeilennummer der
	fehlerhaften Eingabe mit ausgegeben wird.
*/
push $1
push $2
push $3
push $4		// ToS = 4, 3, 2, 1
mul		// ToS = 12, 2, 1
mul		// ToS = 24, 1
add		// ToS = 25
push $0		// ToS = 0, 25
div		// oh oh ;-)
print
