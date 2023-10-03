# SUBLEQ OISC VM in Perl

* Author: Richard James Howe
* License: The Unlicense
* Email: <mailto: howe.r.j.89@gmail.com>
* Repo: <https://github.com/howerj/subleq-perl>

An N-Bit SUBLEQ Interpreter written in Perl. For more information
see:

* <https://esolangs.org/wiki/Subleq>
* <https://github.com/howerj/subleq>
* <https://en.wikipedia.org/wiki/One-instruction_set_computer>

65536 cells are initialized to zero if not set, reading cells
before setting them outside of that range will result in a warning.

The program returns non-zero on failure, and zero on success.

The image provided contains a working, 16-bit, eForth programming
language interpreter, see
<https://en.wikipedia.org/wiki/Forth_(programming_language)> for
more information on Forth (eForth being the dialect).

"make" is not required, but a Makefile is provided for convenience.

To run:

	./subleq.pl 16 eforth.dec

Type "words" and hit Enter to get a list of defined Forth functions.

Type "bye" or CTRL-D (CTRL-Z on Windows) to exit.

