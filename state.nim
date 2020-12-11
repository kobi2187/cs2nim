# common.nim
import stacks, sets, uuids
# import json
# import constructs/cs_root
import types

type Block* = object
  id*: UUID
  name*: string
  info*: Info

var blocks* = newStack[Block]()



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
let blockTypesTxt* = [ # everything in C# that has an opening { brace
  "BlockStarts",       # needed!!
  "NamespaceDeclaration",
  "ClassDeclaration",
  "EnumDeclaration",
  "MethodDeclaration",
  "PropertyDeclaration",
  # "ReturnStatement", # nope
  # "ExpressionStatement", # nope
  # "LocalDeclarationStatement" # not sure why. # nope
].toHashSet
# note: if endblock raises an assert, it means a previous construct was not recorded here.

proc currentPath*(): seq[Block] = blocks.toSeq()

