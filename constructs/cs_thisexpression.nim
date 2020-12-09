import ../types, uuids, options

type CsThisExpression* = ref object of CsObject #TODO(type:CsThisExpression)

proc newCs*(t: typedesc[CsThisExpression]; name: string): CsThisExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsThisExpression)

proc extract*(t: typedesc[CsThisExpression]; info: Info): CsThisExpression = discard #TODO(extract:CsThisExpression)

proc add*(parent: var CsThisExpression; item: Dummy) =
  discard # TODO(add:CsThisExpression)
  # item.parentId = parent.id
proc add*(parent: var CsThisExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsThisExpression): string = discard #TODO(gen:CsThisExpression)
