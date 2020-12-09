import ../types, uuids, options
type CsArrayCreationExpression* = ref object of CsObject #TODO(type:CsArrayCreationExpression)

proc newCs*(t: typedesc[CsArrayCreationExpression]; name: string): CsArrayCreationExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsArrayCreationExpression)

proc extract*(t: typedesc[CsArrayCreationExpression]; info: Info): CsArrayCreationExpression = discard #TODO(extract:CsArrayCreationExpression)

proc add*(parent: var CsArrayCreationExpression; item: Dummy) =
  discard # TODO(add:CsArrayCreationExpression)
  # item.parentId = parent.id
proc add*(parent: var CsArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrayCreationExpression): string = discard #TODO(gen:CsArrayCreationExpression)
