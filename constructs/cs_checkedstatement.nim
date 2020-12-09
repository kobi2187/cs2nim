import ../types, uuids, options
type CsCheckedStatement* = ref object of CsObject #TODO(type:CsCheckedStatement)

proc newCs*(t: typedesc[CsCheckedStatement]; name: string): CsCheckedStatement =
  new result
  result.id = uuids.genUUID #TODO(create:CsCheckedStatement)

proc extract*(t: typedesc[CsCheckedStatement]; info: Info): CsCheckedStatement = discard #TODO(extract:CsCheckedStatement)

proc add*(parent: var CsCheckedStatement; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsCheckedStatement; item: Dummy) =
  discard # TODO(add:CsCheckedStatement)
  # item.parentId = parent.id

proc gen*(c: var CsCheckedStatement): string = discard #TODO(gen:CsCheckedStatement)
