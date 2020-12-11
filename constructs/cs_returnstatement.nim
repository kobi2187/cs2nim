import ../types, ../state_utils, uuids, options
type CsReturnStatement* = ref object of BodyExpr # type:CsReturnStatement
  expr*: BodyExpr                                # can have one expr that can be nil

proc newCs*(t: typedesc[CsReturnStatement]): CsReturnStatement =
  new result
  result.typ = $typeof(t)
  result.id = genUUID().some
  result.ttype = "CsReturnStatement"

proc extract*(t: typedesc[CsReturnStatement]; info: Info): CsReturnStatement =
  result = newCs(CsReturnStatement)
  let expectedFollowupAsString = if info.essentials.len > 0: info.essentials[0] else: ""
  echo "From C# side -- expected to follow after return: " & expectedFollowupAsString


proc add*(parent: var CsReturnStatement; item: BodyExpr) = discard # (add:CsReturnStatement)
# proc add*(parent: var CsReturnStatement; item: BodyExpr; data: AllNeededData) = parent.add(item) # TODO

method gen*(c: CsReturnStatement): string =
  result = if c.expr.isNil: "return"
  else: "return " & c.expr.gen()
