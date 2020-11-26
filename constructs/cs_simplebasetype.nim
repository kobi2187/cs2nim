type CsSimpleBaseType* = ref object of CsObject #TODO(type:CsSimpleBaseType)

proc newCs*(t: typedesc[CsSimpleBaseType]; name: string): CsSimpleBaseType =
  new result #TODO(create:CsSimpleBaseType)

proc extract*(t: typedesc[CsSimpleBaseType]; info: Info): CsSimpleBaseType = discard #TODO(extract:CsSimpleBaseType)

proc add*(parent: var Dummy; item: CsSimpleBaseType) = discard # TODO(add:CsSimpleBaseType)

proc gen*(c: var CsSimpleBaseType): string = discard #TODO(gen:CsSimpleBaseType)