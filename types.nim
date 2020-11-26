# types.nim

# import tables
import json

type Dummy* = object

type Info* = ref object
  essentials*: seq[string]
  extras*: seq[string]
  declName*: string

import strutils
proc `$`*(info: Info): string =
  let x = [info.declName, $info.essentials, $info.extras]
  result = "Info: " & x.join("\n")

type CsObject* = object of RootRef
  line: JsonNode
  src: string

type Module* = object
  name*: string
  output*: string

proc jsonWithoutSource*(n: JsonNode): JsonNode =
  var p = n.deepCopy
  p.delete("Source")
  result = p

# possibly redundant. haven't yet used:
type Construct* = concept T, Parent
  proc add*(parent: var Parent; item: T)
  proc extract*(t: typedesc[T]; info: Info): T
  proc newCs*(t: typedesc[T]; a, b, c, d: auto): T
