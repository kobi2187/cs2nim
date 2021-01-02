import options, sequtils, strutils
import common_utils
import constructs/[justtypes,cs_root]
proc getLastClass*(ns: CsNamespace): Option[CsClass] =
  # echo ns
  if ns.classes.len == 0:
    result = none(CsClass)
  else:
    result = some(ns.classes.last)

proc getLastMethod*(cls: CsClass): Option[CsMethod] =
  if cls.methods.len == 0: return
  else:
    return some(cls.methods.last)

proc getLastCtor*(cls: CsClass): Option[CsConstructor] =
  if cls.ctors.len == 0: return
  else:
    return some(cls.ctors.last)

import tables
proc getCurrentNs*(root:var CsRoot): (string, CsNamespace) =
  var p = nsPath(root)
  if p == "": p = "default"
  # echo p
  assert root.nsTables.hasKey(p)
  let ns = root.nsTables[p]
  result = (p, ns)

import options

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
  of [NamespaceParts.Enums, NamespaceParts.Unset, NamespaceParts.Using]: discard

proc getLastProperty*(root: var CsRoot): Option[CsProperty] =
  var (_, ns) = root.getCurrentNs
  result = ns.getLastProperty()

# ===


proc getIndexer(c: CsClass): Option[CsIndexer] =
  if not c.hasIndexer():
    echo "no indexer in class"
    result = none(CsIndexer)
  else:
    result = some(c.indexer)

proc getLastIndexer*(ns: CsNamespace): Option[CsIndexer] =
  assert ns.lastAddedTo.isSome
  case ns.lastAddedTo.get
  of NamespaceParts.Classes:
    let c = ns.getLastClass()
    if c.isNone:
      echo "no last class"
      result = none(CsIndexer)
    else:
      result = c.get.getIndexer()
  of [NamespaceParts.Interfaces, NamespaceParts.Unset, NamespaceParts.Enums,NamespaceParts.Using]: discard

proc getLastIndexer*(root: var CsRoot): Option[CsIndexer] =
  var (_, ns) = root.getCurrentNs
  result = ns.getLastIndexer()

