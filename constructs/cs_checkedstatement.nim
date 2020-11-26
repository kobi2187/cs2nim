import ../types
type CsCheckedStatement* = ref object of CsObject #TODO(type:CsCheckedStatement)

proc newCs*(t: typedesc[CsCheckedStatement]; name: string): CsCheckedStatement =
  new result #TODO(create:CsCheckedStatement)

proc extract*(t: typedesc[CsCheckedStatement]; info: Info): CsCheckedStatement = discard #TODO(extract:CsCheckedStatement)

proc add*(parent: var Dummy; item: CsCheckedStatement) = discard # TODO(add:CsCheckedStatement)

proc gen*(c: var CsCheckedStatement): string = discard #TODO(gen:CsCheckedStatement)
