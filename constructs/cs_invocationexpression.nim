import ../types
type CsInvocationExpression* = ref object of CsObject
  callName*: string
proc newCs*(t: typedesc[CsInvocationExpression]; name: string): CsInvocationExpression =
  new result
  result.callName = name

proc extract*(t: typedesc[CsInvocationExpression]; info: Info): CsInvocationExpression =
  let name = info.essentials[0]
  result = newCs(CsInvocationExpression, name)

# proc add*(parent: var CsInvocationExpression; item: Dummy) = discard #
import strutils
proc gen*(c: var CsInvocationExpression): string =
  if c.callName.contains("."):
    result = c.callName.rsplit(".", 1)[^1]
  else: result = c.callName
  if result.len == 0: result = result.toLowerAscii
  else:
    result = result[0].toLowerAscii & result[1..^1]

