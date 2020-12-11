import ../types, ../state_utils, uuids, options
type CsTypeParameterConstraintClause* = ref object of CsObject #TODO(type:CsTypeParameterConstraintClause)

proc newCs*(t: typedesc[CsTypeParameterConstraintClause]; name: string): CsTypeParameterConstraintClause =
  new result
  result.typ = $typeof(t)
  result.id = uuids.genUUID #TODO(create:CsTypeParameterConstraintClause)

proc extract*(t: typedesc[CsTypeParameterConstraintClause]; info: Info): CsTypeParameterConstraintClause = discard #TODO(extract:CsTypeParameterConstraintClause)

proc add*(parent: var CsTypeParameterConstraintClause; item: Dummy) =
  discard # TODO(add:CsTypeParameterConstraintClause)
  # item.parentId = parent.id
# proc add*(parent: var CsTypeParameterConstraintClause; item: Dummy; data: AllNeededData) = parent.add(item) # TODO

proc gen*(c: var CsTypeParameterConstraintClause): string = discard #TODO(gen:CsTypeParameterConstraintClause)
