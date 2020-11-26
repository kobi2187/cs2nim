type CsQueryContinuation* = ref object of CsObject #TODO(type:CsQueryContinuation)

proc newCs*(t: typedesc[CsQueryContinuation]; name: string): CsQueryContinuation =
  new result #TODO(create:CsQueryContinuation)

proc extract*(t: typedesc[CsQueryContinuation]; info: Info): CsQueryContinuation = discard #TODO(extract:CsQueryContinuation)

proc add*(parent: var Dummy; item: CsQueryContinuation) = discard # TODO(add:CsQueryContinuation)

proc gen*(c: var CsQueryContinuation): string = discard #TODO(gen:CsQueryContinuation)