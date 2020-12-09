import cs_invocationexpression, cs_argumentlist
import ../types, uuids, options
import uuids
# A method body's line.
type CsExpressionStatement* = ref object of BodyExpr
  call*: CsInvocationExpression
  args*: CsArgumentList

proc newCs*(t: typedesc[CsExpressionStatement]): CsExpressionStatement =
  new result
  result.id = genUUID().some
  result.ttype = "CsExpressionStatement"
  result.id = genUUID().some

proc extract*(t: typedesc[CsExpressionStatement]; info: Info): CsExpressionStatement =
  result = newCs(CsExpressionStatement)

proc add*(parent: var CsExpressionStatement; item: CsArgumentList) =
  item.parentId = parent.id
  parent.args = item
proc add*(parent: var CsExpressionStatement; item: CsArgumentList; data: AllNeededData) = parent.add(item) # TODO

proc add*(parent: var CsExpressionStatement; item: CsInvocationExpression) =
  item.parentId = parent.id
  parent.call = item
proc add*(parent: var CsExpressionStatement; item: CsInvocationExpression; data: AllNeededData) = parent.add(item) # TODO


method gen*(c: CsExpressionStatement): string =
  result = c.call.gen() & "("
  if c.args.args.len > 0:
    result &= c.args.gen()
  result &= ")"

