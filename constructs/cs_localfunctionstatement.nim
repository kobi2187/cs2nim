import ../types, ../state_utils, uuids, options
type CsLocalFunctionStatement* = ref object of CsObject #TODO(type:CsLocalFunctionStatement)

proc newCs*(t: typedesc[CsLocalFunctionStatement]; name: string): CsLocalFunctionStatement =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsLocalFunctionStatement)

proc extract*(t: typedesc[CsLocalFunctionStatement]; info: Info): CsLocalFunctionStatement = discard #TODO(extract:CsLocalFunctionStatement)

proc add*(parent: var CsLocalFunctionStatement; item: Dummy) =
  discard # TODO(add:CsLocalFunctionStatement)
  # item.parentId = parent.id
# proc add*(parent: var CsLocalFunctionStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLocalFunctionStatement): string = discard #TODO(gen:CsLocalFunctionStatement)
