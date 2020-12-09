import ../types, uuids, options
type CsIncompleteMember* = ref object of CsObject #TODO(type:CsIncompleteMember)

proc newCs*(t: typedesc[CsIncompleteMember]; name: string): CsIncompleteMember =
  new result
  result.id = uuids.genUUID #TODO(create:CsIncompleteMember)

proc extract*(t: typedesc[CsIncompleteMember]; info: Info): CsIncompleteMember = discard #TODO(extract:CsIncompleteMember)

proc add*(parent: var CsIncompleteMember; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsIncompleteMember; item: Dummy) =
  discard # TODO(add:CsIncompleteMember)
  # item.parentId = parent.id

proc gen*(c: var CsIncompleteMember): string = discard #TODO(gen:CsIncompleteMember)
