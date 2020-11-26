import ../types
type CsYieldStatement* = ref object of CsObject #TODO(type:CsYieldStatement)

proc newCs*(t: typedesc[CsYieldStatement]; name: string): CsYieldStatement =
  new result #TODO(create:CsYieldStatement)

proc extract*(t: typedesc[CsYieldStatement]; info: Info): CsYieldStatement = discard #TODO(extract:CsYieldStatement)

proc add*(parent: var Dummy; item: CsYieldStatement) = discard # TODO(add:CsYieldStatement)

proc gen*(c: var CsYieldStatement): string = discard #TODO(gen:CsYieldStatement)
