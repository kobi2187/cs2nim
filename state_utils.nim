import constructs / cs_all_constructs # [cs_root, cs_class, cs_method, cs_constructor, cs_property, cs_indexer]
import stacks, tables, json, sequtils, options
import state, types #, block_utils
import constructs/justtypes

import strutils, options
import constructs/cs_root
import tables, sets
import construct

proc nsPathNS*(r: var CsRoot): seq[CsNamespace] =
  # echo "in nsPathNS ",  $blocks
  var started = false
 # we assume blocks starts with namespaces.
 # echo blocks
  for b in blocks.toSeq:
    if b.name == "StartBlock": continue # ignore.
    elif b.name == "NamespaceDeclaration":
      started = true
      let ns = r.fetch(b.id)
      if ns.isNone: return
      else:
        if ns.get.kind == ckNamespace:
          # echo "the name: " & ns.get.namespace.name
          result.add(ns.get.namespace)
      # let name = extract(CsNamespace, b.info).name
      # # assert r.nsTables.hasKey(name), "r.nsTables doesn't have it:" & $name
      # let actual = r.ns.toSeq.filterIt(it.name == name)
      # let actualNs =
      # r.nsTables[name]

    else:
      if not started:
        continue # ignore the beginning until we find a namespace.
      else: # both started and not ns: stop
        break # stop after last ns.

proc nsPath*(r: var CsRoot): string = # SAME?
  let ns = nsPathNS(r)
  result = if ns.len > 0:
    ns.mapIt(it.name).join(".")
  else:
    "default"

import common_utils
# proc last*[T](s: seq[T]): T =
#   result = s[s.len-1]
# proc isEmpty*[T](s: seq[T]): bool =
#   result = (s.len == 0)
proc itemName*(b: Block): string =
  b.info.essentials[0]

proc pairs[A, B](t: TableRef[A, B]): seq[(A, B)] =
  for p in pairs(t):
    result.add p

proc keys[A, B](t: TableRef[A, B]): seq[A] =
  for k in keys(t):
    result.add k


proc previousBlock*(a: int = 2): Option[Block] =
  let idx = -2 * a + 1
  let prev = blocks.peek(idx) # -2*2+1 = -3
  result = prev

proc isVisitBlock*(info: Info): bool =
  result = info.extras.len > 0 and info.extras[0] == "VisitBlock"

import construct, state
proc previousConstructObj*(r: var CsRoot): Option[Construct] =
  let previd = previousConstruct().id
  result = r.fetch(previd)

proc getLastClass*(root: var CsRoot): Option[CsClass] =
  var ns = nsPathNS(root)
  if ns.len == 0: ns = @[root.global]
  result = ns.last.getLastClass()
proc getCurrentNs*(root: var CsRoot): (string, CsNamespace) =
  var p = nsPath(root)
  if p == "": p = "default"
  # echo p
  assert root.nsTables.hasKey(p)
  let ns = root.nsTables[p]
  result = (p, ns)

proc getLastProperty*(root: var CsRoot): Option[CsProperty] =
  var (_, ns) = root.getCurrentNs
  result = ns.getLastProperty()

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
  of [NamespaceParts.Interfaces, NamespaceParts.Unset, NamespaceParts.Enums,
      NamespaceParts.Using]: discard

proc getLastIndexer*(root: var CsRoot): Option[CsIndexer] =
  var (_, ns) = root.getCurrentNs
  result = ns.getLastIndexer()
import options #, sequtils, strutils
import common_utils
import constructs/[justtypes] #,cs_root]
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

# import tables

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

# ===



# proc getCurrentNs*(root:var CsRoot): (string, CsNamespace) =
#   var p = nsPath(root)
#   if p == "": p = "default"
#   # echo p
#   assert root.nsTables.hasKey(p)
#   let ns = root.nsTables[p]
#   result = (p, ns)

# proc getLastIndexer*(root: var CsRoot): Option[CsIndexer] =
#   var (_, ns) = root.getCurrentNs
#   result = ns.getLastIndexer()

# proc getLastProperty*(root: var CsRoot): Option[CsProperty] =
#   var (_, ns) = root.getCurrentNs
#   result = ns.getLastProperty()
