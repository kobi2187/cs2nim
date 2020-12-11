import ../types, ../state_utils, uuids, options
type CsAccessorList* = ref object of CsObject #TODO(type:CsAccessorList)

proc newCs*(t: typedesc[CsAccessorList]; name: string): CsAccessorList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAccessorList)

proc extract*(t: typedesc[CsAccessorList]; info: Info): CsAccessorList = discard #TODO(extract:CsAccessorList)

proc add*(parent: var CsAccessorList; item: Dummy) =
  discard # TODO(add:CsAccessorList)
  # item.parentId = parent.id
# proc add*(parent: var CsAccessorList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO


proc gen*(c: var CsAccessorList): string = discard #TODO(gen:CsAccessorList)
