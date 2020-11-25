# common.nim
import stacks, sets
# import json

# import types
type Info* = ref object
  essentials*: seq[string]
  extras*: seq[string]
  declName*: string

import strutils
proc `$`*(info: Info): string =
  let x = [info.declName, $info.essentials, $info.extras]
  result = "Info: " & x.join("\n")

# type Block* = object
#   instanceName*, typeName*: string

type Block* = object
  name*: string
  info*: Info

import strutils
var blocks* = newStack[Block]()
# proc getBlockCount :int= blocks.len
proc resetBlocks*() = blocks.clear()
# import create
import algorithm, hashes
var currentConstruct* = newSeq[Block]()
proc previousConstruct*: Block =
  let skipList = @[
    "BlockStarts"
  ].toHashSet()
  for i, c in currentConstruct.reversed:
    if i > 0:
      if not (c.name in skipList):
        return c

# declaration string as received from cs side.
let blockTypesTxt* = [
  "BlockStarts",
  "NamespaceDeclaration",
  "ClassDeclaration",
  "EnumDeclaration",
  "MethodDeclaration",
  "ReturnStatement" # ???
                    # not yet supported:

    # todo: ... add more, and sync with CsDisplay side.
    # note: if endblock raises an assert, it means a previous construct was not recorded here.
  ].toHashSet

proc currentPath*(): seq[Block] = blocks.toSeq()

