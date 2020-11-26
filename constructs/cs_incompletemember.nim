import ../types
type CsIncompleteMember* = ref object of CsObject #TODO(type:CsIncompleteMember)

proc newCs*(t: typedesc[CsIncompleteMember]; name: string): CsIncompleteMember =
  new result #TODO(create:CsIncompleteMember)

proc extract*(t: typedesc[CsIncompleteMember]; info: Info): CsIncompleteMember = discard #TODO(extract:CsIncompleteMember)

proc add*(parent: var Dummy; item: CsIncompleteMember) = discard # TODO(add:CsIncompleteMember)

proc gen*(c: var CsIncompleteMember): string = discard #TODO(gen:CsIncompleteMember)
