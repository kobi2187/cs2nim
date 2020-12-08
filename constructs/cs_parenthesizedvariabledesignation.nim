import ../types, uuids, options
type CsParenthesizedVariableDesignation* = ref object of CsObject #TODO(type:CsParenthesizedVariableDesignation)

proc newCs*(t: typedesc[CsParenthesizedVariableDesignation]; name: string): CsParenthesizedVariableDesignation =
  new result
  result.id = uuids.genUUID #TODO(create:CsParenthesizedVariableDesignation)

proc extract*(t: typedesc[CsParenthesizedVariableDesignation]; info: Info): CsParenthesizedVariableDesignation = discard #TODO(extract:CsParenthesizedVariableDesignation)

proc add*(parent: var CsParenthesizedVariableDesignation; item: Dummy) =
  discard # TODO(add:CsParenthesizedVariableDesignation)
  # item.parentId = parent.id

proc gen*(c: var CsParenthesizedVariableDesignation): string = discard #TODO(gen:CsParenthesizedVariableDesignation)
