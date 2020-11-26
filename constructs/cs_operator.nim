import ../types
type CsOperator* = ref object of CsObject #TODO(type:CsOperator)

proc newCs*(t: typedesc[CsOperator]; name: string): CsOperator =
  new result #TODO(create:CsOperator)

proc extract*(t: typedesc[CsOperator]; info: Info): CsOperator = discard #TODO(extract:CsOperator)

proc add*(parent: var Dummy; item: CsOperator) = discard # TODO(add:CsOperator)

proc gen*(c: var CsOperator): string = discard #TODO(gen:CsOperator)
