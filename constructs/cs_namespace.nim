import ../types, uuids, cs_class, cs_enum, cs_interface, cs_usingdirective
import tables, sets, strutils, options

type NamespaceParts* {.pure.} = enum
  Interfaces, Enums, Classes

type Child = object
  name: string
  case kind: NamespaceParts
  of NamespaceParts.Classes:
    npCls: CsClass
  of NamespaceParts.Interfaces:
    npIface: CsInterface
  of NamespaceParts.Enums:
    npEnum: CsEnum


type CsNamespace* = ref object of CsObject
  parent*: string
  classes*: seq[CsClass]
  classTable*: TableRef[string, CsClass]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]
  interfaces*: seq[CsInterface]
  interfaceTable*: TableRef[string, CsInterface]
  lastAddedTo*: Option[NamespaceParts] # TODO: !!! we actually want here an object variant, so we can simply ask for the object.
  lastAdded: Child
  imports*: seq[CsUsingDirective]

import sequtils
proc `$`*(n: CsNamespace): string =
  result = "name:" & n.name
  result &= "\nparent" & n.parent
  result &= "\nclasses:" & n.classes.mapIt(it.name).join(" ")
  result &= "\nenums:" & n.enums.mapIt(it.name).join(" ")

proc newCs*(t: typedesc[CsNamespace]; name: string): CsNamespace =
  new result
  result.id = genUUID().some
  result.name = name
  result.classes = @[]
  result.classTable = newTable[string, CsClass]()
  result.enums = @[]
  result.enumTable = newTable[string, CsEnum]()
  result.interfaces = @[]
  result.interfaceTable = newTable[string, CsInterface]()

proc extract*(t: typedesc[CsNamespace]; info: Info; data: AllNeededData): CsNamespace =
  extract(t, info)
proc extract*(t: typedesc[CsNamespace]; info: Info; ): CsNamespace =
  result = newCs(t, info.essentials[0])

proc add*(parent: var CsNamespace; item: CsEnum) =
  item.parentId = parent.id
  parent.enums.add item
  parent.enumTable[item.name] = item
  parent.lastAddedTo = some(NamespaceParts.Enums)
  parent.lastAdded = Child(kind: NamespaceParts.Enums, npEnum: item)
proc add*(parent: var CsNamespace; item: CsEnum; data: AllNeededData) = parent.add(item) # TODO

proc add*(ns: var CsNamespace; class: CsClass) =
  ns.classes.add(class)
  ns.classTable[class.name] = class
  ns.lastAddedTo = some(NamespaceParts.Classes)

proc add*(ns: var CsNamespace; use: CsUsingDirective) =
  ns.imports.add use

proc gen*(r: CsNamespace): string =
  echo "generating namespace: " & r.name
  var s: seq[string] = @[]
  for u in r.imports:
    s.add(u.gen())
  s.add("")
  for c in r.classes:
    s.add(c.gen())
  s.add("")
  for e in r.enums:
    s.add(e.gen())
  result = s.join("\r\n")

import hashes
proc hash*(c: CsNamespace): Hash =
  result = hash(c.name)
