import ../types, uuids, options
type CsAttributeArgumentList* = ref object of CsObject #TODO(type:CsAttributeArgumentList)

proc newCs*(t: typedesc[CsAttributeArgumentList]; name: string): CsAttributeArgumentList =
  new result
  result.id = uuids.genUUID #TODO(create:CsAttributeArgumentList)

proc extract*(t: typedesc[CsAttributeArgumentList]; info: Info): CsAttributeArgumentList = discard #TODO(extract:CsAttributeArgumentList)

proc add*(parent: var CsAttributeArgumentList; item: Dummy) =
  discard # TODO(add:CsAttributeArgumentList)
  # item.parentId = parent.id

proc gen*(c: var CsAttributeArgumentList): string = discard #TODO(gen:CsAttributeArgumentList)
