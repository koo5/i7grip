Version 1 of Call Graph Reachability (for Glulx only) by Brady Garvin begins here.

"."

Include Runtime Checks by Brady Garvin.
Include Low-Level Operations by Brady Garvin.
Include Low-Level Text by Brady Garvin.
Include Low-Level Linked Lists by Brady Garvin.
Include Low-Level Hash Tables by Brady Garvin.
Include Glulx Runtime Instrumentation Framework by Brady Garvin.

Use authorial modesty.

Book "Copyright and License"

[Copyright 2013 Brady J. Garvin]

[This extension is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This extension is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this extension.  If not, see <http://www.gnu.org/licenses/>.]

Book "Extension Information"

[Nothing to mention here in the present version.]

Chapter "Use Options"

Use a call graph function hash table size of at least 2311 translates as (- Constant CGR_FUNCTION_HASH_SIZE={N}; -).

To decide what number is the call graph function hash table size: (- GWW_RESOURCE_HASH_SIZE -).

Book "Call Graph Reachability"

Section "The Call Graph Reachability Hash Table" - unindexed

[This table maps function addresses to truth states.]
The call graph reachability hash table is a hash table that varies.

[This stack maps function addresses to lists of function addresses that should be classified identically.]
The call graph reachability stack is a linked list that varies.

[This table gives the ``inverse'' of the call graph reachability stack.]
The call graph cycle hash table is a hash table that varies.

A GRIF setup rule (this is the allocate data structures for call graph reachability testing rule):
	now the call graph reachability hash table is a new hash table with the call graph function hash table size buckets;
	now the call graph reachability stack is an empty linked list;
	now the call graph cycle hash table is a new hash table with the call graph function hash table size buckets.

Chapter ""

To decide whether (V - an instruction vertex) is the target:
	decide no.

To test call graph reachability from the function at address (A - a number) (this is testing call graph reachability):
	if the call graph reachability hash table contains the key A:
		stop;
	parse the function at address A;
	repeat with the instruction vertex running through the scratch space:
		if the instruction vertex is the target:
			insert the key A and the value true into the call graph reachability hash table;
			stop;
	let the identically classified list be an empty linked list;
	push the key A onto the identically classified list;
	push the key A and the value the identically classified list onto the call stack;
	repeat with the instruction vertex running through instances of function call in the scratch space:


	let the cached result be the first truth state value matching the key A in the call graph reachability hash table;
	if the cached result is true of the cached result is false:
		decide on the cached result;
		

A GRIF shielding rule:
	shiled testing call graph reachability against instrumentation.

Call Graph Reachability ends here.
