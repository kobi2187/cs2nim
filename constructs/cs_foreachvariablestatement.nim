import ../types
type CsForEachVariableStatement* = ref object of CsObject #TODO(type:CsForEachVariableStatement)

proc newCs*(t: typedesc[CsForEachVariableStatement]; name: string): CsForEachVariableStatement =
  new result #TODO(create:CsForEachVariableStatement)

proc extract*(t: typedesc[CsForEachVariableStatement]; info: Info): CsForEachVariableStatement = discard #TODO(extract:CsForEachVariableStatement)

proc add*(parent: var Dummy; item: CsForEachVariableStatement) = discard # TODO(add:CsForEachVariableStatement)

proc gen*(c: var CsForEachVariableStatement): string = discard #TODO(gen:CsForEachVariableStatement)
