import ../types
type CsReturnStatement* = ref object of CsObject #TODO(type:CsReturnStatement)

proc newCs*(t: typedesc[CsReturnStatement]; name: string): CsReturnStatement =
  new result #TODO(create:CsReturnStatement)

proc extract*(t: typedesc[CsReturnStatement]; info: Info): CsReturnStatement = discard #TODO(extract:CsReturnStatement)

proc add*(parent: var Dummy; item: CsReturnStatement) = discard # TODO(add:CsReturnStatement)

proc gen*(c: var CsReturnStatement): string = discard #TODO(gen:CsReturnStatement)
