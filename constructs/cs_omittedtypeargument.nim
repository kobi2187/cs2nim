import ../types
type CsOmittedTypeArgument* = ref object of CsObject #TODO(type:CsOmittedTypeArgument)

proc newCs*(t: typedesc[CsOmittedTypeArgument]; name: string): CsOmittedTypeArgument =
  new result #TODO(create:CsOmittedTypeArgument)

proc extract*(t: typedesc[CsOmittedTypeArgument]; info: Info): CsOmittedTypeArgument = discard #TODO(extract:CsOmittedTypeArgument)

proc add*(parent: var CsOmittedTypeArgument; item: Dummy) = discard # TODO(add:CsOmittedTypeArgument)

proc gen*(c: var CsOmittedTypeArgument): string = discard #TODO(gen:CsOmittedTypeArgument)
