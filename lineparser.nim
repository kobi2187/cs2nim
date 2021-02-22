# lineparser.nim
import uuids
import state, types, state_utils, block_utils
#, handle_construct
import constructs/cs_root
type LineKind* = enum
  Decl, EndBlock

import stacks, sets, json, tables
import sequtils
import json

import ideal

# design note: root will be the beginning, many cs files can be parsed, (so, it means we'll pass it as a var argument)
# and all their results added to that root. a "global" namespace contains all the valid top level constructs (not within a namespace)
# so the resulting Nim modules (as files), may need to "import global" to have access to these parts.
proc modifyPosition(thetype: string; info: Info; id: UUID) =
  if not info.isVisitBlock:
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

proc updateState(root: var CsRoot; line: JsonNode; upcoming: seq[string]) =
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

    let objkind = line["RawKind"].getInt
    let parentKind = line["ParentKind"].getInt

    # TODO assume the obj kind is unique. IS IT? XXX TEST HERE! or maybe the int is, but not the string.
    # assert not parentTable.hasKey(objkind)
    parentTable[objkind] = decl


    let info = Info(declName: decl, essentials: main, extras: extras, rawKind: objkind, parentRawKind: parentKind)

    let id = genUUID()


    echo "generated id for the next object ", decl, " ", id
    modifyPosition(decl, info, id)
    addToRoot2(root, src, info, id, upcoming) # switched to new system, while making sure it compiles.

  of EndBlock:
    assert kindstr == "EndBlock"
    let (main, extras) = getInfo(line)
    let info = Info(declName: "EndBlock", essentials: main, extras: extras)

    endBlock(info)

proc reset*() =
  state_utils.parentTable = initTable[int, string]()
  block_utils.resetBlocks()
  state.currentConstruct = newSeq[Block]()

import system, os
proc parseExecFile*(root: var CsRoot; file: JsonNode; upcoming: seq[string]) =
  let filename = file["File"].getStr
  # echo "working on file: " & filename
  echo "file: " & filename.extractFilename
  echo getOccupiedMem()
  reset()
  echo getOccupiedMem()
  let lines = file["Lines"]
  echo "# of lines: " & $lines.len
  for line in lines:
    updateState(root, line, upcoming)
