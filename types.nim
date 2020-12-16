# types.nim

# import tables
import json



# pass this object instead of many arguments
# to create the same api.

type Info* = ref object
  declName*: string
  essentials*: seq[string]
  extras*: seq[string]

import strutils
proc `$`*(info: Info): string =
  let x = [info.declName, $info.essentials, $info.extras]
  result = "Info: " & x.join(";; ")

import uuids, options
type CsObject* = object of RootRef
  name*: string
  typ*: string
  id*: Option[UUID]
  # parentId*: Option[UUID]
  # line*: JsonNode
  src*: string
  isComplete*: bool

type Dummy* = ref object of CsObject

type Module* = object
  name*: string
  output*: string

proc jsonWithoutSource*(n: JsonNode): JsonNode =
  var p = n.deepCopy
  p.delete("Source")
  result = p

# for constructs in a method body.
type BodyExpr* = ref object of CsObject # RootObj
                                        #  name*: string
  ttype*: string
method gen*(e: BodyExpr): string {.base.} =
  raise newException(Exception, "Not Implemented for " & e.ttype) #& " " & e.name)

# # possibly redundant. haven't yet used:
# type CConstruct* = concept T, Parent
#   proc add*(parent: var Parent; item: T; data: AllNeededData)
#   proc add*(parent: var Parent; item: T)
#   proc extract*(t: typedesc[T]; info: Info): T
#   proc newCs*(t: typedesc[T]; a, b, c, d: auto): T
#   # proc handle*(t: typedesc[T]; root: var CsRoot; info: Info)
#   # will it create a circular dependency? maybe. try.


