Version 1 of Watchpoints (for Glulx only) by Brady Garvin begins here.

"Watchpoint injection and management routines, for use by debugging extensions."

Include Runtime Checks by Brady Garvin.
Include Low-Level Operations by Brady Garvin.
Include Low-Level Linked Lists by Brady Garvin.
Include Low-Level Hash Tables by Brady Garvin.
Include Glulx Runtime Instrumentation Framework by Brady Garvin.
Include Call Stack Tracking by Brady Garvin.
Include Breakpoints by Brady Garvin.

Use authorial modesty.

Book "Copyright and License"

[Copyright 2013 Brady J. Garvin]

[This extension is released under the Creative Commons Attribution 3.0 Unported License (CC BY 3.0) so that it can qualify as a public Inform extension.  See the LICENSE file included in the release for further details.]

Book "Extension Information"

[For each of the kinds defined by Watchpoints you will see a sentence like

	A watchpoint is an invalid watchpoint.

This bewildering statement actually sets up watchpoints as a qualitative value with default value the watchpoint at address one, which, as we say, is invalid.  (We could have gone with a quantitative kind for default zero, but then we would open up the possibility for arithmetic on the pointers.)  I wish it weren't necessary, but at least in this build Inform doesn't let us provide a default value any other way, and, moreover, we need a default value or else only I6 substitutions are allowed to decide on watchpoints.]

Chapter "Use Options"

[////]

Book "Runtime Checks"

Chapter "Messages" - unindexed

[////]

Book "Watchpoints"

Include (-
	Array watchpointFu --> 9 9;
-).

To decide what number is watchpoint fu (N - a number): (- (watchpointFu + {N}) -).

To decide what instruction vertex is a new watchpoint branch instruction vertex for the sequence point (A - a number):
	let the result be a new artificial instruction vertex;
	write the operation code op-jnz to the result;
	write the addressing mode zero-based-dereference addressing mode to parameter zero of the result;
	write watchpoint fu zero to parameter zero of the result;
	write the addressing mode zero-based-dereference addressing mode to parameter one of the result;
	write watchpoint fu one to parameter one of the result;
	decide on the result.

To insert a watchpoint check before (V - an instruction vertex) for the sequence point (A - a number):
	let the watchpoint branch instruction vertex be a new watchpoint branch instruction vertex for the sequence point A;
	insert the watchpoint branch instruction vertex before V;
	let the first escape-recording instruction vertex be a new escape-recording instruction vertex for the sequence point A;
	insert the first escape-recording instruction vertex at the end of the arrangement;
	let the second escape-recording instruction vertex be a new escape-recording instruction vertex for a resume point;
	push the key the second escape-recording instruction vertex and the value the watchpoint branch instruction vertex onto the resume point adjustment list;
	insert the second escape-recording instruction vertex at the end of the arrangement;
	let the escape instruction vertex be a new watchpoint escape instruction vertex;
	insert the escape instruction vertex at the end of the arrangement;
	establish a jump link from the watchpoint branch instruction vertex to the first escape-recording instruction vertex.


Watchpoints ends here.
