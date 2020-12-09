import ../types, uuids, options
type CsLabeledStatement* = ref object of CsObject #TODO(type:CsLabeledStatement)

proc newCs*(t: typedesc[CsLabeledStatement]; name: string): CsLabeledStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsLabeledStatement)

proc extract*(t: typedesc[CsLabeledStatement]; info: Info): CsLabeledStatement = discard #TODO(extract:CsLabeledStatement)

proc add*(parent: var CsLabeledStatement; item: Dummy) =
  discard # TODO(add:CsLabeledStatement)
  # item.parentId = parent.id
proc add*(parent: var CsLabeledStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsLabeledStatement): string = discard #TODO(gen:CsLabeledStatement)
