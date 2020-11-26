type CsBracketedParameterList* = ref object of CsObject #TODO(type:CsBracketedParameterList)

proc newCs*(t: typedesc[CsBracketedParameterList]; name: string): CsBracketedParameterList =
  new result #TODO(create:CsBracketedParameterList)

proc extract*(t: typedesc[CsBracketedParameterList]; info: Info): CsBracketedParameterList = discard #TODO(extract:CsBracketedParameterList)

proc add*(parent: var Dummy; item: CsBracketedParameterList) = discard # TODO(add:CsBracketedParameterList)

proc gen*(c: var CsBracketedParameterList): string = discard #TODO(gen:CsBracketedParameterList)