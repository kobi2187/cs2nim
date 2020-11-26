import ../types
type CsExternAliasDirective* = ref object of CsObject #TODO(type:CsExternAliasDirective)

proc newCs*(t: typedesc[CsExternAliasDirective]; name: string): CsExternAliasDirective =
  new result #TODO(create:CsExternAliasDirective)

proc extract*(t: typedesc[CsExternAliasDirective]; info: Info): CsExternAliasDirective = discard #TODO(extract:CsExternAliasDirective)

proc add*(parent: var Dummy; item: CsExternAliasDirective) = discard # TODO(add:CsExternAliasDirective)

proc gen*(c: var CsExternAliasDirective): string = discard #TODO(gen:CsExternAliasDirective)
