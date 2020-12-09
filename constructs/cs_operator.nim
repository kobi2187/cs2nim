import ../types, uuids, options
type CsOperator* = ref object of CsObject #TODO(type:CsOperator)

proc newCs*(t: typedesc[CsOperator]; name: string): CsOperator =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsOperator)

proc extract*(t: typedesc[CsOperator]; info: Info): CsOperator = discard #TODO(extract:CsOperator)

proc add*(parent: var CsOperator; item: Dummy) =
  discard # TODO(add:CsOperator)
  # item.parentId = parent.id
proc add*(parent: var CsOperator; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOperator): string = discard #TODO(gen:CsOperator)
