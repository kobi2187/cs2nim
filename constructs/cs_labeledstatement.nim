import ../types
type CsLabeledStatement* = ref object of CsObject #TODO(type:CsLabeledStatement)

proc newCs*(t: typedesc[CsLabeledStatement]; name: string): CsLabeledStatement =
  new result #TODO(create:CsLabeledStatement)

proc extract*(t: typedesc[CsLabeledStatement]; info: Info): CsLabeledStatement = discard #TODO(extract:CsLabeledStatement)

proc add*(parent: var CsLabeledStatement; item: Dummy) = discard # TODO(add:CsLabeledStatement)

proc gen*(c: var CsLabeledStatement): string = discard #TODO(gen:CsLabeledStatement)
