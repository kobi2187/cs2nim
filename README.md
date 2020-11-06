# cs2nim
This program aims at porting c# code to nim.

A separate csharp program, called `CsDisplay`, is run. It uses roslyn with the visitor pattern (not the queries way)
and creates a ".csast" file for every c# file, in the same folder as the original file. (can also accept directories)

The files are actually json. Every construct seen in the csharp code is output as either a declaration line, or an endblock line.
EndBlock lets us know when we reach the end of a namespace, class, enum, method, etc.

Now, this repository aims to take these files, read the json lines, extract the info and build correct objects on the nim side.

It is a tree structure, a root has a default namespace and a seq of other namespaces, they in turn contain classes and all that a namespace can hold.

the classes in turn contain fields, methods, etc. 

There is also a stack for "blocks" that should keep track of these, in order to know where we are in the code. It exists on the nim side.

After we build this tree, we generate the nim code from it, each object knows how to generate itself. (currently I assume it's easier to output code directly, instead of Nim AST (NimNodes))

## status: 
The structure is done, but the many constructs need to be built. 

At the same time, on the C# side (CsDisplay program), will need to get and pass the needed info so we can build the objects properly. 

For example right now we only pass a class's name, but it can also inherit or implement, and this information is needed as well.

We must have unit testing as well.

The other part is how to generate well. Nim is mostly a superset of many languages and has the ability to represent their constructs, but some require thought since they don't readily exist.

For example, how to handle interfaces? My current thinking is for interface, we'll probably create a type that unifies or combines the required interfaces, which are basically a name and a list of empty procs, into one type.

Thus, some code generation beyond the literal translation may exist, but perhaps it'll get factored out to its own library in time.

## percent done:
...
