import ../types, uuids, options
type CsArgumentList* = ref object of CsObject
  args*: seq[string]
  # args*: seq[CsArgument] # TODO: probably needed, when arguments are more complex. need to see the flow.

import sequtils, strutils
proc newCs*(t: typedesc[CsArgumentList]; args: seq[string]): CsArgumentList =
  new result
  result.id = genUUID().some
  result.args = args.mapIt(it.strip)

proc extract*(t: typedesc[CsArgumentList]; info: Info): CsArgumentList =
  result = newCs(CsArgumentList, info.essentials[0].split(","))

# proc add*(parent: var CsArgumentList; item: Dummy, data:AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsArgumentList; item: Dummy) =
#   item.parentId = parent.id
  discard

proc gen*(c: var CsArgumentList): string =
  result = c.args.join(", ")
