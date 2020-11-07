# common.nim
import stacks, sets
# import json

import types
type Info* = object
  essentials*: seq[string]
  extras*: seq[string]
  declName*: string

type Block* = object
  name*: string
  info*: Info

var blocks* = newStack[Block]()
# proc getBlockCount :int= blocks.len
proc endBlock*() =
  assert blocks.len > 0
  discard blocks.pop
import create
var root* = newCsRoot()


var currentConstruct* = newSeq[Block]()

# declaration string as received from cs side.
let blockTypesTxt* = [
  "ClassDeclaration",
  "NamespaceDeclaration",
  "MethodDeclaration",
  "EnumDeclaration",

  # todo: ... add more
    # note: if endblock raises an assert, it means a previous construct was not recorded here.
  ].toHashSet

proc currentPath*(): seq[Block] = blocks.toSeq()

#TODO: we have some samples, make unit tests to see these utils work as expected.
#TODO: and ofcourse the nim code generates properly.
