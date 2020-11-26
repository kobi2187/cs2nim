import ../types
type CsImplicitElementAccess* = ref object of CsObject #TODO(type:CsImplicitElementAccess)

proc newCs*(t: typedesc[CsImplicitElementAccess]; name: string): CsImplicitElementAccess =
  new result #TODO(create:CsImplicitElementAccess)

proc extract*(t: typedesc[CsImplicitElementAccess]; info: Info): CsImplicitElementAccess = discard #TODO(extract:CsImplicitElementAccess)

proc add*(parent: var Dummy; item: CsImplicitElementAccess) = discard # TODO(add:CsImplicitElementAccess)

proc gen*(c: var CsImplicitElementAccess): string = discard #TODO(gen:CsImplicitElementAccess)
