import ../types
type CsDelegate* = ref object of CsObject #TODO(type:CsDelegate)

proc newCs*(t: typedesc[CsDelegate]; name: string): CsDelegate =
  new result #TODO(create:CsDelegate)

proc extract*(t: typedesc[CsDelegate]; info: Info): CsDelegate = discard #TODO(extract:CsDelegate)

proc add*(parent: var Dummy; item: CsDelegate) = discard # TODO(add:CsDelegate)

proc gen*(c: var CsDelegate): string = discard #TODO(gen:CsDelegate)
