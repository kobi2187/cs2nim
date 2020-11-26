type CsRefTypeExpression* = ref object of CsObject #TODO(type:CsRefTypeExpression)

proc newCs*(t: typedesc[CsRefTypeExpression]; name: string): CsRefTypeExpression =
  new result #TODO(create:CsRefTypeExpression)

proc extract*(t: typedesc[CsRefTypeExpression]; info: Info): CsRefTypeExpression = discard #TODO(extract:CsRefTypeExpression)

proc add*(parent: var Dummy; item: CsRefTypeExpression) = discard # TODO(add:CsRefTypeExpression)

proc gen*(c: var CsRefTypeExpression): string = discard #TODO(gen:CsRefTypeExpression)