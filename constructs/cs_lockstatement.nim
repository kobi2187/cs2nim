import ../types
type CsLockStatement* = ref object of CsObject #TODO(type:CsLockStatement)

proc newCs*(t: typedesc[CsLockStatement]; name: string): CsLockStatement =
  new result #TODO(create:CsLockStatement)

proc extract*(t: typedesc[CsLockStatement]; info: Info): CsLockStatement = discard #TODO(extract:CsLockStatement)

proc add*(parent: var CsLockStatement; item: Dummy) = discard # TODO(add:CsLockStatement)

proc gen*(c: var CsLockStatement): string = discard #TODO(gen:CsLockStatement)
