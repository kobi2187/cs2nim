type CsSingleVariableDesignation* = ref object of CsObject #TODO(type:CsSingleVariableDesignation)

proc newCs*(t: typedesc[CsSingleVariableDesignation]; name: string): CsSingleVariableDesignation =
  new result #TODO(create:CsSingleVariableDesignation)

proc extract*(t: typedesc[CsSingleVariableDesignation]; info: Info): CsSingleVariableDesignation = discard #TODO(extract:CsSingleVariableDesignation)

proc add*(parent: var Dummy; item: CsSingleVariableDesignation) = discard # TODO(add:CsSingleVariableDesignation)

proc gen*(c: var CsSingleVariableDesignation): string = discard #TODO(gen:CsSingleVariableDesignation)