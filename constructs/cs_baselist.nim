import ../types, ../state_utils, uuids, options
type CsBaseList* = ref object of CsObject #TODO(type:CsBaseList)

proc newCs*(t: typedesc[CsBaseList]; name: string): CsBaseList =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsBaseList)

proc extract*(t: typedesc[CsBaseList]; info: Info): CsBaseList = discard #TODO(extract:CsBaseList)

proc add*(parent: var CsBaseList; item: Dummy) =
  discard # TODO(add:CsBaseList)
  # item.parentId = parent.id
# proc add*(parent: var CsBaseList; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsBaseList): string = discard #TODO(gen:CsBaseList)
