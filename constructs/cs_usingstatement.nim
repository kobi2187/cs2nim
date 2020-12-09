import ../types, uuids, options
type CsUsingStatement* = ref object of CsObject #TODO(type:CsUsingStatement)

proc newCs*(t: typedesc[CsUsingStatement]; name: string): CsUsingStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsUsingStatement)

proc extract*(t: typedesc[CsUsingStatement]; info: Info): CsUsingStatement = discard #TODO(extract:CsUsingStatement)

proc add*(parent: var CsUsingStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsUsingStatement; item: Dummy) =
  discard # TODO(add:CsUsingStatement)
  # item.parentId = parent.id

proc gen*(c: var CsUsingStatement): string = discard #TODO(gen:CsUsingStatement)
