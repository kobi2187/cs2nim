import ../types
type CsSizeOfExpression* = ref object of CsObject #TODO(type:CsSizeOfExpression)

proc newCs*(t: typedesc[CsSizeOfExpression]; name: string): CsSizeOfExpression =
  new result #TODO(create:CsSizeOfExpression)

proc extract*(t: typedesc[CsSizeOfExpression]; info: Info): CsSizeOfExpression = discard #TODO(extract:CsSizeOfExpression)

proc add*(parent: var CsSizeOfExpression; item: Dummy) = discard # TODO(add:CsSizeOfExpression)

proc gen*(c: var CsSizeOfExpression): string = discard #TODO(gen:CsSizeOfExpression)
