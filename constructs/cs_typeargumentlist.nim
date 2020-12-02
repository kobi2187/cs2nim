import ../types
type CsTypeArgumentList* = ref object of CsObject #TODO(type:CsTypeArgumentList)

proc newCs*(t: typedesc[CsTypeArgumentList]; name: string): CsTypeArgumentList =
  new result #TODO(create:CsTypeArgumentList)

proc extract*(t: typedesc[CsTypeArgumentList]; info: Info): CsTypeArgumentList = discard #TODO(extract:CsTypeArgumentList)

proc add*(parent: var CsTypeArgumentList; item: Dummy) = discard # TODO(add:CsTypeArgumentList)

proc gen*(c: var CsTypeArgumentList): string = discard #TODO(gen:CsTypeArgumentList)
