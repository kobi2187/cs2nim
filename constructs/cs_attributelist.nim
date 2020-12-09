import ../types, uuids, options

type CsAttributeList* = ref object of CsObject #TODO(type:CsAttributeList)

proc newCs*(t: typedesc[CsAttributeList]; name: string): CsAttributeList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAttributeList)

proc extract*(t: typedesc[CsAttributeList]; info: Info): CsAttributeList = discard #TODO(extract:CsAttributeList)

proc add*(parent: var CsAttributeList; item: Dummy) =
  discard # TODO(add:CsAttributeList)
  # item.parentId = parent.id

proc add*(parent: var CsAttributeList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc gen*(c: var CsAttributeList): string = discard #TODO(gen:CsAttributeList)
