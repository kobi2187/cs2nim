# lineparser.nim
import uuids
import state, types, handle_construct, state_utils, block_utils
import constructs/cs_root
type LineKind* = enum
  Decl, EndBlock

import stacks, sets, json
import sequtils
import json

import ideal

# design note: root will be the beginning, many cs files can be parsed, (so, it means we'll pass it as a var argument)
# and all their results added to that root. a "global" namespace contains all the valid top level constructs (not within a namespace)
# so the resulting Nim modules (as files), may need to "import global" to have access to these parts.
proc modifyPosition(thetype: string; info: Info; id: UUID) =
  let c = newBlock(thetype, info, id)
  currentConstruct.add(c)

  if thetype in blockTypesTxt:
    blocks.push c

proc getInfo(line: JsonNode): (seq[string], seq[string]) =
  var main, extras: seq[string]
  let linf = line["Info"]
  if not linf.isNil and linf.kind != JNull:
    let es = linf["Essentials"]
    # echo es.kind
    main =
      if es.kind == JArray:
        es.getElems().mapIt(it.getStr)
      else: @[]
    extras = linf["Extras"].getElems().mapIt(it.getStr)
  result = (main, extras)

proc updateState(root: var CsRoot; line: JsonNode) = #, root: var CsRoot) =
  let kindstr = line["KindStr"].getStr
  let kind: LineKind =
    if line["Kind"].getInt() == 1: LineKind.EndBlock
    else: LineKind.Decl

  case kind
  of Decl:
    # echo line
    assert kindstr == "Decl"
    let decl = line["Declaration"].getStr

    var (main, extras) = getInfo(line)
    let src = line["Source"].getStr

    let info = Info(declName: decl, essentials: main, extras: extras)
    let id = genUUID()
    modifyPosition(decl, info, id)
    when true: addToRoot(root, src, info, id)
    when false: addToRoot2(root, src, info, id) # slowly switch to new system, while making sure it compiles.

  of EndBlock:
    assert kindstr == "EndBlock"
    let (main, extras) = getInfo(line)
    let info = Info(declName: "EndBlock", essentials: main, extras: extras)

    endBlock(info)

import system, os
proc parseExecFile*(root: var CsRoot; file: JsonNode) = # , root: var CsRoot) =
  let filename = file["File"].getStr
  # echo "working on file: " & filename
  echo "file: " & filename.extractFilename
  resetBlocks()
  let lines = file["Lines"]
  for line in lines:
    updateState(root, line)
