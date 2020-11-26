type CsQueryExpression* = ref object of CsObject #TODO(type:CsQueryExpression)

proc newCs*(t: typedesc[CsQueryExpression]; name: string): CsQueryExpression =
  new result #TODO(create:CsQueryExpression)

proc extract*(t: typedesc[CsQueryExpression]; info: Info): CsQueryExpression = discard #TODO(extract:CsQueryExpression)

proc add*(parent: var Dummy; item: CsQueryExpression) = discard # TODO(add:CsQueryExpression)

proc gen*(c: var CsQueryExpression): string = discard #TODO(gen:CsQueryExpression)