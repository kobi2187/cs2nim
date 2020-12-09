import ../types, uuids, options
type CsAttribute* = ref object of CsObject #TODO(type:CsAttribute)

proc newCs*(t: typedesc[CsAttribute]; name: string): CsAttribute =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAttribute)

proc extract*(t: typedesc[CsAttribute]; info: Info): CsAttribute = discard #TODO(extract:CsAttribute)

proc add*(parent: var CsAttribute; item: Dummy) =
  discard # TODO(add:CsAttribute)
  # item.parentId = parent.id
proc add*(parent: var CsAttribute; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAttribute): string = discard #TODO(gen:CsAttribute)
