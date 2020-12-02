import ../types
type CsLocalFunctionStatement* = ref object of CsObject #TODO(type:CsLocalFunctionStatement)

proc newCs*(t: typedesc[CsLocalFunctionStatement]; name: string): CsLocalFunctionStatement =
  new result #TODO(create:CsLocalFunctionStatement)

proc extract*(t: typedesc[CsLocalFunctionStatement]; info: Info): CsLocalFunctionStatement = discard #TODO(extract:CsLocalFunctionStatement)

proc add*(parent: var CsLocalFunctionStatement; item: Dummy) = discard # TODO(add:CsLocalFunctionStatement)

proc gen*(c: var CsLocalFunctionStatement): string = discard #TODO(gen:CsLocalFunctionStatement)
