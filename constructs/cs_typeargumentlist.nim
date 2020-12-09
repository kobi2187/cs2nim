import ../types, uuids, options
type CsTypeArgumentList* = ref object of CsObject #TODO(type:CsTypeArgumentList)

proc newCs*(t: typedesc[CsTypeArgumentList]; name: string): CsTypeArgumentList =
  new result
  result.id = uuids.genUUID #TODO(create:CsTypeArgumentList)

proc extract*(t: typedesc[CsTypeArgumentList]; info: Info): CsTypeArgumentList = discard #TODO(extract:CsTypeArgumentList)

proc add*(parent: var CsTypeArgumentList; item: Dummy) =
  discard # TODO(add:CsTypeArgumentList)
  # item.parentId = parent.id
proc add*(parent: var CsTypeArgumentList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeArgumentList): string = discard #TODO(gen:CsTypeArgumentList)
