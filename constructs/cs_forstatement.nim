import ../types
type CsForStatement* = ref object of CsObject #TODO(type:CsForStatement)

proc newCs*(t: typedesc[CsForStatement]; name: string): CsForStatement =
  new result #TODO(create:CsForStatement)

proc extract*(t: typedesc[CsForStatement]; info: Info): CsForStatement = discard #TODO(extract:CsForStatement)

proc add*(parent: var CsForStatement; item: Dummy) = discard # TODO(add:CsForStatement)

proc gen*(c: var CsForStatement): string = discard #TODO(gen:CsForStatement)
