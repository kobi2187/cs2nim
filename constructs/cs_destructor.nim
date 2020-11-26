type CsDestructor* = ref object of CsObject #TODO(type:CsDestructor)

proc newCs*(t: typedesc[CsDestructor]; name: string): CsDestructor =
  new result #TODO(create:CsDestructor)

proc extract*(t: typedesc[CsDestructor]; info: Info): CsDestructor = discard #TODO(extract:CsDestructor)

proc add*(parent: var Dummy; item: CsDestructor) = discard # TODO(add:CsDestructor)

proc gen*(c: var CsDestructor): string = discard #TODO(gen:CsDestructor)