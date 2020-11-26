import ../types
type CsDiscardDesignation* = ref object of CsObject #TODO(type:CsDiscardDesignation)

proc newCs*(t: typedesc[CsDiscardDesignation]; name: string): CsDiscardDesignation =
  new result #TODO(create:CsDiscardDesignation)

proc extract*(t: typedesc[CsDiscardDesignation]; info: Info): CsDiscardDesignation = discard #TODO(extract:CsDiscardDesignation)

proc add*(parent: var Dummy; item: CsDiscardDesignation) = discard # TODO(add:CsDiscardDesignation)

proc gen*(c: var CsDiscardDesignation): string = discard #TODO(gen:CsDiscardDesignation)
