import ../types
type CsExpressionStatement* = ref object of CsObject #TODO(type:CsExpressionStatement)

proc newCs*(t: typedesc[CsExpressionStatement]; name: string): CsExpressionStatement =
  new result #TODO(create:CsExpressionStatement)

proc extract*(t: typedesc[CsExpressionStatement]; info: Info): CsExpressionStatement = discard #TODO(extract:CsExpressionStatement)

proc add*(parent: var Dummy; item: CsExpressionStatement) = discard # TODO(add:CsExpressionStatement)

proc gen*(c: var CsExpressionStatement): string = discard #TODO(gen:CsExpressionStatement)
