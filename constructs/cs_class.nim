import ../types
import cs_method, cs_field, cs_enum, cs_constructor
import tables


type ClassParts* {.pure.} = enum
  Fields, Methods, Ctors, Enums
type CsClass* = ref object of CsObject
  name*: string
  nsParent*: string
  fields*: seq[CsField]
  methods*: seq[CsMethod]
  ctors*: seq[CsConstructor]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]
  lastAddedTo*: ClassParts
  isStatic*: bool

proc newCs*(t: typedesc[CsClass]; name: string): CsClass =
  new result #TODO(create:CsClass)

proc extract*(t: typedesc[CsClass]; info: Info): CsClass =
  # new result
  let name = info.essentials[0]
  result = CsClass(name: name)

proc add*(parent: var CsClass; m: CsConstructor) =
  parent.ctors.add m
  parent.lastAddedTo = Ctors

proc add*(parent: var CsClass; m: CsMethod) =
  parent.methods.add m
  parent.lastAddedTo = Methods


proc gen*(c: CsClass): string =
  echo "generating class:" & c.name
  if c.isNil: result = "" else: result &= "type " & c.name & "* = ref object"
  result &= "\r\n\r\n"
  for f in c.fields:
    result &= "\t" & f.gen() & "\r\n"
  echo "methods count: " & $c.methods.len
  for m in c.methods.mitems:
    result &= m.gen()
    result &= "\r\n"
