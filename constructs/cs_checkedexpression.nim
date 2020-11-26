import ../types
type CsCheckedExpression* = ref object of CsObject #TODO(type:CsCheckedExpression)

proc newCs*(t: typedesc[CsCheckedExpression]; name: string): CsCheckedExpression =
  new result #TODO(create:CsCheckedExpression)

proc extract*(t: typedesc[CsCheckedExpression]; info: Info): CsCheckedExpression = discard #TODO(extract:CsCheckedExpression)

proc add*(parent: var Dummy; item: CsCheckedExpression) = discard # TODO(add:CsCheckedExpression)

proc gen*(c: var CsCheckedExpression): string = discard #TODO(gen:CsCheckedExpression)
