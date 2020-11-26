import ../types, cs_parameter
type CsParameterList* = ref object of CsObject
  parameters*: seq[CsParameter]

proc newCs*(t: typedesc[CsParameterList]): CsParameterList =
  new result # start empty.

proc extract*(t: typedesc[CsParameterList]; info: Info): CsParameterList =
  result = newCs(CsParameterList)

# proc add*(parent: var Dummy; item: CsParameterList) = discard # TODO(add:CsParameterList)
proc add*(parent: var CsParameterList; item: CsParameter) =
  parent.parameters.add item

import sequtils, strutils
proc gen*(p: CsParameterList): string =
  result = p.parameters.mapIt(it.gen()).join("; ")
