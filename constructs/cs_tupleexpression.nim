import ../types
type CsTupleExpression* = ref object of CsObject #TODO(type:CsTupleExpression)

proc newCs*(t: typedesc[CsTupleExpression]; name: string): CsTupleExpression =
  new result #TODO(create:CsTupleExpression)

proc extract*(t: typedesc[CsTupleExpression]; info: Info): CsTupleExpression = discard #TODO(extract:CsTupleExpression)

proc add*(parent: var CsTupleExpression; item: Dummy) = discard # TODO(add:CsTupleExpression)

proc gen*(c: var CsTupleExpression): string = discard #TODO(gen:CsTupleExpression)
