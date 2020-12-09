import ../types, uuids, options
type CsAssignmentExpression* = ref object of CsObject #TODO(type:CsAssignmentExpression)

proc newCs*(t: typedesc[CsAssignmentExpression]; name: string): CsAssignmentExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsAssignmentExpression)

proc extract*(t: typedesc[CsAssignmentExpression]; info: Info): CsAssignmentExpression = discard #TODO(extract:CsAssignmentExpression)

proc add*(parent: var CsAssignmentExpression; item: Dummy) =
  discard # TODO(add:CsAssignmentExpression)
  # item.parentId = parent.id
proc add*(parent: var CsAssignmentExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsAssignmentExpression): string = discard #TODO(gen:CsAssignmentExpression)
