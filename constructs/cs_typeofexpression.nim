import ../types, uuids, options

type CsTypeOfExpression* = ref object of CsObject #TODO(type:CsTypeOfExpression)

proc newCs*(t: typedesc[CsTypeOfExpression]; name: string): CsTypeOfExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTypeOfExpression)

proc extract*(t: typedesc[CsTypeOfExpression]; info: Info): CsTypeOfExpression = discard #TODO(extract:CsTypeOfExpression)

proc add*(parent: var CsTypeOfExpression; item: Dummy) =
  discard # TODO(add:CsTypeOfExpression)
  # item.parentId = parent.id
proc add*(parent: var CsTypeOfExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeOfExpression): string = discard #TODO(gen:CsTypeOfExpression)
