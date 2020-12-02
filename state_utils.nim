import constructs / [cs_root, cs_class, cs_method, cs_constructor, cs_property, cs_indexer]
import stacks, tables, json, sequtils, options
import state, types

proc `$`*(it: Block): string =
  result =
    if not it.info.isNil and it.info.essentials.len > 0:
      it.name & ": `" & it.info.essentials[0] & "`"
    else: it.name

proc `$`*(blocks: Stack[Block]): string =
  let x = blocks.toSeq.mapIt($it)
  result = $x

import strutils, options
proc endBlock*(info: Info) =
  echo blocks
  assert(blocks.len > 0, "blocks is empty! but we got EndBlock")
  assert info.declName == "EndBlock"
  let blockCount = parseInt(info.essentials[0])
  echo "before: " & $blocks.len

  # on endBlock we now always expect to see an even number of items.
  if (blocks.len mod 2 != 0):
    echo blocks.pop
    return

  var last = blocks.pop # we do it twice now.
  let bs = blocks.pop
  assert bs.name == "BlockStarts"

  echo "block count, according to csast:" & $blockCount
  echo "block count, according to our count:" & $blocks.len
  assert blocks.len == blockCount*2, $blocks

  echo "removed " & $last & " from blocks tracking. (assumes we finished with it)"


  echo "-- End of block: " & $last

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
