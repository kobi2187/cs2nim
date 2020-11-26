import ../types
type CsEmptyStatement* = ref object of CsObject #TODO(type:CsEmptyStatement)

proc newCs*(t: typedesc[CsEmptyStatement]; name: string): CsEmptyStatement =
  new result #TODO(create:CsEmptyStatement)

proc extract*(t: typedesc[CsEmptyStatement]; info: Info): CsEmptyStatement = discard #TODO(extract:CsEmptyStatement)

proc add*(parent: var Dummy; item: CsEmptyStatement) = discard # TODO(add:CsEmptyStatement)

proc gen*(c: var CsEmptyStatement): string = discard #TODO(gen:CsEmptyStatement)
