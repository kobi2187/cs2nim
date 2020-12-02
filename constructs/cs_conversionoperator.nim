import ../types
type CsConversionOperator* = ref object of CsObject #TODO(type:CsConversionOperator)

proc newCs*(t: typedesc[CsConversionOperator]; name: string): CsConversionOperator =
  new result #TODO(create:CsConversionOperator)

proc extract*(t: typedesc[CsConversionOperator]; info: Info): CsConversionOperator = discard #TODO(extract:CsConversionOperator)

proc add*(parent: var CsConversionOperator; item: Dummy) = discard # TODO(add:CsConversionOperator)

proc gen*(c: var CsConversionOperator): string = discard #TODO(gen:CsConversionOperator)
