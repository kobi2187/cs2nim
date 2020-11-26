import ../types
type CsBaseList* = ref object of CsObject #TODO(type:CsBaseList)

proc newCs*(t: typedesc[CsBaseList]; name: string): CsBaseList =
  new result #TODO(create:CsBaseList)

proc extract*(t: typedesc[CsBaseList]; info: Info): CsBaseList = discard #TODO(extract:CsBaseList)

proc add*(parent: var Dummy; item: CsBaseList) = discard # TODO(add:CsBaseList)

proc gen*(c: var CsBaseList): string = discard #TODO(gen:CsBaseList)
