import ../types
type CsTypeParameter* = ref object of CsObject #TODO(type:CsTypeParameter)

proc newCs*(t: typedesc[CsTypeParameter]; name: string): CsTypeParameter =
  new result #TODO(create:CsTypeParameter)

proc extract*(t: typedesc[CsTypeParameter]; info: Info): CsTypeParameter = discard #TODO(extract:CsTypeParameter)

proc add*(parent: var CsTypeParameter; item: Dummy) = discard # TODO(add:CsTypeParameter)

proc gen*(c: var CsTypeParameter): string = discard #TODO(gen:CsTypeParameter)
