import ../types, uuids, options, cs_parameter
# from ../state_utils import AllNeededData

type CsParameterList* = ref object of CsObject
  parameters*: seq[CsParameter]

proc newCs*(t: typedesc[CsParameterList]): CsParameterList =
  new result # start empty.
  result.typ = $typeof(t)
  result.id = uuids.genUUID().some

proc extract*(t: typedesc[CsParameterList]; info: Info): CsParameterList =
  result = newCs(CsParameterList)

proc add*(parent: var CsParameterList; item: CsParameter) =
  item.parentId = parent.id
  parent.parameters.add item

# proc add*(parent: var CsParameterList; item: CsParameter; data: AllNeededData) = parent.add(item) # TODO

import sequtils, strutils
proc gen*(p: CsParameterList): string =
  result = p.parameters.mapIt(it.gen()).join("; ")
