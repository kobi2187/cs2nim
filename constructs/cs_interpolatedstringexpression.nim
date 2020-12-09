import ../types, uuids, options
type CsInterpolatedStringExpression* = ref object of CsObject #TODO(type:CsInterpolatedStringExpression)

proc newCs*(t: typedesc[CsInterpolatedStringExpression]; name: string): CsInterpolatedStringExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsInterpolatedStringExpression)

proc extract*(t: typedesc[CsInterpolatedStringExpression]; info: Info): CsInterpolatedStringExpression = discard #TODO(extract:CsInterpolatedStringExpression)

proc add*(parent: var CsInterpolatedStringExpression; item: Dummy) =
  discard # TODO(add:CsInterpolatedStringExpression)
  # item.parentId = parent.id
proc add*(parent: var CsInterpolatedStringExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsInterpolatedStringExpression): string = discard #TODO(gen:CsInterpolatedStringExpression)
