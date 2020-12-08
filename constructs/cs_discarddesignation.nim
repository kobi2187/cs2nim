import ../types, uuids, options
type CsDiscardDesignation* = ref object of CsObject #TODO(type:CsDiscardDesignation)

proc newCs*(t: typedesc[CsDiscardDesignation]; name: string): CsDiscardDesignation =
  new result
  result.id = uuids.genUUID #TODO(create:CsDiscardDesignation)

proc extract*(t: typedesc[CsDiscardDesignation]; info: Info): CsDiscardDesignation = discard #TODO(extract:CsDiscardDesignation)

proc add*(parent: var CsDiscardDesignation; item: Dummy) =
  discard # TODO(add:CsDiscardDesignation)
  # item.parentId = parent.id

proc gen*(c: var CsDiscardDesignation): string = discard #TODO(gen:CsDiscardDesignation)
