type CsInterpolatedStringExpression* = ref object of CsObject #TODO(type:CsInterpolatedStringExpression)

proc newCs*(t: typedesc[CsInterpolatedStringExpression]; name: string): CsInterpolatedStringExpression =
  new result #TODO(create:CsInterpolatedStringExpression)

proc extract*(t: typedesc[CsInterpolatedStringExpression]; info: Info): CsInterpolatedStringExpression = discard #TODO(extract:CsInterpolatedStringExpression)

proc add*(parent: var Dummy; item: CsInterpolatedStringExpression) = discard # TODO(add:CsInterpolatedStringExpression)

proc gen*(c: var CsInterpolatedStringExpression): string = discard #TODO(gen:CsInterpolatedStringExpression)