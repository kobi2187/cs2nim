import ../types, uuids, options

type CsSimpleBaseType* = ref object of CsObject #TODO(type:CsSimpleBaseType)

proc newCs*(t: typedesc[CsSimpleBaseType]; name: string): CsSimpleBaseType =
  new result
  result.id = uuids.genUUID #TODO(create:CsSimpleBaseType)

proc extract*(t: typedesc[CsSimpleBaseType]; info: Info): CsSimpleBaseType = discard #TODO(extract:CsSimpleBaseType)

proc add*(parent: var CsSimpleBaseType; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsSimpleBaseType; item: Dummy) =
  discard # TODO(add:CsSimpleBaseType)
  # item.parentId = parent.id

proc gen*(c: var CsSimpleBaseType): string = discard #TODO(gen:CsSimpleBaseType)
