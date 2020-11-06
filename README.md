# cs2nim
this is a way to port c# code to nim.
a separate csharp program, called CsDisplay, is run. it uses roslyn with the visitor pattern (not the queries way)
and creates a ".csast" file for every c# file, in the same folder as the original file. (can also accept directories)
the files are actually json. every construct seen in the csharp code is output as a declaration line, and there is also endblock, 
so we know when a namespace, class, enum, method, ... end. every construct that opens a block, (curly braces in the syntax)

Now, this repository aims to take these files, read the json lines, extract the info and build objects on the nim side.
it is a tree structure, a root has a default namespace and a list of other namespaces, they in turn contain classes and all that a namespace can hold.
the classes in turn contain fields, methods, etc. 
There is also a blocks stack that should keep track of these, in order to know where we are in the code. this is on the nim side.
After we build this tree, we generate the code text from it, each object knows how to generate itself.

# status: 
the structure is done, but the many constructs need to be built. at the same time, the C# side, will need to get the needed info 
so we can build the objects properly. for example a class can inherit or implement, and this information needs to pass to the csast file.

The other part is how to generate well. Nim is mostly a superset of many languages and has the ability to represent their constructs,
but some require thought since they don't readily exist.
for example for interface, we'll probably create a type that unifies or combines the required interfaces, 
basically a name and a list of empty procs, into one type.
so there could be some code generation beyond the literal translation, but perhaps this will be factored out as a library, or a macro dsl will be made for it.

