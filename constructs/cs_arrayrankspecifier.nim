import ../types
type CsArrayRankSpecifier* = ref object of CsObject #TODO(type:CsArrayRankSpecifier)

proc newCs*(t: typedesc[CsArrayRankSpecifier]; name: string): CsArrayRankSpecifier =
  new result #TODO(create:CsArrayRankSpecifier)

proc extract*(t: typedesc[CsArrayRankSpecifier]; info: Info): CsArrayRankSpecifier = discard #TODO(extract:CsArrayRankSpecifier)

proc add*(parent: var Dummy; item: CsArrayRankSpecifier) = discard # TODO(add:CsArrayRankSpecifier)

proc gen*(c: var CsArrayRankSpecifier): string = discard #TODO(gen:CsArrayRankSpecifier)
