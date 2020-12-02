import ../types
type CsGotoStatement* = ref object of CsObject #TODO(type:CsGotoStatement)

proc newCs*(t: typedesc[CsGotoStatement]; name: string): CsGotoStatement =
  new result #TODO(create:CsGotoStatement)

proc extract*(t: typedesc[CsGotoStatement]; info: Info): CsGotoStatement = discard #TODO(extract:CsGotoStatement)

proc add*(parent: var CsGotoStatement; item: Dummy) = discard # TODO(add:CsGotoStatement)

proc gen*(c: var CsGotoStatement): string = discard #TODO(gen:CsGotoStatement)
