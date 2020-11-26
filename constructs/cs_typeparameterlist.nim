type CsTypeParameterList* = ref object of CsObject #TODO(type:CsTypeParameterList)

proc newCs*(t: typedesc[CsTypeParameterList]; name: string): CsTypeParameterList =
  new result #TODO(create:CsTypeParameterList)

proc extract*(t: typedesc[CsTypeParameterList]; info: Info): CsTypeParameterList = discard #TODO(extract:CsTypeParameterList)

proc add*(parent: var Dummy; item: CsTypeParameterList) = discard # TODO(add:CsTypeParameterList)

proc gen*(c: var CsTypeParameterList): string = discard #TODO(gen:CsTypeParameterList)