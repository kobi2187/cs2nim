import ../types, ../state_utils, uuids, options
type CsAttributeArgumentList* = ref object of CsObject #TODO(type:CsAttributeArgumentList)

proc newCs*(t: typedesc[CsAttributeArgumentList]; name: string): CsAttributeArgumentList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAttributeArgumentList)

proc extract*(t: typedesc[CsAttributeArgumentList]; info: Info): CsAttributeArgumentList = discard #TODO(extract:CsAttributeArgumentList)

proc add*(parent: var CsAttributeArgumentList; item: Dummy) =
  discard # TODO(add:CsAttributeArgumentList)
  # item.parentId = parent.id
# proc add*(parent: var CsAttributeArgumentList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttributeArgumentList): string = discard #TODO(gen:CsAttributeArgumentList)
