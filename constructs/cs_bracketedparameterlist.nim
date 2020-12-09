import ../types, uuids, options
type CsBracketedParameterList* = ref object of CsObject #TODO(type:CsBracketedParameterList)

proc newCs*(t: typedesc[CsBracketedParameterList]; name: string): CsBracketedParameterList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBracketedParameterList)

proc extract*(t: typedesc[CsBracketedParameterList]; info: Info): CsBracketedParameterList = discard #TODO(extract:CsBracketedParameterList)

proc add*(parent: var CsBracketedParameterList; item: Dummy) =
  discard # TODO(add:CsBracketedParameterList)
  # item.parentId = parent.id
proc add*(parent: var CsBracketedParameterList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBracketedParameterList): string = discard #TODO(gen:CsBracketedParameterList)
