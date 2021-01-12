# common.nim
import stacks, sets, uuids, sequtils
# import json
# import constructs/cs_root
import types

type Block* = object
  id*: UUID
  name*: string
  info*: Info

var blocks* = newStack[Block]()



import algorithm, hashes
import options

var currentConstruct* = newSeq[Block]()


proc getLastBlock*(cond: (proc(c: Block): bool)): Option[Block] =
  for c in currentConstruct.reversed:
    if c.cond(): return c.some
  return none(Block)

import strutils
proc getLastBlockType*(typeStr: string): Option[Block] =
  result = getLastBlock(proc(c: Block): bool = c.name.toLowerAscii ==
      typeStr.toLowerAscii)

proc getLastBlockTypes*(typeStrs: openArray[string]): Option[Block] =
  let loweredTypeStrs = typeStrs.mapIt(it.toLowerAscii)
  result = getLastBlock(proc(c: Block): bool = c.name.toLowerAscii in loweredTypeStrs)


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
let blockTypesTxt* = [ # everything in C# that has an opening { brace
  "BlockStarts",       # needed!!
  "NamespaceDeclaration",
  "ClassDeclaration",
  "EnumDeclaration",
  "MethodDeclaration",
  "PropertyDeclaration",
  # "ArrowExpressionClause"
  # "ReturnStatement", # nope
  # "ExpressionStatement", # nope
  # "LocalDeclarationStatement" # not sure why. # nope
].toHashSet
# note: if endblock raises an assert, it means a previous construct was not recorded here.

proc currentPath*(): seq[Block] = blocks.toSeq()

