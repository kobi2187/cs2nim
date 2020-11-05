# common.nim
import stacks,sets
import json

import types 
type Info* = object
  essentials*:seq[string]
  extras*:seq[string]
  declName*:string

type Block* = object
  name*:string
  info*:Info

var blocks* = newStack[Block]()
# proc getBlockCount :int= blocks.len
proc endBlock*() = 
  if blocks.len>0:
    discard blocks.pop
var root* = CsRoot()


var currentConstruct*  = newSeq[Block]()

# declaration string as received from cs side.
let blockTypesTxt* = ["ClassDeclaration", "NamespaceDeclaration", "MethodDeclaration", "EnumDeclaration" ].toHashSet 

proc currentPath*(): seq[Block] = blocks.toSeq()  
