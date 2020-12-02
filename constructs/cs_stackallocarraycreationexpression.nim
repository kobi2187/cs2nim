import ../types
type CsStackAllocArrayCreationExpression* = ref object of CsObject #TODO(type:CsStackAllocArrayCreationExpression)

proc newCs*(t: typedesc[CsStackAllocArrayCreationExpression]; name: string): CsStackAllocArrayCreationExpression =
  new result #TODO(create:CsStackAllocArrayCreationExpression)

proc extract*(t: typedesc[CsStackAllocArrayCreationExpression]; info: Info): CsStackAllocArrayCreationExpression = discard #TODO(extract:CsStackAllocArrayCreationExpression)

proc add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy) = discard # TODO(add:CsStackAllocArrayCreationExpression)

proc gen*(c: var CsStackAllocArrayCreationExpression): string = discard #TODO(gen:CsStackAllocArrayCreationExpression)
