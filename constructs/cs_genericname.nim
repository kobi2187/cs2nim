import ../types, uuids, options
type CsGenericName* = ref object of CsObject #TODO(type:CsGenericName)

proc newCs*(t: typedesc[CsGenericName]; name: string): CsGenericName =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsGenericName)

proc extract*(t: typedesc[CsGenericName]; info: Info): CsGenericName = discard #TODO(extract:CsGenericName)

proc add*(parent: var CsGenericName; item: Dummy) =
  discard # TODO(add:CsGenericName)
  # item.parentId = parent.id
proc add*(parent: var CsGenericName; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsGenericName): string = discard #TODO(gen:CsGenericName)
