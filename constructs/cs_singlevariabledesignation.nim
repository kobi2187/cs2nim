import ../types, uuids, options
type CsSingleVariableDesignation* = ref object of CsObject #TODO(type:CsSingleVariableDesignation)

proc newCs*(t: typedesc[CsSingleVariableDesignation]; name: string): CsSingleVariableDesignation =
  new result
  result.id = uuids.genUUID #TODO(create:CsSingleVariableDesignation)

proc extract*(t: typedesc[CsSingleVariableDesignation]; info: Info): CsSingleVariableDesignation = discard #TODO(extract:CsSingleVariableDesignation)

proc add*(parent: var CsSingleVariableDesignation; item: Dummy) =
  discard # TODO(add:CsSingleVariableDesignation)
  # item.parentId = parent.id

proc gen*(c: var CsSingleVariableDesignation): string = discard #TODO(gen:CsSingleVariableDesignation)
