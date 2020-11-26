import ../types
type CsConstructor* = ref object of CsObject #TODO(type:CsConstructor)

proc newCs*(t: typedesc[CsConstructor]; name: string): CsConstructor =
  new result #TODO(create:CsConstructor)

proc extract*(t: typedesc[CsConstructor]; info: Info): CsConstructor = discard #TODO(extract:CsConstructor)

proc add*(parent: var Dummy; item: CsConstructor) = discard # TODO(add:CsConstructor)

proc gen*(c: var CsConstructor): string = discard #TODO(gen:CsConstructor)
