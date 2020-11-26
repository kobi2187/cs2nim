import ../types
type CsBracketedArgumentList* = ref object of CsObject #TODO(type:CsBracketedArgumentList)

proc newCs*(t: typedesc[CsBracketedArgumentList]; name: string): CsBracketedArgumentList =
  new result #TODO(create:CsBracketedArgumentList)

proc extract*(t: typedesc[CsBracketedArgumentList]; info: Info): CsBracketedArgumentList = discard #TODO(extract:CsBracketedArgumentList)

proc add*(parent: var Dummy; item: CsBracketedArgumentList) = discard # TODO(add:CsBracketedArgumentList)

proc gen*(c: var CsBracketedArgumentList): string = discard #TODO(gen:CsBracketedArgumentList)
