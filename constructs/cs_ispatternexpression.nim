import ../types, uuids, options
type CsIsPatternExpression* = ref object of CsObject #TODO(type:CsIsPatternExpression)

proc newCs*(t: typedesc[CsIsPatternExpression]; name: string): CsIsPatternExpression =
  new result
  result.id = uuids.genUUID #TODO(create:CsIsPatternExpression)

proc extract*(t: typedesc[CsIsPatternExpression]; info: Info): CsIsPatternExpression = discard #TODO(extract:CsIsPatternExpression)

proc add*(parent: var CsIsPatternExpression; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsIsPatternExpression; item: Dummy) =
  discard # TODO(add:CsIsPatternExpression)
  # item.parentId = parent.id

proc gen*(c: var CsIsPatternExpression): string = discard #TODO(gen:CsIsPatternExpression)
