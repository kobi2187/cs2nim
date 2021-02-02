# mapper.nim
# import ../parentChildMapping
import ../construct
import tables, sequtils, strutils

proc srcToHash(contents:string) : TableRef[string,seq[string]] =
  new result
  let lines = contents.splitLines
  for ln in lines:
    let parts = ln.split("->")
    if not ln.isEmptyOrWhitespace:
      assert parts.len == 2
      let (a,b) = (parts[0].strip , parts[1].strip)
      if not result.hasKey(a):
        result[a] = newSeq[string]()

      let val = result[a]
      if not val.contains b:
        result[a].add b

proc srcToHash(file:File) : TableRef[string,seq[string]] =
  let str = file.readAll
  result = srcToHash(str)

when false:
  proc hashToSrc() =
    for k,v in parentKidMapping:
      for it in v:
        echo $k & " -> " & $it

proc smallCk(parent:string):string=
   parent[2].toLowerAscii & parent[3..^1]
import algorithm
let specialCases = {
  "interface": "cinterface",
  "enum": "cenum",
  "method" : "cmethod",
  "block":"cblock",
  }.toTable()

proc  handleSpecial(p:string):string =
  if specialCases.hasKey(p):
    specialCases[p]
  else: p

proc caseGenerator(table:TableRef[string,seq[string]]):string =
  result = ""
  if table.len > 0:
    result &= "case parent.kind\n"
  for parent in table.keys:
    # let small = smallCk(parent)
    # echo small
    result &= "  of " & parent & ":\n"
    result &= "    var p = parent." & parent.smallCk.handleSpecial & "\n"
    if table[parent].len > 0:
      result &= "    case child.kind\n"
    for ch in table[parent].sorted:
      result &= "    of " & ch & ":\n"
      result &= "      var c = child." & ch.smallCk.handleSpecial & "\n"
      result &= "      c.parentId = p.id; p.add c\n"
    if table[parent].len > 0:
      result &= "    else: assert false, couple & \" plz impl for child: \" & $child.kind"

    result &= "\n"

  result &= "  else: assert false, couple & \" plz impl for parent: \" & $parent.kind"

proc genStoreInParent*() :string=
  result = """import constructs/[cs_all_constructs, justtypes]
import types, construct
import  options

proc add*(parent, child: Construct; data: AllNeededData) =
  echo "in add <Construct>"
  let couple : string = $parent.kind & " -> " & $child.kind
  echo couple
  """
  let file = "/home/kobi7/currentWork/cs2nim/nim_syntax_playground/parentKidMapping.txt"
  let fh = open(file)
  let tbl = srcToHash(fh)
  close(fh)
  let cases = caseGenerator(tbl)
  result &= cases



