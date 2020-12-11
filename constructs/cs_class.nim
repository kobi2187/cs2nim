import ../types, ../state_utils, uuids, options
import cs_method, cs_field, cs_enum, cs_constructor, cs_property, cs_indexer
import tables


type ClassParts* {.pure.} = enum
  Fields, Methods, Ctors, Enums, Properties, Indexer

import options
type CsClass* = ref object of CsObject
  nsParent*: string
  extends*: string
  implements*: seq[string]
  fields*: seq[CsField]
  properties*: seq[CsProperty]
  methods*: seq[CsMethod]
  ctors*: seq[CsConstructor]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]
  lastAddedTo*: Option[ClassParts]
  isStatic*: bool
  indexer*: CsIndexer
  # hasIndexer*: bool

proc hasIndexer*(c: CsClass): bool = not c.indexer.isNil

proc newCs*(t: typedesc[CsClass]; name: string; base = ""; impls: seq[string] = @[]): CsClass =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
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
  echo "has Indexer: " & $c.hasIndexer
  if c.hasIndexer:
    result &= c.indexer.gen()
  echo "has properties: " & $c.properties.len
  for p in c.properties:
    result &= p.gen()

proc add*(parent: var CsClass; m: CsConstructor) =
  parent.ctors.add m
  parent.lastAddedTo = some(Ctors)
  m.parentClass = parent.name

proc add*(parent: var CsClass; m: CsMethod) =
  parent.methods.add m
  parent.lastAddedTo = some(Methods)
  m.parentClass = parent.name

proc add*(parent: var CsClass; item: CsProperty) =
  item.parentId = parent.id
  parent.properties.add item
  parent.lastAddedTo = some(Properties)
  item.parentClass = parent.name
# proc add*(parent: var CsClass; item: CsProperty; data: AllNeededData) = parent.add(item) # TODO

proc add*(parent: var CsClass; item: CsIndexer) =
  item.parentId = parent.id
  parent.indexer = item
  parent.lastAddedTo = some(Indexer)
  # item.parentName = parent.name

# proc add*(parent: var CsClass; item: CsIndexer; data: AllNeededData) = parent.add(item) # TODO
