# eREGS Stack machine & Interpreter

This is just an old, simple toy project and consists of a *simple stack language and* an *interpreter* for integer arithmetic.

The instruction set consists of the following instructions:

| Instruction | Description |
| --- | ---: |
| push | Pushes element to the top of the stack |
| pop | Pops (retrieves) top element from stack |
| add | Pops 2 top most elements from stack, performs an addition and pushed result back to the stack |
| sub | Same as for "add", but performs subtraction |
| mul | Same as for "add", but performs multiplication |
| div | Same as for "add", but performs division (checks for division by 0) |
| cmpl | Checks 2 top most stack elements (true, if Arg1 < Arg2, 0 otherwise) |
| cmpg | Checks 2 top most stack elements (true, if Arg1 > Arg2, 0 otherwise) |
| cmple | Checks 2 top most stack elements (true, if Arg1 <= Arg2, 0 otherwise) |
| cmpge | Checks 2 top most stack elements (true, if Arg1 >= Arg2, 0 otherwise) |
| cmpeq | Checks 2 top most stack elements (true, if Arg1 == Arg2, 0 otherwise) |
| cmpne | Checks 2 top most stack elements (true, if Arg1 != Arg2, 0 otherwise) |
| print | Pops top element from stack and prints its value |
| jmp | Unconditional jump to label |
| jfalse | Conditional jump to label |
| L | Label (used for go to markers) |
| r | Register definition (for variables) |
| shl | Binary left shift |
| shr | Binary right shift |
| rol | Binary rotate left |
| ror | Binary rotate right |
| not | Binary NOT |
| and | Binary AND |
| xor | Binary Exclusive Or |
| mod | Modulo |

For a detailed description on _eREGS_ you may check the documentation located in the [doc](./doc) directory (german only).

---

## Compilation

Just run `make all` to compile the interpreter.

🛑 <span style="color:red">_(This is just a spontaneously uploaded git repository and the Makefile may not work properly as of now)._</span>

### Requirements

- Make
- Yacc
- Flex

---

## Running the interpreter

Just run `./bin/eregs <eREGS SOURCEFILE>` to run the interpreter.

---

## Example Code

A "eREGS" source code may use up to __32 registers__ and __999 labels__ (jump markers).

C commentary style `// for single line comments` and `/* for multiline comments */` are also supported.

The following example shows how to compute the average of the two numbers _22_ and _48_ __in a not so obvious way__ 😈.

<!-- See https://github.com/github/linguist/blob/master/lib/linguist/languages.yml for markdown syntax highlighting syntax -->
```Assembly
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
```

See the [examples](./examples/) directory for more examples on how to use the _eREGS_ stack language.
