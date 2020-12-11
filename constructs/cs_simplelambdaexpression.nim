import ../types, ../state_utils, uuids, options
type CsSimpleLambdaExpression* = ref object of CsObject #TODO(type:CsSimpleLambdaExpression)

proc newCs*(t: typedesc[CsSimpleLambdaExpression]; name: string): CsSimpleLambdaExpression =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsSimpleLambdaExpression)

proc extract*(t: typedesc[CsSimpleLambdaExpression]; info: Info): CsSimpleLambdaExpression = discard #TODO(extract:CsSimpleLambdaExpression)

proc add*(parent: var CsSimpleLambdaExpression; item: Dummy) =
  discard # TODO(add:CsSimpleLambdaExpression)
  # item.parentId = parent.id
# proc add*(parent: var CsSimpleLambdaExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsSimpleLambdaExpression): string = discard #TODO(gen:CsSimpleLambdaExpression)
