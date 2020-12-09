import ../types, uuids, options
type CsDelegate* = ref object of CsObject #TODO(type:CsDelegate)

proc newCs*(t: typedesc[CsDelegate]; name: string): CsDelegate =
  new result
  result.id = uuids.genUUID #TODO(create:CsDelegate)

proc extract*(t: typedesc[CsDelegate]; info: Info): CsDelegate = discard #TODO(extract:CsDelegate)

proc add*(parent: var CsDelegate; item: Dummy) =
  discard # TODO(add:CsDelegate)
  # item.parentId = parent.id
proc add*(parent: var CsDelegate; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDelegate): string = discard #TODO(gen:CsDelegate)
