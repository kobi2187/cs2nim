type CsOrdering* = ref object of CsObject #TODO(type:CsOrdering)

proc newCs*(t: typedesc[CsOrdering]; name: string): CsOrdering =
  new result #TODO(create:CsOrdering)

proc extract*(t: typedesc[CsOrdering]; info: Info): CsOrdering = discard #TODO(extract:CsOrdering)

proc add*(parent: var Dummy; item: CsOrdering) = discard # TODO(add:CsOrdering)

proc gen*(c: var CsOrdering): string = discard #TODO(gen:CsOrdering)