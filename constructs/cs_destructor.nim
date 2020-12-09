import ../types, uuids, options
type CsDestructor* = ref object of CsObject #TODO(type:CsDestructor)

proc newCs*(t: typedesc[CsDestructor]; name: string): CsDestructor =
  new result
  result.id = uuids.genUUID #TODO(create:CsDestructor)

proc extract*(t: typedesc[CsDestructor]; info: Info): CsDestructor = discard #TODO(extract:CsDestructor)

proc add*(parent: var CsDestructor; item: Dummy) =
  discard # TODO(add:CsDestructor)
  # item.parentId = parent.id
proc add*(parent: var CsDestructor; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsDestructor): string = discard #TODO(gen:CsDestructor)
