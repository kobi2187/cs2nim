import cs_invocationexpression, cs_argumentlist
import ../types
# A method body's line.
type CsExpressionStatement* = ref object of BodyExpr
  call*: CsInvocationExpression
  args*: CsArgumentList

proc newCs*(t: typedesc[CsExpressionStatement]): CsExpressionStatement =
  new result
  result.ttype = "CsExpressionStatement"

proc extract*(t: typedesc[CsExpressionStatement]; info: Info): CsExpressionStatement =
  result = newCs(CsExpressionStatement)

proc add*(parent: var CsExpressionStatement; item: CsArgumentList) = parent.args = item
proc add*(parent: var CsExpressionStatement; item: CsInvocationExpression) = parent.call = item

method gen*(c: CsExpressionStatement): string =
  result = c.call.gen() & "("
  if c.args.args.len > 0:
    result &= c.args.gen()
  result &= ")"

