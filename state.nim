# common.nim
import stacks, sets
# import json

# import types
type Info* = ref object
  essentials*: seq[string]
  extras*: seq[string]
  declName*: string

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
  let skipList = @[ #TODO
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

  # not yet supported:
    # "MethodDeclaration",


      # todo: ... add more
        # note: if endblock raises an assert, it means a previous construct was not recorded here.
  ].toHashSet

proc currentPath*(): seq[Block] = blocks.toSeq()

#TODO: we have some samples, make unit tests to see these utils work as expected.
#TODO: and ofcourse the nim code generates properly.
