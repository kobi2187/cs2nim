import ../types, uuids, options
type CsNameEquals* = ref object of CsObject #TODO(type:CsNameEquals)

proc newCs*(t: typedesc[CsNameEquals]; name: string): CsNameEquals =
  new result
  result.id = uuids.genUUID #TODO(create:CsNameEquals)

proc extract*(t: typedesc[CsNameEquals]; info: Info): CsNameEquals = discard #TODO(extract:CsNameEquals)

proc add*(parent: var CsNameEquals; item: Dummy) =
  discard # TODO(add:CsNameEquals)
  # item.parentId = parent.id

proc gen*(c: var CsNameEquals): string = discard #TODO(gen:CsNameEquals)
