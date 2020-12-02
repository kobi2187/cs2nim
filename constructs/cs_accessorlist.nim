import ../types
type CsAccessorList* = ref object of CsObject #TODO(type:CsAccessorList)

proc newCs*(t: typedesc[CsAccessorList]; name: string): CsAccessorList =
  new result #TODO(create:CsAccessorList)

proc extract*(t: typedesc[CsAccessorList]; info: Info): CsAccessorList = discard #TODO(extract:CsAccessorList)

proc add*(parent: var CsAccessorList; item: Dummy) = discard # TODO(add:CsAccessorList)


proc gen*(c: var CsAccessorList): string = discard #TODO(gen:CsAccessorList)
