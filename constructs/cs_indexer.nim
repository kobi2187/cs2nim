import ../types, uuids, options
import cs_predefinedtype, cs_parameter, cs_explicitinterfacespecifier
type CsIndexer* = ref object of CsObject
  retType*: string
  varName*: string
  varType*: string
  firstVarType*: string
  hasGet*: bool
  hasSet*: bool
  # name*: string  # no, there is no name, but there is an AccessorList, or Accessor, that provide the function body.

proc newCs*(t: typedesc[CsIndexer]): CsIndexer =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.hasGet = true
  result.hasSet = true

proc extract*(t: typedesc[CsIndexer]; info: Info): CsIndexer =
  result = newCs(CsIndexer)

proc add*(parent: var CsIndexer; item: CsParameter) =
  item.parentId = parent.id
  parent.varName = item.name
  parent.varType = item.ptype
proc add*(parent: var CsIndexer; item: CsParameter; data: AllNeededData) = parent.add(item) # TODO

proc add*(parent: var CsIndexer; item: CsPredefinedType) =
  item.parentId = parent.id
  parent.retType = item.name
proc add*(parent: var CsIndexer; item: CsPredefinedType; data: AllNeededData) = parent.add(item) # TODO

proc add*(parent: var CsIndexer; item: CsExplicitInterfaceSpecifier) =
  item.parentId = parent.id
  parent.firstVarType = item.name
proc add*(parent: var CsIndexer; item: CsExplicitInterfaceSpecifier; data: AllNeededData) = parent.add(item) # TODO

import strutils

proc gen*(c: var CsIndexer): string =
  let x = c.firstVarType.rsplit(".", 1)[^1]
  echo x
  if c.hasGet:
    result &= "proc `[]`*(this: var " & x & "; " & c.varName & ": " & c.varType & "): " & c.retType & " = discard"
  if c.hasSet:
    result &= "\nproc `[]=`*(this: var " & x & "; " & c.varName & ": " & c.varType & "; value: " & c.retType & ") = discard"

