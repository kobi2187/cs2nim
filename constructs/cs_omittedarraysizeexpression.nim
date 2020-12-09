import ../types, uuids, options
type CsOmittedArraySizeExpression* = ref object of CsObject #TODO(type:CsOmittedArraySizeExpression)

proc newCs*(t: typedesc[CsOmittedArraySizeExpression]; name: string): CsOmittedArraySizeExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsOmittedArraySizeExpression)

proc extract*(t: typedesc[CsOmittedArraySizeExpression]; info: Info): CsOmittedArraySizeExpression = discard #TODO(extract:CsOmittedArraySizeExpression)

proc add*(parent: var CsOmittedArraySizeExpression; item: Dummy) =
  discard # TODO(add:CsOmittedArraySizeExpression)
  # item.parentId = parent.id
proc add*(parent: var CsOmittedArraySizeExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOmittedArraySizeExpression): string = discard #TODO(gen:CsOmittedArraySizeExpression)
