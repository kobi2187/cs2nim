import ../types
type CsGlobalStatement* = ref object of CsObject #TODO(type:CsGlobalStatement)

proc newCs*(t: typedesc[CsGlobalStatement]; name: string): CsGlobalStatement =
  new result #TODO(create:CsGlobalStatement)

proc extract*(t: typedesc[CsGlobalStatement]; info: Info): CsGlobalStatement = discard #TODO(extract:CsGlobalStatement)

proc add*(parent: var Dummy; item: CsGlobalStatement) = discard # TODO(add:CsGlobalStatement)

proc gen*(c: var CsGlobalStatement): string = discard #TODO(gen:CsGlobalStatement)
