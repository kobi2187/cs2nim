type CsDefaultExpression* = ref object of CsObject #TODO(type:CsDefaultExpression)

proc newCs*(t: typedesc[CsDefaultExpression]; name: string): CsDefaultExpression =
  new result #TODO(create:CsDefaultExpression)

proc extract*(t: typedesc[CsDefaultExpression]; info: Info): CsDefaultExpression = discard #TODO(extract:CsDefaultExpression)

proc add*(parent: var Dummy; item: CsDefaultExpression) = discard # TODO(add:CsDefaultExpression)

proc gen*(c: var CsDefaultExpression): string = discard #TODO(gen:CsDefaultExpression)