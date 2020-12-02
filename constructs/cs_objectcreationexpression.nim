import ../types
type CsObjectCreationExpression* = ref object of CsObject #TODO(type:CsObjectCreationExpression)

proc newCs*(t: typedesc[CsObjectCreationExpression]; name: string): CsObjectCreationExpression =
  new result #TODO(create:CsObjectCreationExpression)

proc extract*(t: typedesc[CsObjectCreationExpression]; info: Info): CsObjectCreationExpression = discard #TODO(extract:CsObjectCreationExpression)

proc add*(parent: var CsObjectCreationExpression; item: Dummy) = discard # TODO(add:CsObjectCreationExpression)

proc gen*(c: var CsObjectCreationExpression): string = discard #TODO(gen:CsObjectCreationExpression)
