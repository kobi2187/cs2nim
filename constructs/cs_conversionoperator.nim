import ../types, uuids, options
type CsConversionOperator* = ref object of CsObject #TODO(type:CsConversionOperator)

proc newCs*(t: typedesc[CsConversionOperator]; name: string): CsConversionOperator =
  new result
  result.id = uuids.genUUID #TODO(create:CsConversionOperator)

proc extract*(t: typedesc[CsConversionOperator]; info: Info): CsConversionOperator = discard #TODO(extract:CsConversionOperator)

proc add*(parent: var CsConversionOperator; item: Dummy) =
  discard # TODO(add:CsConversionOperator)
  # item.parentId = parent.id

proc gen*(c: var CsConversionOperator): string = discard #TODO(gen:CsConversionOperator)
