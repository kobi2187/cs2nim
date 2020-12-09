import ../types, uuids, options
type CsGlobalStatement* = ref object of CsObject #TODO(type:CsGlobalStatement)

proc newCs*(t: typedesc[CsGlobalStatement]; name: string): CsGlobalStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsGlobalStatement)

proc extract*(t: typedesc[CsGlobalStatement]; info: Info): CsGlobalStatement = discard #TODO(extract:CsGlobalStatement)

proc add*(parent: var CsGlobalStatement; item: Dummy) =
  discard # TODO(add:CsGlobalStatement)
  # item.parentId = parent.id
proc add*(parent: var CsGlobalStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGlobalStatement): string = discard #TODO(gen:CsGlobalStatement)
