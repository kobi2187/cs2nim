import ../types, uuids, options
type CsCheckedExpression* = ref object of CsObject #TODO(type:CsCheckedExpression)

proc newCs*(t: typedesc[CsCheckedExpression]; name: string): CsCheckedExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsCheckedExpression)

proc extract*(t: typedesc[CsCheckedExpression]; info: Info): CsCheckedExpression = discard #TODO(extract:CsCheckedExpression)

proc add*(parent: var CsCheckedExpression; item: Dummy) =
  discard # TODO(add:CsCheckedExpression)
  # item.parentId = parent.id
proc add*(parent: var CsCheckedExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsCheckedExpression): string = discard #TODO(gen:CsCheckedExpression)
