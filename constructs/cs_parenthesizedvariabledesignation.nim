type CsParenthesizedVariableDesignation* = ref object of CsObject #TODO(type:CsParenthesizedVariableDesignation)

proc newCs*(t: typedesc[CsParenthesizedVariableDesignation]; name: string): CsParenthesizedVariableDesignation =
  new result #TODO(create:CsParenthesizedVariableDesignation)

proc extract*(t: typedesc[CsParenthesizedVariableDesignation]; info: Info): CsParenthesizedVariableDesignation = discard #TODO(extract:CsParenthesizedVariableDesignation)

proc add*(parent: var Dummy; item: CsParenthesizedVariableDesignation) = discard # TODO(add:CsParenthesizedVariableDesignation)

proc gen*(c: var CsParenthesizedVariableDesignation): string = discard #TODO(gen:CsParenthesizedVariableDesignation)