# state_utils.nim
import stacks, tables, json
import sequtils
import state, extract, types #, sequtils, create, addinroot

proc `$`*(it: Block): string =
  result =
    if not it.info.isNil and it.info.essentials.len > 0:
      it.name & ": `" & it.info.essentials[0] & "`"
    else: it.name

proc `$`*(blocks: Stack[Block]): string =
  let x = blocks.toSeq.mapIt($it)
  result = $x

import strutils
proc endBlock*(info: Info) =
  echo blocks
  assert(blocks.len > 0, "blocks is empty! but we got EndBlock")
  assert info.declName == "EndBlock"
  let blockCount = parseInt(info.essentials[0])

  var last = blocks.pop # we do it twice now.
  let bs = blocks.pop
  assert bs.name == "BlockStarts"

  echo "removed " & $last & " from blocks tracking. (assumes we finished with it)"

  echo "block count, according to csast:" & $blockCount
  echo "block count, according to our count:" & $blocks.len
  assert blocks.len == blockCount*2


  echo "-- End of block: " & $last



proc nsPath: string =
  var started = false
 # we assume blocks starts with namespaces.
 # echo blocks
  for b in blocks.toSeq:
    if b.name == "StartBlock": continue # ignore.
    elif b.name == "NamespaceDeclaration":
      started = true
      if result != "":
        result &= "."
      result &= extract(CsNamespace, b.info).name

    else:
      if not started:
        continue # ignore the beginning until we find a namespace.
      else: # both started and not ns: stop
        break # stop after last ns.
  if result == "": # result is still empty
    result = "default"

  echo "nspath: " & result
  echo "full path: " & $blocks


proc last*[T](s: seq[T]): T =
  result = s[s.len-1]

proc itemName*(b: Block): string =
  b.info.essentials[0]

proc pairs[A, B](t: TableRef[A, B]): seq[(A, B)] =
  for p in pairs(t):
    result.add p

proc keys[A, B](t: TableRef[A, B]): seq[A] =
  for k in keys(t):
    result.add k

# TODO: fix vscode environment so i can walk the code instead of all this echo debugging.
# TODO: Want to figure out why endblock doesn't affect stack.


import tables
proc getCurrentNs*(root: var CsRoot): (string, CsNamespace) =
  var p = nsPath()
  if p == "": p = "default"
  echo p
  assert root.nsTables.hasKey(p), "probably bug with not popping the stack when block ends.\n" & $(keys(root.nsTables))
  let ns = root.nsTables[p]
  result = (p, ns)


