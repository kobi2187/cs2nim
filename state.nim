# common.nim
import stacks, sets
# import json

import types

type Block* = object
  name*: string
  info*: Info

var blocks* = newStack[Block]()

proc resetBlocks*() = blocks.clear()


import algorithm, hashes
var currentConstruct* = newSeq[Block]()

proc prevprevConstruct*: Block =
  let skipList = @[
    "BlockStarts"
  ].toHashSet()
  assert currentConstruct.len >= 3
  for i, c in currentConstruct[0 .. ^3].reversed:
    if not (c.name in skipList):
      return c

proc previousConstruct*: Block =
  let skipList = @[
    "BlockStarts"
  ].toHashSet()
  assert currentConstruct.len >= 2
  for i, c in currentConstruct[0 .. ^2].reversed:
    # if i > 0:
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

