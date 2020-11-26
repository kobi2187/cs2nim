type CsTypeParameterConstraintClause* = ref object of CsObject #TODO(type:CsTypeParameterConstraintClause)

proc newCs*(t: typedesc[CsTypeParameterConstraintClause]; name: string): CsTypeParameterConstraintClause =
  new result #TODO(create:CsTypeParameterConstraintClause)

proc extract*(t: typedesc[CsTypeParameterConstraintClause]; info: Info): CsTypeParameterConstraintClause = discard #TODO(extract:CsTypeParameterConstraintClause)

proc add*(parent: var Dummy; item: CsTypeParameterConstraintClause) = discard # TODO(add:CsTypeParameterConstraintClause)

proc gen*(c: var CsTypeParameterConstraintClause): string = discard #TODO(gen:CsTypeParameterConstraintClause)