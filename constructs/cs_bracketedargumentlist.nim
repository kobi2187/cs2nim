import ../types, uuids, options
type CsBracketedArgumentList* = ref object of CsObject #TODO(type:CsBracketedArgumentList)

proc newCs*(t: typedesc[CsBracketedArgumentList]; name: string): CsBracketedArgumentList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBracketedArgumentList)

proc extract*(t: typedesc[CsBracketedArgumentList]; info: Info): CsBracketedArgumentList = discard #TODO(extract:CsBracketedArgumentList)

proc add*(parent: var CsBracketedArgumentList; item: Dummy) =
  discard # TODO(add:CsBracketedArgumentList)
  # item.parentId = parent.id
proc add*(parent: var CsBracketedArgumentList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBracketedArgumentList): string = discard #TODO(gen:CsBracketedArgumentList)
