import constructs / constructs # [cs_root, cs_class, cs_method, cs_constructor, cs_property, cs_indexer]
import stacks, tables, json, sequtils, options
import state, types, block_utils


import strutils, options

import tables
import constructs/[cs_namespace, cs_root]
proc nsPathNS(r: CsRoot): seq[CsNamespace] =
  var started = false
 # we assume blocks starts with namespaces.
 # echo blocks
  for b in blocks.toSeq:
    if b.name == "StartBlock": continue # ignore.
    elif b.name == "NamespaceDeclaration":
      started = true
      let name = extract(CsNamespace, b.info).name
      echo "the name: " & name
      let actualNs = r.nsTables[name]
      result.add(actualNs)
    else:
      if not started:
        continue # ignore the beginning until we find a namespace.
      else: # both started and not ns: stop
        break # stop after last ns.

proc nsPath*(r: CsRoot): string = # SAME?
  let ns = nsPathNS(r)
  result = if ns.len > 0:
    ns.mapIt(it.name).join(".")
  else:
    "default"


proc last*[T](s: seq[T]): T =
  result = s[s.len-1]
proc isEmpty*[T](s: seq[T]): bool =
  result = (s.len == 0)
proc itemName*(b: Block): string =
  b.info.essentials[0]

proc pairs[A, B](t: TableRef[A, B]): seq[(A, B)] =
  for p in pairs(t):
    result.add p

proc keys[A, B](t: TableRef[A, B]): seq[A] =
  for k in keys(t):
    result.add k

proc getLastClass*(ns: CsNamespace): Option[CsClass] =
  echo ns
  if ns.classes.len == 0:
    result = none(CsClass)
  else:
    result = some(ns.classes.last)

proc getLastClass*(root: CsRoot): Option[CsClass] =
  var ns = nsPathNS(root)
  if ns.len == 0: ns = @[root.global]
  result = ns.last.getLastClass()

proc getLastMethod*(cls: CsClass): Option[CsMethod] =
  if cls.methods.len == 0: return
  else:
    return some(cls.methods.last)

proc getLastCtor*(cls: CsClass): Option[CsConstructor] =
  if cls.ctors.len == 0: return
  else:
    return some(cls.ctors.last)

import tables
proc getCurrentNs*(root: CsRoot): (string, CsNamespace) =
  var p = nsPath(root)
  if p == "": p = "default"
  echo p
  assert root.nsTables.hasKey(p)
  let ns = root.nsTables[p]
  result = (p, ns)

import options
proc lastAddedInfo*(root: var CsRoot): string =
  var (p, ns) = state_utils.getCurrentNs(root)
  result = "current ns: " & p
  result &= " namespace added something: " & $ns.lastAddedTo.isSome
  if ns.lastAddedTo.isSome:
    result &= "last added in ns: " & $ns.lastAddedTo
    case ns.lastAddedTo.get
    of NamespaceParts.Classes:
      let c = ns.getLastClass.get
      result &= "class is: " & c.name
      if c.lastAddedTo.isSome:
        result &= "class added something:" & $c.lastAddedTo.isSome
        result &= "it was: " & $c.lastAddedTo.get & "  "
        case c.lastAddedTo.get
        of ClassParts.Properties: result &= c.properties.last.name
        of ClassParts.Ctors: result &= c.ctors.last.name
        of ClassParts.Indexer: result &= c.indexer.varName
        of ClassParts.Methods: result &= c.methods.last.name
        of ClassParts.Enums: result &= c.enums.last.name
        of ClassParts.Fields: result &= c.fields.last.name

    of NamespaceParts.Interfaces:
      result &= ns.interfaces.last.name
    of NamespaceParts.Enums:
      let e = ns.enums.last
      result &= "enum is " & e.name


proc getLastProperty(c: CsClass): Option[CsProperty] =
  assert c.lastAddedTo.isSome
  case c.lastAddedTo.get
  of ClassParts.Properties:
    # echo "~~~" & c.properties.mapIt(it.name)
    if c.properties.isEmpty:
      result = none(CsProperty)
    else:
      assert c.properties.len > 0
      var last = c.properties[^1]
      result = some(last)

  else: assert false, "Unsupported"



proc getLastProperty*(ns: CsNamespace): Option[CsProperty] =
  assert ns.lastAddedTo.isSome
  case ns.lastAddedTo.get
  of NamespaceParts.Interfaces: discard # TODO
  of NamespaceParts.Classes:
    let c = ns.getLastClass()
    if c.isNone: result = none(CsProperty)
    else:
      result = c.get.getLastProperty()
  of [NamespaceParts.Enums]: discard

proc getLastProperty*(root: CsRoot): Option[CsProperty] =
  var (_, ns) = root.getCurrentNs
  result = ns.getLastProperty()

# ===

proc getIndexer(c: CsClass): Option[CsIndexer] =
  if not c.hasIndexer:
    echo "no indexer in class"
    result = none(CsIndexer)
  else:
    result = some(c.indexer)

proc getLastIndexer*(ns: CsNamespace): Option[CsIndexer] =
  assert ns.lastAddedTo.isSome
  case ns.lastAddedTo.get
  of NamespaceParts.Interfaces: discard # TODO
  of NamespaceParts.Classes:
    let c = ns.getLastClass()
    if c.isNone:
      echo "no last class"
      result = none(CsIndexer)
    else:
      result = c.get.getIndexer()
  of [NamespaceParts.Enums]: discard

proc getLastIndexer*(root: CsRoot): Option[CsIndexer] =
  var (_, ns) = root.getCurrentNs
  result = ns.getLastIndexer()


proc previousBlock*(a: int = 2): Option[Block] =
  let idx = -2 * a + 1
  let prev = blocks.peek(idx) # -2*2+1 = -3
  result = prev

proc isVisitBlock*(info: Info): bool =
  result = info.extras.len > 0 and info.extras[0] == "VisitBlock"

type AllNeededData* = object
  sourceCode: string
  constructDeclName: string
  currentNamespace: CsNamespace
  isNsEmpty: bool
  nsLastAdded: NamespaceParts
  lastEnum: CsEnum
  lastEnumMember: CsEnumMember
  classLastAdded: ClassParts
  lastClass: CsClass
  lastMethod: CsMethod
  lastProp: CsProperty
  lastCtor: CsConstructor
  inBlock: Block
  prevBlock: Block

proc makeNeededData*(root: var CsRoot; info: Info; src: string; ): AllNeededData =
  result.sourceCode = src
  result.constructDeclName = info.declName
  if not state.currentConstruct.isEmpty and not state.currentConstruct.last.info.isVisitBlock():
    result.inBlock = state.currentConstruct.last

  if previousBlock().isSome:
    result.prevBlock = previousBlock().get

  var (_, ns) = getCurrentNs(root)
  result.currentNamespace = ns
  result.isNsEmpty = ns.lastAddedTo.isSome
  if not result.isNsEmpty:
    result.nsLastAdded = ns.lastAddedTo.get

    if not result.lastClass.enums.isEmpty:
      result.lastEnum = result.lastClass.enums.last
      if result.lastEnum != nil:
        result.lastEnumMember = result.lastEnum.items.last
    if not ns.classes.isEmpty:
      result.lastClass = ns.classes.last
      if result.lastClass.lastAddedTo.isSome():
        result.classLastAdded = result.lastClass.lastAddedTo.get
        if not result.lastClass.methods.isEmpty:
          result.lastMethod = result.lastClass.methods.last
        if not result.lastClass.properties.isEmpty:
          result.lastProp = result.lastClass.properties.last
        if not result.lastClass.ctors.isEmpty:
          result.lastCtor = result.lastClass.ctors.last
