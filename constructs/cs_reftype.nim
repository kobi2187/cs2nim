import ../types
type CsRefType* = ref object of CsObject #TODO(type:CsRefType)

proc newCs*(t: typedesc[CsRefType]; name: string): CsRefType =
  new result #TODO(create:CsRefType)

proc extract*(t: typedesc[CsRefType]; info: Info): CsRefType = discard #TODO(extract:CsRefType)

proc add*(parent: var Dummy; item: CsRefType) = discard # TODO(add:CsRefType)

proc gen*(c: var CsRefType): string = discard #TODO(gen:CsRefType)
