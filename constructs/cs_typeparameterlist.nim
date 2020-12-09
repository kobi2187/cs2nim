import ../types, uuids, options
type CsTypeParameterList* = ref object of CsObject #TODO(type:CsTypeParameterList)

proc newCs*(t: typedesc[CsTypeParameterList]; name: string): CsTypeParameterList =
  new result
  result.id = uuids.genUUID #TODO(create:CsTypeParameterList)

proc extract*(t: typedesc[CsTypeParameterList]; info: Info): CsTypeParameterList = discard #TODO(extract:CsTypeParameterList)

proc add*(parent: var CsTypeParameterList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsTypeParameterList; item: Dummy) =
  discard # TODO(add:CsTypeParameterList)
  # item.parentId = parent.id

proc gen*(c: var CsTypeParameterList): string = discard #TODO(gen:CsTypeParameterList)
