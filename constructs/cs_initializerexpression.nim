import ../types, uuids, options
type CsInitializerExpression* = ref object of CsObject #TODO(type:CsInitializerExpression)

proc newCs*(t: typedesc[CsInitializerExpression]; name: string): CsInitializerExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsInitializerExpression)

proc extract*(t: typedesc[CsInitializerExpression]; info: Info): CsInitializerExpression = discard #TODO(extract:CsInitializerExpression)

proc add*(parent: var CsInitializerExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsInitializerExpression; item: Dummy) =
  discard # TODO(add:CsInitializerExpression)
  # item.parentId = parent.id

proc gen*(c: var CsInitializerExpression): string = discard #TODO(gen:CsInitializerExpression)
