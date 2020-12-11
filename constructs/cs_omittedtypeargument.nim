import ../types, ../state_utils, uuids, options
type CsOmittedTypeArgument* = ref object of CsObject #TODO(type:CsOmittedTypeArgument)

proc newCs*(t: typedesc[CsOmittedTypeArgument]; name: string): CsOmittedTypeArgument =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsOmittedTypeArgument)

proc extract*(t: typedesc[CsOmittedTypeArgument]; info: Info): CsOmittedTypeArgument = discard #TODO(extract:CsOmittedTypeArgument)

proc add*(parent: var CsOmittedTypeArgument; item: Dummy) =
  discard # TODO(add:CsOmittedTypeArgument)
  # item.parentId = parent.id
# proc add*(parent: var CsOmittedTypeArgument; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsOmittedTypeArgument): string = discard #TODO(gen:CsOmittedTypeArgument)
