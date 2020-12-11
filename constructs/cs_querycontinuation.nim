import ../types, ../state_utils, uuids, options
type CsQueryContinuation* = ref object of CsObject #TODO(type:CsQueryContinuation)

proc newCs*(t: typedesc[CsQueryContinuation]; name: string): CsQueryContinuation =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsQueryContinuation)

proc extract*(t: typedesc[CsQueryContinuation]; info: Info): CsQueryContinuation = discard #TODO(extract:CsQueryContinuation)

proc add*(parent: var CsQueryContinuation; item: Dummy) =
  discard # TODO(add:CsQueryContinuation)
  # item.parentId = parent.id
# proc add*(parent: var CsQueryContinuation; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsQueryContinuation): string = discard #TODO(gen:CsQueryContinuation)
