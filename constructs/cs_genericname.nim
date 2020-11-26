import ../types
type CsGenericName* = ref object of CsObject #TODO(type:CsGenericName)

proc newCs*(t: typedesc[CsGenericName]; name: string): CsGenericName =
  new result #TODO(create:CsGenericName)

proc extract*(t: typedesc[CsGenericName]; info: Info): CsGenericName = discard #TODO(extract:CsGenericName)

proc add*(parent: var Dummy; item: CsGenericName) = discard # TODO(add:CsGenericName)

proc gen*(c: var CsGenericName): string = discard #TODO(gen:CsGenericName)
