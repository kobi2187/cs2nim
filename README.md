# cs2nim

## Purpose

To ease porting efforts of C# to Nim.

## What can it currently do

- Can now create nim modules (files) from C# namespaces.
- Can now create type names from C# classes.

## Supported C# Constructs, so far

:: type, new, extract, add, gen, unit test.

- namespace

### next: enum

## How it works

## Part 1

A separate csharp program, called [`CsDisplay`](https://github.com/kobi2187/CsDisplay), is run.

It uses Microsoft's Roslyn (with the visitor pattern) to process each C# file in a folder, to a json file with the extension ".csast" in the same folder. (can also accept directories)

Every construct seen in the csharp code is output as either a declaration line, or an endblock line.
EndBlock lets us know when we reach the end of a namespace, class, enum, method, etc.

As development progresses, these declaration lines will have all the required info for the output on the Nim side.

This is the end of what CsDisplay does for us.

## Part 2

Now, this repository aims to take these files, read the json lines, extract the info and build correct objects on the nim side.

It is a tree structure ( CsRoot ), a root has a default namespace and a seq of other namespaces, they in turn contain classes and all that a namespace can hold.

the classes in turn contain fields, methods, etc.

Implementation wise, there is also a stack for the encountered code blocks to assist in knowing our current "path" or location in the code. (know where to add new info to)

After we build this tree, we generate the nim code from it, each object knows how to generate itself.

## wanna help?

Add support for an unsupported construct!

write two minimal samples:

1. the source C# code
2. the output Nim code.

That's already great help.

run CsDisplay on the C# code, and figure out if all the needed info exists for the Nim side:

If yes, great, write code to extract this info: See `extract.nim`

If not, open a Github issue, or extract the info from Roslyn. (this is coding in C#)

we'll also need a type, a ctor (newType proc), and modify its parent so it can store the new info.

Lastly, generate Nim text from your new type.

That's all, easy peasy. Repeat a 100 times ;-)
