import ../types
type CsAssignmentExpression* = ref object of CsObject #TODO(type:CsAssignmentExpression)

proc newCs*(t: typedesc[CsAssignmentExpression]; name: string): CsAssignmentExpression =
  new result #TODO(create:CsAssignmentExpression)

proc extract*(t: typedesc[CsAssignmentExpression]; info: Info): CsAssignmentExpression = discard #TODO(extract:CsAssignmentExpression)

proc add*(parent: var CsAssignmentExpression; item: Dummy) = discard # TODO(add:CsAssignmentExpression)

proc gen*(c: var CsAssignmentExpression): string = discard #TODO(gen:CsAssignmentExpression)
