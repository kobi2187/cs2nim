import ../types
import cs_method, cs_field, cs_enum, cs_constructor
import tables


type ClassParts* {.pure.} = enum
  Fields, Methods, Ctors, Enums

import options
type CsClass* = ref object of CsObject
  name*: string
  nsParent*: string
  extends*: string
  implements*: seq[string]
  fields*: seq[CsField]
  methods*: seq[CsMethod]
  ctors*: seq[CsConstructor]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]
  lastAddedTo*: Option[ClassParts]
  isStatic*: bool

proc newCs*(t: typedesc[CsClass]; name: string; base = ""; impls: seq[string] = @[]): CsClass =
  new result
  result.name = name
  result.extends = base
  result.implements = impls

proc extract*(t: typedesc[CsClass]; info: Info): CsClass =
  # new result
  let name = info.essentials[0]
  if info.essentials.len > 1:
    let baseTypes = info.essentials[1].split(", ")
    # echo "BASETYPES: " & $baseTypes
    if baseTypes.len > 1:
      result = newCs(CsClass, name, baseTypes[0], baseTypes[1..^1])
    else: result = newCs(CsClass, name, baseTypes[0])
  else:
    result = newCs(CsClass, name)

proc add*(parent: var CsClass; m: CsConstructor) =
  parent.ctors.add m
  parent.lastAddedTo = some(Ctors)
  m.parentClass = parent.name

proc add*(parent: var CsClass; m: CsMethod) =
  parent.methods.add m
  parent.lastAddedTo = some(Methods)
  m.parentClass = parent.name


proc gen*(c: CsClass): string =
  echo "generating class:" & c.name
  if c.isNil: result = "" else: result &= "type " & c.name & "* = ref object"
  if c.extends != "": result &= " of " & c.extends
  result &= "\r\n\r\n"
  for f in c.fields:
    result &= "\t" & f.gen() & "\r\n"
  echo "methods count: " & $c.methods.len
  for m in c.methods.mitems:
    result &= m.gen()
    result &= "\r\n"
  echo "ctors count: " & $c.ctors.len
  for ctor in c.ctors.mitems:
    result &= ctor.gen()
    result &= "\r\n"
