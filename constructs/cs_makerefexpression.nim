import ../types
type CsMakeRefExpression* = ref object of CsObject #TODO(type:CsMakeRefExpression)

proc newCs*(t: typedesc[CsMakeRefExpression]; name: string): CsMakeRefExpression =
  new result #TODO(create:CsMakeRefExpression)

proc extract*(t: typedesc[CsMakeRefExpression]; info: Info): CsMakeRefExpression = discard #TODO(extract:CsMakeRefExpression)

proc add*(parent: var Dummy; item: CsMakeRefExpression) = discard # TODO(add:CsMakeRefExpression)

proc gen*(c: var CsMakeRefExpression): string = discard #TODO(gen:CsMakeRefExpression)
