import ../types
type CsUsingStatement* = ref object of CsObject #TODO(type:CsUsingStatement)

proc newCs*(t: typedesc[CsUsingStatement]; name: string): CsUsingStatement =
  new result #TODO(create:CsUsingStatement)

proc extract*(t: typedesc[CsUsingStatement]; info: Info): CsUsingStatement = discard #TODO(extract:CsUsingStatement)

proc add*(parent: var Dummy; item: CsUsingStatement) = discard # TODO(add:CsUsingStatement)

proc gen*(c: var CsUsingStatement): string = discard #TODO(gen:CsUsingStatement)
