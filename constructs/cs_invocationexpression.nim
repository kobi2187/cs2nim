import ../types, uuids, uuids #, cs_root, cs_method, cs_class
type CsInvocationExpression* = ref object of BodyExpr
  callName*: string

proc newCs*(t: typedesc[CsInvocationExpression]; name: string): CsInvocationExpression =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.callName = name

proc extract*(t: typedesc[CsInvocationExpression]; info: Info): CsInvocationExpression =
  let name = info.essentials[0]
  result = newCs(CsInvocationExpression, name)

import strutils

func normalizeCallNameIfStatic(s: string): string =
  result = s.rsplit(".", 1)[^1] # last part is the function name that was called.
  if result.len == 1:
    result = result.toLowerAscii
  else:
    result = result[0].toLowerAscii & result[1..^1]

# import ../state, ../state_utils, options, ../vnode
# XXX continue here after adding Ids to everyone, it'd help solve this problem and also avoid all the passing, since we can "quickfetch" the vars.
# import ../vnode
# proc isInStatic(c: var CsInvocationExpression): bool = discard
# proc isInStatic(c: var CsInvocationExpression): bool =
#   var root = state.currentRoot
#   var expr: BodyExpr = root.fetch(c.parentId.get).expect(vkBodyExpr).BodyExpr
#   let m: CsMethod = root.fetch(expr.parentId.get).expect(vkMethod).CsMethod
#   if m.isStatic: return true
#   else:
#     let c: CsClass = root.fetch(m.parentId.get).expect(vkClass).CsClass
#     if c.isStatic: return true
#   result = false

# method gen*(c: var CsInvocationExpression): string =
#   result = if c.callName.contains(".") and c.isInStatic:
#     normalizeCallNameIfStatic(c.callName)
#   else: c.callName


  #[
  let exprStmt = root.exprsTable[c.parentId] # method or class... how do we do this? uuid to the rescue.
  let assumingMethod = root.allMethodsTable[exprStmt.parentId]
  if assumingMethod.isStatic or assumingMethod.parentClass().isStatic: discard
    # ......  so everyone gets a unique id, and that's how we call back to parent

  # refactor to proc isInStatic(for each type that needs it)

  # for handling c# static calls, we don't need the static class it was defined in.

    ]#
