# lineparser.nim
import state, state_utils

type LineKind* = enum
  Decl, EndBlock

import stacks, sets, json
import sequtils
import json


# design note: root will be the beginning, many cs files can be parsed, (so, it means we'll pass it as a var argument)
# and all their results added to that root. a "global" namespace contains all the valid top level constructs (not within a namespace)
# so the resulting Nim modules (as files), may need to "import global" to have access to these parts.
proc modifyPosition(thetype: string; info: Info) =
  let c = Block(name: thetype, info: info)
  currentConstruct.add(c)

  if thetype in blockTypesTxt:
    blocks.push c

proc updateState(line: JsonNode) = #, root: var CsRoot) =
  let kindstr = line["KindStr"].getStr
  let kind: LineKind =
    if line["Kind"].getInt() == 1: LineKind.EndBlock
    else: LineKind.Decl

  case kind
  of Decl:
    # echo line
    assert kindstr == "Decl"
    let decl = line["Declaration"].getStr

    var main, extras: seq[string]
    let linf = line["Info"]
    if not linf.isNil and linf.kind != JNull:
      let es = linf["Essentials"]
      # echo es.kind
      main = if es.kind == JArray:
        es.getElems().mapIt(it.getStr)
      else: @[]
      extras = linf["Extras"].getElems().mapIt(it.getStr)

    let src = line["Source"].getStr

    let info = Info(declName: decl, essentials: main, extras: extras)
    modifyPosition(decl, info)
    addToRoot(src, info)

  of EndBlock:
    assert kindstr == "EndBlock"
    endBlock()

proc parseExecFile*(file: JsonNode) = # , root: var CsRoot) =
  let filename = file["File"].getStr
  echo "working on file: " & filename

  let lines = file["Lines"]
  for line in lines:
    updateState(line)
