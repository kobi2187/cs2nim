import ../types, uuids, options
type CsArrayRankSpecifier* = ref object of CsObject #TODO(type:CsArrayRankSpecifier)

proc newCs*(t: typedesc[CsArrayRankSpecifier]; name: string): CsArrayRankSpecifier =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsArrayRankSpecifier)

proc extract*(t: typedesc[CsArrayRankSpecifier]; info: Info): CsArrayRankSpecifier = discard #TODO(extract:CsArrayRankSpecifier)

proc add*(parent: var CsArrayRankSpecifier; item: Dummy) =
  discard # TODO(add:CsArrayRankSpecifier)
  # item.parentId = parent.id
proc add*(parent: var CsArrayRankSpecifier; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsArrayRankSpecifier): string = discard #TODO(gen:CsArrayRankSpecifier)
