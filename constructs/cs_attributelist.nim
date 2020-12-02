import ../types

type CsAttributeList* = ref object of CsObject #TODO(type:CsAttributeList)

proc newCs*(t: typedesc[CsAttributeList]; name: string): CsAttributeList =
  new result #TODO(create:CsAttributeList)

proc extract*(t: typedesc[CsAttributeList]; info: Info): CsAttributeList = discard #TODO(extract:CsAttributeList)

proc add*(parent: var CsAttributeList; item: Dummy) = discard # TODO(add:CsAttributeList)

proc gen*(c: var CsAttributeList): string = discard #TODO(gen:CsAttributeList)
