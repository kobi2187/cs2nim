import strutils, sequtils
import types

type Module* = object
  name*: string
  output*: string

# TODO: with interfaces in Nim, the name doesn't matter, it's structural, and there is only one possible parent for a type in Nim, so we can create a baseclass, combining all those interfaces. the interface itself is just a seq of empty procs - signatures (and a name), so this set of interfaces, can be combined to one with a long name. some kind of hashtable for these will be needed in state-- an interface in c# can have many interface parents for example. we can generate its full info with a proc on a need-basis (live). if the type inherits a class as well, we'll first generate the parent type unless already exists, combined with those interfaces.

#TODO: interfaces' other side in compile-time is 'concepts', giving more info about the type. But the concepts cannot be used in runtime, such as a seq of interface-abiding objects. so we still create the type as explained above. Nim inheritance has simply one parent.

# proc gen*(r:MethodArgument) : string = discard

proc gen*(r: CsMethodBody): string = discard
proc gen*(r: CsMethodSignature, isStatic: bool): string = discard



proc gen*(m: CsMethod): string =
  # "proc method_name*(args..)
  # if m.isStatic is false - we add a self:enclosingClassName as the first argument
  let sig = m.signature.gen(m.isStatic)
  let body = m.body.gen()
  let bodyLines = body.splitLines()
  result = sig
  for line in bodyLines:
    result &= "\t" & line

proc gen*(f: CsField): string =
  result = f.name
  if f.ispublic: result &= "*"
  result &= ": " & f.ttype

proc gen*(c: CsClass): string =
  if c.isNil: result = ""
  else:
    result &= "type " & c.name & "* = ref object"
    for f in c.fields:
      result &= "\t" & f.gen() & "\r\n"
    # result &= "\r\n"

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
  var s: seq[string] = @[]
  for c in r.classes:
    s.add(c.gen())
  for e in r.enums:
    s.add(e.gen())
  result = s.join("\r\n")

proc makeModule*(ns: CsNamespace): Module =
  let name = ns.name
  let output = ns.gen() & "\n\n"
  result = Module(name: name, output: output)

proc gen*(r: CsRoot): seq[Module] =
  if not r.global.isNil:
    result.add makeModule(r.global)
  for n in r.ns:
    result.add makeModule(n)

