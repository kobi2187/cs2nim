import ../types
type CsIfStatement* = ref object of CsObject #TODO(type:CsIfStatement)

proc newCs*(t: typedesc[CsIfStatement]; name: string): CsIfStatement =
  new result #TODO(create:CsIfStatement)

proc extract*(t: typedesc[CsIfStatement]; info: Info): CsIfStatement = discard #TODO(extract:CsIfStatement)

proc add*(parent: var Dummy; item: CsIfStatement) = discard # TODO(add:CsIfStatement)

proc gen*(c: var CsIfStatement): string = discard #TODO(gen:CsIfStatement)
