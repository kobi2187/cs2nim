import ../types, uuids, options, cs_parameter
type CsParameterList* = ref object of CsObject
  parameters*: seq[CsParameter]

proc newCs*(t: typedesc[CsParameterList]): CsParameterList =
  new result # start empty.
  result.id = uuids.genUUID().some

proc extract*(t: typedesc[CsParameterList]; info: Info): CsParameterList =
  result = newCs(CsParameterList)

proc add*(parent: var CsParameterList; item: CsParameter) =
  item.parentId = parent.id
  parent.parameters.add item

import sequtils, strutils
proc gen*(p: CsParameterList): string =
  result = p.parameters.mapIt(it.gen()).join("; ")
