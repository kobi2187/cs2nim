import ../types

type CsSimpleBaseType* = ref object of CsObject #TODO(type:CsSimpleBaseType)

proc newCs*(t: typedesc[CsSimpleBaseType]; name: string): CsSimpleBaseType =
  new result #TODO(create:CsSimpleBaseType)

proc extract*(t: typedesc[CsSimpleBaseType]; info: Info): CsSimpleBaseType = discard #TODO(extract:CsSimpleBaseType)

proc add*(parent: var CsSimpleBaseType; item: Dummy) = discard # TODO(add:CsSimpleBaseType)

proc gen*(c: var CsSimpleBaseType): string = discard #TODO(gen:CsSimpleBaseType)
