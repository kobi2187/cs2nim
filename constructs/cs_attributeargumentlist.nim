import ../types
type CsAttributeArgumentList* = ref object of CsObject #TODO(type:CsAttributeArgumentList)

proc newCs*(t: typedesc[CsAttributeArgumentList]; name: string): CsAttributeArgumentList =
  new result #TODO(create:CsAttributeArgumentList)

proc extract*(t: typedesc[CsAttributeArgumentList]; info: Info): CsAttributeArgumentList = discard #TODO(extract:CsAttributeArgumentList)

proc add*(parent: var CsAttributeArgumentList; item: Dummy) = discard # TODO(add:CsAttributeArgumentList)

proc gen*(c: var CsAttributeArgumentList): string = discard #TODO(gen:CsAttributeArgumentList)
