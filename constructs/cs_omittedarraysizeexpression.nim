import ../types
type CsOmittedArraySizeExpression* = ref object of CsObject #TODO(type:CsOmittedArraySizeExpression)

proc newCs*(t: typedesc[CsOmittedArraySizeExpression]; name: string): CsOmittedArraySizeExpression =
  new result #TODO(create:CsOmittedArraySizeExpression)

proc extract*(t: typedesc[CsOmittedArraySizeExpression]; info: Info): CsOmittedArraySizeExpression = discard #TODO(extract:CsOmittedArraySizeExpression)

proc add*(parent: var CsOmittedArraySizeExpression; item: Dummy) = discard # TODO(add:CsOmittedArraySizeExpression)

proc gen*(c: var CsOmittedArraySizeExpression): string = discard #TODO(gen:CsOmittedArraySizeExpression)
