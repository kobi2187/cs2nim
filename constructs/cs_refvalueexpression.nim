import ../types, uuids, options
type CsRefValueExpression* = ref object of CsObject #TODO(type:CsRefValueExpression)

proc newCs*(t: typedesc[CsRefValueExpression]; name: string): CsRefValueExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsRefValueExpression)

proc extract*(t: typedesc[CsRefValueExpression]; info: Info): CsRefValueExpression = discard #TODO(extract:CsRefValueExpression)

proc add*(parent: var CsRefValueExpression; item: Dummy) =
  discard # TODO(add:CsRefValueExpression)
  # item.parentId = parent.id
proc add*(parent: var CsRefValueExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsRefValueExpression): string = discard #TODO(gen:CsRefValueExpression)
