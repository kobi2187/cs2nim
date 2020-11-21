# state_utils.nim
# just to prevent circular dependency
import stacks, tables, json
# import sequtils
import state, extract, types, sequtils, create, addinroot

proc `$`*(it: Block): string =
  result = it.name & ": `" & it.info.essentials[0] & "`"

proc `$`*(blocks: Stack[Block]): string =
  let x = blocks.toSeq #.mapIt($it)
  result = $x



proc nsPath: string =
  var started = false
# we assume blocks starts with namespaces.
  echo blocks
  for b in blocks.toSeq:
    if b.name == "NamespaceDeclaration":
      started = true
      if result != "":
        result &= "."
      result &= extractCsNamespace(b.info).name

    else:
      if not started:
        continue
      else:
        echo result
        return
  echo result

proc last*[T](s: seq[T]): T =
  result = s[s.len-1]

proc itemName*(b: Block): string =
  b.info.essentials[0]

proc getCurrentNs*(root: var CsRoot): (string, CsNamespace) =
  var p = nsPath()
  if p == "": p = "default"
  assert root.nsTables.hasKey(p)
  let ns = root.nsTables[p]
  result = (p, ns)


