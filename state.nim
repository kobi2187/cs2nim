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

type Block* = object # TODO: trim this to save on memory: just a type name and the instance name. (instead of Info)
  name*: string
  info*: Info

var blocks* = newStack[Block]()
# proc getBlockCount :int= blocks.len
proc resetBlocks*() = blocks.clear()
proc endBlock*() =
  assert(blocks.len > 0, "blocks is empty! but we got EndBlock")
  var b = blocks.pop
  # while b.name == "BlockStarts": b = blocks.pop # until we have an actual construct.
  echo "-- End of block " & b.name

# import create


var currentConstruct* = newSeq[Block]()

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
