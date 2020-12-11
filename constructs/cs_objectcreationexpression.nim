import ../types, ../state_utils, uuids, options, cs_parameterlist, cs_argumentlist
type CsObjectCreationExpression* = ref object of BodyExpr
  # args*: CsParameterList
  args*: CsArgumentList

proc newCs*(t: typedesc[CsObjectCreationExpression]; name: string): CsObjectCreationExpression =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.name = name
  result.ttype = "CsObjectCreationExpression"

proc extract*(t: typedesc[CsObjectCreationExpression]; info: Info): CsObjectCreationExpression =
  let newClassName = info.essentials[0]
  result = newCs(CsObjectCreationExpression, newClassName)


proc add*(parent: var CsObjectCreationExpression; item: CsArgumentList) =
  item.parentId = parent.id
  parent.args = item

# proc add*(parent: var CsObjectCreationExpression; item: CsArgumentList; data: AllNeededData) = parent.add(item) # TODO
# proc add*(parent: var CsObjectCreationExpression; item: CsParameterList, data:AllNeededData) = parent.add(item) # TODO

# proc add*(parent: var CsObjectCreationExpression; item: CsParameterList) = discard

method gen*(c: var CsObjectCreationExpression): string = discard #TODO(gen:CsObjectCreationExpression)
