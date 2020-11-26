import ../types
type CsThrowStatement* = ref object of CsObject #TODO(type:CsThrowStatement)

proc newCs*(t: typedesc[CsThrowStatement]; name: string): CsThrowStatement =
  new result #TODO(create:CsThrowStatement)

proc extract*(t: typedesc[CsThrowStatement]; info: Info): CsThrowStatement = discard #TODO(extract:CsThrowStatement)

proc add*(parent: var Dummy; item: CsThrowStatement) = discard # TODO(add:CsThrowStatement)

proc gen*(c: var CsThrowStatement): string = discard #TODO(gen:CsThrowStatement)
