import ../types, uuids, options
type CsForEachVariableStatement* = ref object of CsObject #TODO(type:CsForEachVariableStatement)

proc newCs*(t: typedesc[CsForEachVariableStatement]; name: string): CsForEachVariableStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsForEachVariableStatement)

proc extract*(t: typedesc[CsForEachVariableStatement]; info: Info): CsForEachVariableStatement = discard #TODO(extract:CsForEachVariableStatement)

proc add*(parent: var CsForEachVariableStatement; item: Dummy) =
  discard # TODO(add:CsForEachVariableStatement)
  # item.parentId = parent.id

proc gen*(c: var CsForEachVariableStatement): string = discard #TODO(gen:CsForEachVariableStatement)
