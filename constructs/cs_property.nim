import ../types
import cs_predefinedtype

type CsProperty* = ref object of CsObject
  retType: string
  name: string
  hasGet: bool
  hasSet: bool
  bodySet: string # dunno.
  bodyGet: string # NOTE: don't know yet what type to put here. maybe something like a method body or a list of expr ?

proc newCs*(t: typedesc[CsProperty]; name: string): CsProperty =
  new result #TODO(create:CsProperty)

proc extract*(t: typedesc[CsProperty]; info: Info): CsProperty = discard #TODO(extract:CsProperty)

proc add*(parent: var CsProperty; a: CsPredefinedType) =
  parent.retType = a.name

proc gen*(c: var CsProperty): string = discard #TODO(gen:CsProperty)
