import strutils, sequtils
import types, sets

type Module* = object
  name*: string
  output*: string

# note: with interfaces in Nim, the name doesn't matter, it's structural, and there is only one possible parent for a type in Nim, so we can create a baseclass, combining all those interfaces. the interface itself is just a seq of empty procs - signatures (and a name), so this set of interfaces, can be combined to one with a long name. some kind of hashtable for these will be needed in state-- an interface in c# can have many interface parents for example. we can generate its full info with a proc on a need-basis (live). if the type inherits a class as well, we'll first generate the parent type unless already exists, combined with those interfaces.
# note: interfaces' other side in compile-time is 'concepts', giving more info about the type. But the concepts cannot be used in runtime, such as a seq of interface-abiding objects. so we still create the type as explained above. Nim inheritance has simply one parent.

proc gen*(m: CsMethod): string =
  echo "generating method (wip): " & m.name
  result = "proc "
  # if m.isStatic: result = "proc " else: result = "method "
  let parameterList = "" # TODO
  let returnType = m.returnType
  let body = "" # TODO
  result &= m.name & "(" & parameterList & ")"
  if returnType != "": result &= ": " & returnType
  result &= " ="
  result &= "\r\n"

  result &= body

#[ "proc method_name*(args..)
# if m.isStatic is false - we add a self:enclosingClassName as the first argument
# let sig = m.signature.gen(m.isStatic)
# let body = m.body.gen()
# let bodyLines = body.splitLines()
# result = sig
# for line in bodyLines:
#   result &= "\t" & line
]#

proc gen*(f: CsField): string =
  result = f.name
  if f.ispublic: result &= "*"
  result &= ": " & f.ttype

proc gen*(c: CsClass): string =
  echo "generating class:" & c.name
  if c.isNil: result = "" else: result &= "type " & c.name & "* = ref object"
  result &= "\r\n\r\n"
  for f in c.fields:
    result &= "\t" & f.gen() & "\r\n"
  echo "methods count: " & $c.methods.len
  for m in c.methods:
    result &= m.gen()
    result &= "\r\n"

import options
proc gen*(e: CsEnumMember): string =
  result = e.name
  if e.value.isSome: result &= " = " & $e.value.get

proc gen*(e: CsEnum): string =
  echo "members count:" & $e.items.len

  result = "type " & e.name & "* = enum"
  if e.items.len > 0:
    result &= "\n  "
    let strs = e.items.mapIt(it.gen())
    result &= strs.join(", ")
  echo result


proc gen*(r: CsNamespace): string =
  echo "generating namespace: " & r.name
  var s: seq[string] = @[]
  for c in r.classes:
    s.add(c.gen())
  for e in r.enums:
    s.add(e.gen())
  result = s.join("\r\n")

proc makeModule*(ns: CsNamespace): Module =
  var name: string
  if ns.parent.len > 0:
    name = ns.parent & "." & ns.name
  else:
    name = ns.name
  let output = ns.gen() & "\n\n"
  result = Module(name: name, output: output)

import sets, tables

proc gen*(r: CsRoot): seq[Module] =
  if not r.global.isNil:
    result.add makeModule(r.global)

  for n in r.ns:
    echo "in gen(): ns is: " & $n.name
    assert r.nsTables.hasKey(n.name), n.name & "is missing"
    result.add makeModule(n)

