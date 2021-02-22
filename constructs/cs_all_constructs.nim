# import ../state_utils
import nre, sequtils, strutils, sets, re, uuids, options, tables, hashes
# {.experimental: "codeReordering".}
import ../types
import justtypes


proc colonsToTable*(s: seq[string]): TableRef[string, string] =
  new result
  for x in s:
    assert x.contains(":")
    let r = x.split(":", 1)
    let k = r[0]
    let v = r[1]
    result[k] = v



# const stopEarly = false
  # NOTE: for some reason I get the following warning:
  #   use {.base.} for base methods; baseless methods are deprecated [UseBase]
# the other add methods don't recognize that this is their base method. (even though both parameters inherit correctly from CsObject.

  # method add*(a: var ref CsObject, b: ref CsObject) {.base.} =
method add*(a: var ref CsObject, b: CsObject) {.base.} =
  raise newException(Exception, "missing implementation for " & a.typ & ", " & b.typ)

# ============= CsAccessorList ========

proc newCs*(t: typedesc[CsAccessorList]): CsAccessorList =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsAccessorList]; info: Info): CsAccessorList =
  # let val = info.essentials[0]
  echo info
  result = newCs(CsAccessorList)
  # if val.contains("get;"):
  #   result.hasDefaultGet = true
  #   # result.hasGetBody = false
  # if val.contains("set;"):
  #   result.hasDefaultSet = true
  #   # result.hasSetBody = false
  # if val.contains(nre.re"get\s*{"):
  #   echo val;
  #   result.hasGetBody = true # TODO: check against real code.
  # if val.contains(nre.re"set\s*{"): echo val; result.hasSetBody = true

method add*(parent: var CsAccessorList; item: CsAccessor) =
  parent.accessors.add item
  # echo "csaccessor is " & $item.name & ":" & $item.kind
  # assert item.kind in ["get", "set"#[ for normal properties ]#, "add","remove" #[ properties for events ]#]
  # if item.kind == "get":
  #   parent.getPart = item
  # else:
  #   parent.setPart = item

# proc add*(parent: var CsAccessorList; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: CsIfStatement): string =
  echo "--> in  gen*(c: var CsIfStatement)"
  result = "NotYetImplemented"
  todoimpl

method gen*(c: var CsAccessorList): string =
  echo "--> in  gen*(c: var CsAccessorList)"
  todoimpl

# ============= CsAccessor ========

proc newCs*(t: typedesc[CsAccessor]): CsAccessor =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsAccessor]; info: Info): CsAccessor =
  echo info
  result = newCs(CsAccessor)
  # can have kind (get or set) in [0]
  if info.essentials.len > 0:
    result.kind = info.essentials[0]
    # can have body statements! in [1] # maybe they are handled later?
    if info.essentials.len > 1:
      result.statementsTxt = info.essentials[1]

  #todo: should find its parent accessorlist, add this field to AllNeededData ( last accessor list)

# method add*(parent: var CsAccessor; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsAccessor; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsAccessor; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsAccessor): string =
  todoimpl
  echo "--> in  gen*(c: var CsAccessor)"

# ============= CsAliasQualifiedName ========

proc newCs*(t: typedesc[CsAliasQualifiedName]): CsAliasQualifiedName =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAliasQualifiedName)

proc extract*(t: typedesc[CsAliasQualifiedName]; info: Info): CsAliasQualifiedName =
  echo info
  result = newCs(CsAliasQualifiedName)
  # todoimpl

method gen*(c: var CsAliasQualifiedName): string =
  todoimpl
  echo "--> in  gen*(c: var CsAliasQualifiedName)"

# ============= CsField ========

proc newCs*(t: typedesc[CsField]): CsField =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsField]; info: Info): CsField =
  echo info
  result = newCs(CsField)
  result.name = info.essentials[2]
  result.thetype = info.essentials[1]
  result.isStatic = info.essentials[0].contains("static")
  result.isPublic = info.essentials[0].contains(
      "public") # TODO check what CsDisplay actually provides.

# method add*(parent: var CsField; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsField; item: Dummy) "
#   if stopEarly: assert false
# # proc add*(parent: var CsField; item: Dummy; data: AllNeededData) = parent.add(item)

proc hackFindType(item: CsProperty): string =
  echo item.src
  let regex = nre.re(".*?(\\w+)\\s*" & item.name & ".*")
  let res = item.src.match(regex)
  if res.isNone: return ""
  else: return res.get.captures[0]

proc gen*(f: CsField): string =
  echo "--> in  gen*(f: CsField)"
  result = f.name
  if f.ispublic: result &= "*"
  result &= ": " & f.thetype

# ============= CsAnonymousMethodExpression ========

proc newCs*(t: typedesc[CsAnonymousMethodExpression]): CsAnonymousMethodExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAnonymousMethodExpression)

proc extract*(t: typedesc[CsAnonymousMethodExpression]; info: Info): CsAnonymousMethodExpression =
  echo info
  result = newCs(CsAnonymousMethodExpression)
  # todoimpl

# method add*(parent: var CsAnonymousMethodExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsAnonymousMethodExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsAnonymousMethodExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsAnonymousMethodExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsAnonymousMethodExpression)"

# ============= CsAnonymousObjectCreationExpression ========

proc newCs*(t: typedesc[CsAnonymousObjectCreationExpression]): CsAnonymousObjectCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAnonymousObjectCreationExpression)

proc extract*(t: typedesc[CsAnonymousObjectCreationExpression]; info: Info): CsAnonymousObjectCreationExpression =
  echo info
  result = newCs(CsAnonymousObjectCreationExpression)
  # todoimpl

# method add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsAnonymousObjectCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsAnonymousObjectCreationExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsAnonymousObjectCreationExpression)"

# ============= CsAnonymousObjectMemberDeclarator ========

proc newCs*(t: typedesc[CsAnonymousObjectMemberDeclarator]): CsAnonymousObjectMemberDeclarator =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsAnonymousObjectMemberDeclarator]; info: Info): CsAnonymousObjectMemberDeclarator =
  echo info
  result = newCs(CsAnonymousObjectMemberDeclarator)
# todoimpl

# method add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsAnonymousObjectMemberDeclarator): string =
  todoimpl
  echo "--> in  gen*(c: var CsAnonymousObjectMemberDeclarator)"

# ============= CsArgumentList ========

proc newCs*(t: typedesc[CsArgumentList]; args: seq[string]): CsArgumentList =
  new result
  result.typ = $typeof(t)
  # result.args = args.mapIt(it.strip) # now handled from CsArgument

proc extract*(t: typedesc[CsArgumentList]; info: Info): CsArgumentList =
  result = newCs(CsArgumentList, info.essentials[0].split(","))

proc replacementGenericTypes (s: string): string =
  if s.contains("<") and s.contains(">"):
    result = s.replace("<", "[").replace(">", "]")
  else: result = s

method gen*(c: var CsArgumentList): string =

  echo "--> in  gen*(c: var CsArgumentList)"
  if not c.isNil:
    result = c.args.mapIt(it.value).join(", ").replacementGenericTypes()

# ============= CsArgument ========

proc newCs*(t: typedesc[CsArgument]): CsArgument =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArgument)

proc extract*(t: typedesc[CsArgument]; info: Info): CsArgument =
  result = newCs(CsArgument)
  result.value = info.essentials[0]

# proc add*(parent: var CsArgument; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsArgument): string =
  todoimpl
  echo "--> in  gen*(c: var CsArgument)"

# ============= CsArrayCreationExpression ========

proc newCs*(t: typedesc[CsArrayCreationExpression]): CsArrayCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrayCreationExpression)

proc extract*(t: typedesc[CsArrayCreationExpression]; info: Info): CsArrayCreationExpression =
  echo info
  result = newCs(CsArrayCreationExpression)
  # todoimpl

# method add*(parent: var CsArrayCreationExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsArrayCreationExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsArrayCreationExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsArrayCreationExpression)"

# ============= CsArrayRankSpecifier ========

proc newCs*(t: typedesc[CsArrayRankSpecifier]): CsArrayRankSpecifier =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrayRankSpecifier)

proc extract*(t: typedesc[CsArrayRankSpecifier]; info: Info): CsArrayRankSpecifier =
  echo info
  result = newCs(CsArrayRankSpecifier)
  # todoimpl

# method add*(parent: var CsArrayRankSpecifier; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsArrayRankSpecifier; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsArrayRankSpecifier; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsArrayRankSpecifier): string =
  todoimpl
  echo "--> in  gen*(c: var CsArrayRankSpecifier)"

# ============= CsArrayType ========

proc newCs*(t: typedesc[CsArrayType]): CsArrayType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrayType)

proc extract*(t: typedesc[CsArrayType]; info: Info): CsArrayType =
  echo info
  result = newCs(CsArrayType)
  # todoimpl

# method add*(parent: var CsArrayType; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsArrayType; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsArrayType; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsArrayType): string =
  todoimpl
  echo "--> in  gen*(c: var CsArrayType)"

# ============= CsArrowExpressionClause ========

proc newCs*(t: typedesc[CsArrowExpressionClause]): CsArrowExpressionClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsArrowExpressionClause)

proc extract*(t: typedesc[CsArrowExpressionClause]; info: Info): CsArrowExpressionClause =
  echo info
  result = newCs(CsArrowExpressionClause)
  # todoimpl

# method add*(parent: var CsArrowExpressionClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsArrowExpressionClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsArrowExpressionClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsArrowExpressionClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsArrowExpressionClause)"

# ============= CsAssignmentExpression ========

method gen*(c: CsAssignmentExpression): string =
  echo "--> in  gen*(c: CsAssignmentExpression)"
  assert c.left.len > 0
  assert not c.right.isNil
  echo c.right.typ
  result = c.left & " = " & c.right.gen()
  # assert false #TODO(gen:CsAssignmentExpression)

# ============= CsAttributeArgumentList ========

proc newCs*(t: typedesc[CsAttributeArgumentList];
    name: string): CsAttributeArgumentList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeArgumentList)

proc extract*(t: typedesc[CsAttributeArgumentList];
    info: Info): CsAttributeArgumentList = todoimpl

# method add*(parent: var CsAttributeArgumentList; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsAttributeArgumentList; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsAttributeArgumentList; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsAttributeArgumentList): string =
  todoimpl
  echo "--> in  gen*(c: var CsAttributeArgumentList)"

# ============= CsAttributeArgument ========

proc newCs*(t: typedesc[CsAttributeArgument];
    name: string): CsAttributeArgument =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeArgument)

proc extract*(t: typedesc[CsAttributeArgument];
    info: Info): CsAttributeArgument = todoimpl

# method add*(parent: var CsAttributeArgument; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsAttributeArgument; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsAttributeArgument; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsAttributeArgument): string =
  todoimpl
  echo "--> in  gen*(c: var CsAttributeArgument)"

proc newCs*(t: typedesc[CsAttributeList]; name: string): CsAttributeList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeList)

proc extract*(t: typedesc[CsAttributeList];
    info: Info): CsAttributeList = todoimpl

# method add*(parent: var CsAttributeList; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsAttributeList; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsAttributeList; item: Dummy; data: AllNeededData) = parent.add(item)
method gen*(c: var CsAttributeList): string =
  todoimpl
  echo "--> in  gen*(c: var CsAttributeList)"

# ============= CsAttribute ========

proc newCs*(t: typedesc[CsAttribute]; name: string): CsAttribute =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttribute)

proc extract*(t: typedesc[CsAttribute]; info: Info): CsAttribute = todoimpl

# method add*(parent: var CsAttribute; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsAttribute; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsAttribute; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsAttribute): string =
  todoimpl
  echo "--> in  gen*(c: var CsAttribute)"

# ============= CsAttributeTargetSpecifier ========

proc newCs*(t: typedesc[CsAttributeTargetSpecifier];
    name: string): CsAttributeTargetSpecifier =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAttributeTargetSpecifier)

proc extract*(t: typedesc[CsAttributeTargetSpecifier];
    info: Info): CsAttributeTargetSpecifier = todoimpl

# method add*(parent: var CsAttributeTargetSpecifier; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsAttributeTargetSpecifier; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsAttributeTargetSpecifier; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsAttributeTargetSpecifier): string =
  todoimpl
  echo "--> in  gen*(c: var CsAttributeTargetSpecifier)"

# ============= CsAwaitExpression ========

proc newCs*(t: typedesc[CsAwaitExpression]): CsAwaitExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsAwaitExpression)

proc extract*(t: typedesc[CsAwaitExpression]; info: Info): CsAwaitExpression =
  echo info
  result = newCs(CsAwaitExpression)
  # todoimpl

# method add*(parent: var CsAwaitExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsAwaitExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsAwaitExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsAwaitExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsAwaitExpression)"

# ============= CsBaseExpression ========

proc newCs*(t: typedesc[CsBaseExpression]): CsBaseExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBaseExpression)

proc extract*(t: typedesc[CsBaseExpression]; info: Info): CsBaseExpression =
  echo info
  result = newCs(CsBaseExpression)
  # todoimpl

# method add*(parent: var CsBaseExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsBaseExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsBaseExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsBaseExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsBaseExpression)"

# ============= CsBaseList ========

proc newCs*(t: typedesc[CsBaseList]): CsBaseList =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsBaseList]; info: Info): CsBaseList =
  result = newCs(CsBaseList)
  if info.essentials.len > 0:
    result.baseList = info.essentials[0].split(", ").mapIt(it.strip)

# method add*(parent: var CsBaseList; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsBaseList; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsBaseList; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsBaseList): string =
  todoimpl
  echo "--> in  gen*(c: var CsBaseList)"

# ============= CsBinaryExpression ========

method gen*(c: CsBinaryExpression): string =
  result = c.left & " " & c.op & " " & c.right

proc newCs*(t: typedesc[CsBinaryExpression]): CsBinaryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBinaryExpression)

proc extract*(t: typedesc[CsBinaryExpression]; info: Info): CsBinaryExpression =
  result = newCs(t)
  result.left = info.essentials[0]
  result.op = info.essentials[1]
  result.right = info.essentials[2]

# method add*(parent: var CsBinaryExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsBinaryExpression; item: Dummy) "
#   if stopEarly: assert false
# # proc add*(parent: var CsBinaryExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsBinaryExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsBinaryExpression)"

# ============= CsBracketedArgumentList ========

proc newCs*(t: typedesc[CsBracketedArgumentList]): CsBracketedArgumentList =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBracketedArgumentList)

proc extract*(t: typedesc[CsBracketedArgumentList]; info: Info): CsBracketedArgumentList =
  echo info
  result = newCs(CsBracketedArgumentList)


# method add*(parent: var CsBracketedArgumentList; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsBracketedArgumentList; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsBracketedArgumentList; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsBracketedArgumentList): string =
  todoimpl
  echo "--> in  gen*(c: var CsBracketedArgumentList)"

# ============= CsBracketedParameterList ========

proc newCs*(t: typedesc[CsBracketedParameterList]): CsBracketedParameterList =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsBracketedParameterList];
    info: Info): CsBracketedParameterList =
  result = newCs(CsBracketedParameterList) # for indexer, and what else?
  result.plist = info.essentials[0]
  # I suspect parameters will come next. most likely unneeded, i can easily parse that text.

# method add*(parent: var CsBracketedParameterList; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsBracketedParameterList; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsBracketedParameterList; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsBracketedParameterList): string =
  todoimpl
  echo "--> in  gen*(c: var CsBracketedParameterList)"

# ============= CsBreakStatement ========

proc newCs*(t: typedesc[CsBreakStatement]): CsBreakStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsBreakStatement)

proc extract*(t: typedesc[CsBreakStatement]; info: Info): CsBreakStatement =
  echo info
  result = newCs(CsBreakStatement)
  # todoimpl

# method add*(parent: var CsBreakStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsBreakStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsBreakStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsBreakStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsBreakStatement)"

# ============= CsCasePatternSwitchLabel ========

proc newCs*(t: typedesc[CsCasePatternSwitchLabel]): CsCasePatternSwitchLabel =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsCasePatternSwitchLabel]; info: Info): CsCasePatternSwitchLabel =
  echo info
  result = newCs(CsCasePatternSwitchLabel)
  # todoimpl

method gen*(c: var CsCasePatternSwitchLabel): string =
  todoimpl
  echo "--> in  gen*(c: var CsCasePatternSwitchLabel)"

proc newCs*(t: typedesc[CsCaseSwitchLabel]): CsCaseSwitchLabel =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsCaseSwitchLabel]; info: Info): CsCaseSwitchLabel =
  echo info
  result = newCs(CsCaseSwitchLabel)
  # todoimpl

# method add*(parent: var CsCaseSwitchLabel; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsCaseSwitchLabel; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsCaseSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsCaseSwitchLabel): string =
  todoimpl
  echo "--> in  gen*(c: var CsCaseSwitchLabel)"

# ============= CsCastExpression ========

proc newCs*(t: typedesc[CsCastExpression]): CsCastExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCastExpression)

proc extract*(t: typedesc[CsCastExpression]; info: Info): CsCastExpression =
  echo info
  result = newCs(CsCastExpression)
  # todoimpl

# method add*(parent: var CsCastExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsCastExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsCastExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsCastExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsCastExpression)"

# ============= CsCatchClause ========

proc newCs*(t: typedesc[CsCatchClause]): CsCatchClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCatchClause)

proc extract*(t: typedesc[CsCatchClause]; info: Info): CsCatchClause =
  echo info
  result = newCs(CsCatchClause)
  # todoimpl

# method add*(parent: var CsCatchClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsCatchClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsCatchClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsCatchClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsCatchClause)"

# ============= CsCatchFilterClause ========

proc newCs*(t: typedesc[CsCatchFilterClause]): CsCatchFilterClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCatchFilterClause)

proc extract*(t: typedesc[CsCatchFilterClause]; info: Info): CsCatchFilterClause =
  echo info
  result = newCs(CsCatchFilterClause)
  # todoimpl

# method add*(parent: var CsCatchFilterClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsCatchFilterClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsCatchFilterClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsCatchFilterClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsCatchFilterClause)"

# ============= CsCatch ========

proc newCs*(t: typedesc[CsCatch]): CsCatch =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCatch)

proc extract*(t: typedesc[CsCatch]; info: Info): CsCatch =
  echo info
  result = newCs(CsCatch)
  # todoimpl

# method add*(parent: var CsCatch; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsCatch; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsCatch; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsCatch): string =
  todoimpl
  echo "--> in  gen*(c: var CsCatch)"

# ============= CsCheckedExpression ========

proc newCs*(t: typedesc[CsCheckedExpression]): CsCheckedExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCheckedExpression)

proc extract*(t: typedesc[CsCheckedExpression]; info: Info): CsCheckedExpression =
  echo info
  result = newCs(CsCheckedExpression)
  # todoimpl

# method add*(parent: var CsCheckedExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsCheckedExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsCheckedExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsCheckedExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsCheckedExpression)"

# ============= CsCheckedStatement ========

proc newCs*(t: typedesc[CsCheckedStatement]): CsCheckedStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsCheckedStatement)

proc extract*(t: typedesc[CsCheckedStatement]; info: Info): CsCheckedStatement =
  echo info
  result = newCs(CsCheckedStatement)

# method add*(parent: var CsCheckedStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsCheckedStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsCheckedStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsCheckedStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsCheckedStatement)"

method add*(parent: var CsProperty, item: CsAccessorList) =
  parent.acclist = item

method add*(parent: var CsMethod, item: CsAssignmentExpression) =
  parent.body.add item

method add*(parent: var CsMethod, item: CsIfStatement) =
  parent.body.add item
method add*(parent: var CsMethod, item: CsGenericName) =
  todoimpl # TODO

method add*(parent: var CsMethod, item: CsInvocationExpression) =
  parent.body.add item

method add*(parent: var CsMethod, item: CsVariableDeclarator) =
  parent.body.add item

method add*(parent: var CsEqualsValueClause, item: CsBinaryExpression) =
  echo "in method add*(parent: var CsEqualsValueClause, item: CsBinaryExpression)"
  if parent.rhsValue.isNil:
    parent.rhsValue = item
method add*(parent: var CsEqualsValueClause, item: CsMemberAccessExpression) =
  echo "in ", "method add*(parent: var CsEqualsValueClause, item: CsMemberAccessExpression)"
  if parent.rhsValue.isNil:
    parent.rhsValue = item
method add*(parent: var CsEqualsValueClause, item: CsObjectCreationExpression) =
  echo "in ", "method add*(parent: var CsEqualsValueClause, item: CsObjectCreationExpression)="
  if parent.rhsValue.isNil:
    parent.rhsValue = item
method add*(parent: var CsEqualsValueClause, item: CsLiteralExpression) =
  echo "in ", "method add*(parent: var CsEqualsValueClause, item: CsLiteralExpression)"
  if parent.rhsValue.isNil:
    parent.rhsValue = item

method add*(parent: var CsInvocationExpression, item: CsArgumentList) =
  parent.args = item

method add*(parent: var CsInvocationExpression,
    item: CsMemberAccessExpression) =
  echo "in add*(parent:var CsInvocationExpression, item: CsMemberAccessExpression)"
  echo "NOTIMPLEMENTED: i assume unneeded."

  # parent.callName


method add*(c: var CsIndexer, item: CsAccessorList) =
  c.aclist = item
# ============= CsClass ========

proc newCs*(t: typedesc[CsClass]; name: string; base = ""; impls: seq[
    string] = @[]): CsClass =
  new result
  result.typ = $typeof(t)

  result.name = name
  result.extends = base
  result.implements = impls

proc newCs*(t: typedesc[CsParameter]; a, b: string): CsParameter =
  new result
  result.typ = $typeof(t)
  #
  result.name = a
  result.ptype = b

method addSelfParam(m: var CsMethod) =
  let p = newCs(CsParameter, "this", m.parentClass)
  m.parameterList.parameters.insert(@[p], 0)

proc gen*(p: CsParameter): string =

  echo "--> in  gen*(p: CsParameter)"
  result = p.name & ": "
  if p.isRef:
    result &= "var "
  result &= p.ptype.strip

proc gen*(p: CsParameterList): string =

  echo "--> in  gen*(p: CsParameterList)"
  result = p.parameters.mapIt(it.gen()).join("; ")

import ../common_utils
proc gen*(m: var CsMethod): string =

  echo "--> in  gen*(m: var CsMethod)"
  echo "generating method (wip): " & m.name
  if not m.isStatic: result = "method " else: result = "proc "
  if not m.isStatic:
    m.addSelfParam()

  let parameterList = m.parameterList.gen()
  let returnType = if m.returnType != "void": m.returnType.replacementGenericTypes() else: ""
  let body =
    if m.body.len == 0: "discard"
    else:
      var lines: seq[string]
      for ln in m.body: # a sequence of bodyExpr -- only known at runtime.
        echo ln.typ, " ", ln.ttype
        let generatedString = ln.gen()
        echo "generated string for the method bodyexpr was: " & generatedString
        lines.add generatedString
      lines.join("\r\n  ")

  result &= m.name.lowerFirst & "(" & parameterList.replacementGenericTypes() & ")"
  if returnType != "": result &= ": " & returnType.replacementGenericTypes()
  result &= " ="
  result &= "\r\n  "

  result &= body

method gen*(c: var CsConstructor): string =

  echo "--> in  gen*(c: var CsConstructor)"
  echo "generating ctor (wip): (new)" & c.name
  result = "proc "

  let parameterList = c.parameterList.gen()
  let returnType = c.parentClass
  let body =
    if c.body.len == 0: "new result"
    else: c.body.mapIt(it.gen()).join("\r\n  ")

  result &= "new" & c.name & "(" & parameterList & ")"
  if returnType != "": result &= ": " & returnType
  result &= " ="
  result &= "\r\n  "

  result &= body

method gen*(c: var CsIndexer): string =

  echo "--> in  gen*(c: var CsIndexer)"
  echo "generating indexer"
  let x = c.firstVarType.rsplit(".", 1)[^1]
  var setPart, getPart: string
  # let sig =
  if c.hasDefaultGet:
    getPart = "proc `[]`*(this: var " & x & "; " & c.varName & ": " &
        c.varType & "): " & c.retType & " = discard"
  if c.hasDefaultSet:
    setPart = "proc `[]=`*(this: var " & x & "; " & c.varName & ": " &
        c.varType & "; value: " & c.retType & ") = discard"

  result &= getPart & "\n" & setPart

method gen*(c: CsProperty): string =
  echo "--> in  gen*(c: CsProperty)"
  result = ""
  if c.hasGet:
    result &= # this is a getter
      "method " & c.name.lowerFirst() &
      "*(this: " & c.parentClass & "): " & c.retType & " = " &
      "this.u_" & c.name
  if c.hasSet:
    result &=
      "method " & c.name.lowerFirst &
      "*(this: " & c.parentClass & ", value: " & c.retType & "): " & c.retType &
          " = " &
      "this.u_" & c.name & " = value"

# import ../type_utils

proc hasIndexer*(c: CsClass): bool =
  result = not c.indexer.isNil

import ../common_utils
proc getLastClass*(ns: CsNamespace): Option[CsClass] =
  # echo ns
  if ns.classes.len == 0:
    result = none(CsClass)
  else:
    result = some(ns.classes.last)

proc getLastMethod*(cls: CsClass): Option[CsMethod] =
  if cls.methods.len == 0: return
  else:
    return some(cls.methods.last)

proc getLastCtor*(cls: CsClass): Option[CsConstructor] =
  if cls.ctors.len == 0: return
  else:
    return some(cls.ctors.last)

import tables

import options
#[ proc lastAddedInfo(root: var CsRoot): string =
  var (p, ns) = state_utils.getCurrentNs(root)
  result = "current ns: " & p
  result &= " namespace added something: " & $ns.lastAddedTo.isSome
  if ns.lastAddedTo.isSome:
    result &= "last added in ns: " & $ns.lastAddedTo
    case ns.lastAddedTo.get
    of Unset: discard
    of NamespaceParts.Classes:
      let c = ns.getLastClass.get
      result &= "class is: " & c.name
      if c.lastAddedTo.isSome:
        result &= "class added something:" & $c.lastAddedTo.isSome
        result &= "it was: " & $c.lastAddedTo.get & "  "
        case c.lastAddedTo.get
        of ClassParts.Properties: result &= c.properties.last.name
        of ClassParts.Ctors: result &= c.ctors.last.name
        of ClassParts.Indexer: result &= c.indexer.varName
        of ClassParts.Methods: result &= c.methods.last.name
        # of ClassParts.Enums: result &= c.enums.last.name
        # of ClassParts.Fields: result &= c.fields.last.name
      of NamespaceParts.Interfaces:
        result &= ns.interfaces.last.name
      of NamespaceParts.Enums:
        let e = ns.enums.last
        result &= "enum is " & e.name
      ]#


    # proc getLastProperty(c: CsClass): Option[CsProperty] =
    #   assert c.lastAddedTo.isSome
    #   case c.lastAddedTo.get
    #   of ClassParts.Properties:
    #     # echo "~~~" & c.properties.mapIt(it.name)
    #     if c.properties.isEmpty:
    #       result = none(CsProperty)
    #     else:
    #       assert c.properties.len > 0
    #       var last = c.properties[^1]
    #       result = some(last)

    #   else: assert false, "Unsupported"



    # proc getLastProperty*(ns: CsNamespace): Option[CsProperty] =
    #   assert ns.lastAddedTo.isSome
    #   case ns.lastAddedTo.get
    #   of NamespaceParts.Interfaces: discard # TODO
    #   of NamespaceParts.Classes:
    #     let c = ns.getLastClass()
    #     if c.isNone: result = none(CsProperty)
    #     else:
    #       result = c.get.getLastProperty()
    #   of [NamespaceParts.Enums, NamespaceParts.Unset, NamespaceParts.Using]: discard


    # ===

method gen*(c: CsClass): string =
  echo "--> in  gen*(c: CsClass)"
  echo "generating class:" & c.name
  if c.isNil: result = "" else: result &= "type " & c.name & "* = ref object"
  if c.extends != "": result &= " of " & c.extends
  if c.fields.len > 0:
    result &= "\r\n"
    for f in c.fields:
      result &= "  " & f.gen()
  result &= "\r\n\r\n"

  echo "methods count: " & $c.methods.len
  echo "generating methods:"

  for m in c.methods.mitems:
    result &= m.gen()
    result &= "\r\n"
  echo "ctors count: " & $c.ctors.len
  for ctor in c.ctors.mitems:
    result &= ctor.gen()
    result &= "\r\n"
  echo "has Indexer: " & $c.hasIndexer
  if c.hasIndexer:
    result &= c.indexer.gen()
  echo "has properties: " & $c.properties.len
  for p in c.properties:
    result &= p.gen() & "\r\n"

method add*(parent: var CsClass; m: CsConstructor) =
  echo "adding ctor to class"

  parent.ctors.add m
  parent.lastAddedTo = some(Ctors)
  m.parentClass = parent.name

method add*(parent: var CsClass; m: CsMethod) =
  echo "adding method to class"
  parent.methods.add m
  parent.lastAddedTo = some(Methods)
  m.parentClass = parent.name


proc addField(parent: CsClass; name, typ: string) =
  var f = newCs(CsField)
  f.name = name
  f.isStatic = false
  f.isPublic = false
  f.thetype = typ
  parent.fields.add f

proc addFieldForProperty(parent: CsClass, item: CsProperty) =
  var fieldName = "u_" & item.name
  var fieldType = item.retType
  if fieldType == "":
    fieldType = hackFindType(item)

  parent.addField(fieldName, fieldType)


method add*(parent: var CsClass; item: CsEnum) =
  todoimpl #, " get the parent of class, i.e. namespace and add there." #TODO

method add*(parent: var CsClass; item: CsTypeParameterList) =
  echo "in method add*(parent: var CsClass; item: CsTypeParameterList)"
  # echo parent.name
  parent.genericTypeList = item.theTypes
  # todoimpl # TODO(add:CsClass, CsTypeParameterList)

method add*(parent: var CsClass; item: CsClass) =
  echo "in method add*(parent: var CsClass; item: CsClass)"
  todoimpl #, " get the parent of class, i.e. namespace and add there." #TODO

method add*(parent: var CsClass; item: CsField) =
  parent.fields.add item
method add*(parent: var CsClass; item: CsProperty) =
  parent.properties.add item
  parent.lastAddedTo = some(Properties)
  item.parentClass = parent.name
  if (item.hasGet or item.hasSet) and
    item.bodyGet.len == 0 and item.bodySet.len == 0:
    parent.addFieldForProperty(item)
# proc add*(parent: var CsClass; item: CsProperty; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: var CsClass; item: CsIndexer) =

  parent.indexer = item
  parent.lastAddedTo = some(Indexer)
  # item.parentName = parent.name

method add*(parent: var CsClass; item: CsBaseList) =
  if item.baseList.len > 0:
    parent.extends = item.baseList[0]
  if item.baseList.len > 1:
    parent.implements = item.baselist[1..^1]

# proc add*(parent: var CsClass; item: CsIndexer; data: AllNeededData) = parent.add(item) # TODO

# ============= CsClassOrStructConstraint ========

proc newCs*(t: typedesc[CsClassOrStructConstraint]): CsClassOrStructConstraint =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsClassOrStructConstraint]; info: Info): CsClassOrStructConstraint =
  echo info
  result = newCs(CsClassOrStructConstraint)
  # todoimpl

# method add*(parent: var CsClassOrStructConstraint; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsClassOrStructConstraint; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsClassOrStructConstraint; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsClassOrStructConstraint): string =
  todoimpl
  echo "--> in  gen*(c: var CsClassOrStructConstraint)"

# ============= CsConditionalAccessExpression ========

proc newCs*(t: typedesc[CsConditionalAccessExpression]): CsConditionalAccessExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConditionalAccessExpression)

proc extract*(t: typedesc[CsConditionalAccessExpression]; info: Info): CsConditionalAccessExpression =
  echo info
  result = newCs(CsConditionalAccessExpression)
  # todoimpl

# method add*(parent: var CsConditionalAccessExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsConditionalAccessExpression; item: Dummy) "
#   # if stopEarly: assert false

# proc add*(parent: var CsConditionalAccessExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsConditionalAccessExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsConditionalAccessExpression)"

# ============= CsConditionalExpression ========

proc newCs*(t: typedesc[CsConditionalExpression]): CsConditionalExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConditionalExpression)

proc extract*(t: typedesc[CsConditionalExpression]; info: Info): CsConditionalExpression =
  echo info
  result = newCs(CsConditionalExpression)
  # todoimpl

# method add*(parent: var CsConditionalExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsConditionalExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsConditionalExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsConditionalExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsConditionalExpression)"

# ============= CsConstantPattern ========

proc newCs*(t: typedesc[CsConstantPattern]): CsConstantPattern =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConstantPattern)

proc extract*(t: typedesc[CsConstantPattern]; info: Info): CsConstantPattern =
  echo info
  result = newCs(CsConstantPattern)
  # todoimpl

# method add*(parent: var CsConstantPattern; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsConstantPattern; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsConstantPattern; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsConstantPattern): string =
  todoimpl
  echo "--> in  gen*(c: var CsConstantPattern)"

# ============= CsConstructorConstraint ========

proc newCs*(t: typedesc[CsConstructorConstraint]): CsConstructorConstraint =
  new result
  result.typ = $typeof(t)
#TODO(create:CsConstructorConstraint)

proc extract*(t: typedesc[CsConstructorConstraint]; info: Info): CsConstructorConstraint =
  echo info
  result = newCs(CsConstructorConstraint)
  # todoimpl

# method add*(parent: var CsConstructorConstraint; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsConstructorConstraint; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsConstructorConstraint; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsConstructorConstraint): string =
  todoimpl
  echo "--> in  gen*(c: var CsConstructorConstraint)"

# ============= CsConstructorInitializer ========

proc newCs*(t: typedesc[CsConstructorInitializer]): CsConstructorInitializer =
  new result
  result.typ = $typeof(t)


proc extract*(t: typedesc[CsConstructorInitializer];
    info: Info): CsConstructorInitializer =
  echo info
  result = newCs(CsConstructorInitializer)

# proc add*(parent: var CsConstructorInitializer; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsConstructorInitializer): string =
  todoimpl
  echo "--> in  gen*(c: var CsConstructorInitializer)"

# ============= CsConstructor ========

proc newCs*(t: typedesc[CsConstructor]; name: string): CsConstructor =
  new result
  result.typ = $typeof(t)

  result.name = name

proc extract*(t: typedesc[CsConstructor]; info: Info): CsConstructor =
  let name = info.essentials[0]
  let m = newCs(CsConstructor, name)
  result = m

method add*(parent: var CsConstructor; item: CsLocalDeclarationStatement) =
  todoimpl # TODO

method add*(parent: var CsConstructor; item: CsArgumentList) =
  assert (parent.initializer != nil)
  assert parent.initializerArgList.isNil
  parent.initializerArgList = item

method add*(parent: var CsConstructor; item: CsParameterList) =
  parent.parameterList = item

# proc add*(parent: var CsConstructor; item: CsParameterList; data: AllNeededData) = parent.add(item) # TODO

# ============= CsContinueStatement ========

proc newCs*(t: typedesc[CsContinueStatement]): CsContinueStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsContinueStatement)

proc extract*(t: typedesc[CsContinueStatement]; info: Info): CsContinueStatement =
  echo info
  result = newCs(CsContinueStatement)
  # todoimpl

# method add*(parent: var CsContinueStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsContinueStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsContinueStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsContinueStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsContinueStatement)"

# ============= CsConversionOperator ========

proc newCs*(t: typedesc[CsConversionOperator]): CsConversionOperator =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsConversionOperator]; info: Info): CsConversionOperator =
  echo info
  result = newCs(CsConversionOperator)
  # todoimpl

# method add*(parent: var CsConversionOperator; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsConversionOperator; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsConversionOperator; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsConversionOperator): string =
  todoimpl
  echo "--> in  gen*(c: var CsConversionOperator)"

# ============= CsDeclarationExpression ========

proc newCs*(t: typedesc[CsDeclarationExpression]): CsDeclarationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDeclarationExpression)

proc extract*(t: typedesc[CsDeclarationExpression]; info: Info): CsDeclarationExpression =
  echo info
  result = newCs(CsDeclarationExpression)
  # todoimpl

# method add*(parent: var CsDeclarationExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsDeclarationExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsDeclarationExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsDeclarationExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsDeclarationExpression)"

# ============= CsDeclarationPattern ========

proc newCs*(t: typedesc[CsDeclarationPattern]): CsDeclarationPattern =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDeclarationPattern)

proc extract*(t: typedesc[CsDeclarationPattern]; info: Info): CsDeclarationPattern =
  echo info
  result = newCs(CsDeclarationPattern)
  # todoimpl

# method add*(parent: var CsDeclarationPattern; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsDeclarationPattern; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsDeclarationPattern; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsDeclarationPattern): string =
  todoimpl
  echo "--> in  gen*(c: var CsDeclarationPattern)"

# ============= CsDefaultExpression ========

proc newCs*(t: typedesc[CsDefaultExpression]): CsDefaultExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDefaultExpression)

proc extract*(t: typedesc[CsDefaultExpression]; info: Info): CsDefaultExpression =
  echo info
  result = newCs(CsDefaultExpression)
  # todoimpl

# method add*(parent: var CsDefaultExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsDefaultExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsDefaultExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsDefaultExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsDefaultExpression)"

# ============= CsDefaultSwitchLabel ========

proc newCs*(t: typedesc[CsDefaultSwitchLabel]): CsDefaultSwitchLabel =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDefaultSwitchLabel)

proc extract*(t: typedesc[CsDefaultSwitchLabel]; info: Info): CsDefaultSwitchLabel =
  echo info
  result = newCs(CsDefaultSwitchLabel)
  # todoimpl

# method add*(parent: var CsDefaultSwitchLabel; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsDefaultSwitchLabel; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsDefaultSwitchLabel; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsDefaultSwitchLabel): string =
  todoimpl
  echo "--> in  gen*(c: var CsDefaultSwitchLabel)"

# ============= CsDelegate ========

proc newCs*(t: typedesc[CsDelegate]): CsDelegate =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDelegate)

proc extract*(t: typedesc[CsDelegate]; info: Info): CsDelegate =
  result = newCs(CsDelegate)
  echo info
  # todoimpl
  # todo. get name, but probably following constructs fill it well.

# method add*(parent: var CsDelegate; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsDelegate; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsDelegate; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsDelegate): string =
  todoimpl
  echo "--> in  gen*(c: var CsDelegate)"

# ============= CsDestructor ========

proc newCs*(t: typedesc[CsDestructor]): CsDestructor =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDestructor)

proc extract*(t: typedesc[CsDestructor]; info: Info): CsDestructor =
  echo info
  result = newCs(CsDestructor)
  # todoimpl

# method add*(parent: var CsDestructor; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsDestructor; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsDestructor; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsDestructor): string =
  todoimpl
  echo "--> in  gen*(c: var CsDestructor)"

# ============= CsDiscardDesignation ========

proc newCs*(t: typedesc[CsDiscardDesignation]): CsDiscardDesignation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDiscardDesignation)

proc extract*(t: typedesc[CsDiscardDesignation]; info: Info): CsDiscardDesignation =
  echo info
  result = newCs(CsDiscardDesignation)
  # todoimpl

# method add*(parent: var CsDiscardDesignation; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsDiscardDesignation; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsDiscardDesignation; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsDiscardDesignation): string =
  todoimpl
  echo "--> in  gen*(c: var CsDiscardDesignation)"

# ============= CsDoStatement ========

proc newCs*(t: typedesc[CsDoStatement]): CsDoStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsDoStatement)

proc extract*(t: typedesc[CsDoStatement]; info: Info): CsDoStatement =
  echo info
  result = newCs(CsDoStatement)
  # todoimpl

# method add*(parent: var CsDoStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsDoStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsDoStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsDoStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsDoStatement)"

# ============= CsElementAccessExpression ========

proc newCs*(t: typedesc[CsElementAccessExpression]): CsElementAccessExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsElementAccessExpression)

proc extract*(t: typedesc[CsElementAccessExpression]; info: Info): CsElementAccessExpression =
  echo info
  result = newCs(CsElementAccessExpression)
  # we add to it later. #todoimpl

# method add*(parent: var CsElementAccessExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsElementAccessExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsElementAccessExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsElementAccessExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsElementAccessExpression)"

# ============= CsElementBindingExpression ========

proc newCs*(t: typedesc[CsElementBindingExpression]): CsElementBindingExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsElementBindingExpression)

proc extract*(t: typedesc[CsElementBindingExpression]; info: Info): CsElementBindingExpression =
  echo info
  result = newCs(CsElementBindingExpression)
  # todoimpl

# method add*(parent: var CsElementBindingExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsElementBindingExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsElementBindingExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsElementBindingExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsElementBindingExpression)"

# ============= CsElseClause ========

proc newCs*(t: typedesc[CsElseClause]): CsElseClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsElseClause)

proc extract*(t: typedesc[CsElseClause]; info: Info): CsElseClause =
  echo info
  result = newCs(CsElseClause)
  # todoimpl

# method add*(parent: var CsElseClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsElseClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsElseClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsElseClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsElseClause)"

# ============= CsEmptyStatement ========

proc newCs*(t: typedesc[CsEmptyStatement]): CsEmptyStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEmptyStatement)

proc extract*(t: typedesc[CsEmptyStatement]; info: Info): CsEmptyStatement =
  echo info
  result = newCs(CsEmptyStatement)

# method add*(parent: var CsEmptyStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsEmptyStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsEmptyStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsEmptyStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsEmptyStatement)"

proc newCs*(t: typedesc[CsEnumMember]; name, value: auto): CsEnumMember =
  new result
  result.typ = $typeof(t)

  result.name = name
  result.value = value

proc extract*(t: typedesc[CsEnumMember]; info: Info): CsEnumMember =
  let name = info.essentials[0]
  let value =
    if info.essentials.len < 2: ""
    else:
      info.essentials[1]

  result = newCs(CsEnumMember, name, value)

method add*(em: CsEnumMember; val: string) =
  if em.value.isEmptyOrWhitespace:
    em.value = val.strip
  else: echo "value is already set:`", em.value, "`. got `", val, "`;"

proc gen*(e: CsEnumMember): string =

  echo "--> in  gen*(e: CsEnumMember)"
  result = e.name
  if e.value != "": result &= " = " & $e.value

proc newCs*(t: typedesc[CsEnum]; name: string): CsEnum =
  new result
  result.typ = $typeof(t)

  result.name = name

proc extract*(t: typedesc[CsEnum]; info: Info): CsEnum =
  assert info.essentials.len > 0
  let name = info.essentials[0]
  result = newCs(CsEnum, name)

method add*(parent: var CsEnum; item: CsEnumMember) =

  parent.items.add item
# proc add*(parent: var CsEnum; item: CsEnumMember; data: AllNeededData) = parent.add(item) # TODO

proc gen*(e: CsEnum): string =

  echo "--> in  gen*(e: CsEnum)"
  echo "members count:" & $e.items.len

  result = "type " & e.name & "* = enum"
  if e.items.len > 0:
    result &= "\n  "
    let strs = e.items.mapIt(it.gen())
    result &= strs.join(", ")
  # echo result

# ============= CsEqualsValueClause ========

method add*(em: var CsEnumMember; item: CsEqualsValueClause) =
  em.add(item.value)

proc newCs*(t: typedesc[CsEqualsValueClause];
    name: string): CsEqualsValueClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEqualsValueClause)

proc extract*(t: typedesc[CsEqualsValueClause];
    info: Info): CsEqualsValueClause =
  echo info
  let val = info.essentials[0]
  result = newCs(CsEqualsValueClause, val)

# method add*(parent: var CsEqualsValueClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsEqualsValueClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsEqualsValueClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsEqualsValueClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsEqualsValueClause)"

# ============= CsEventField ========

proc newCs*(t: typedesc[CsEventField]): CsEventField =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEventField)

proc extract*(t: typedesc[CsEventField]; info: Info): CsEventField =
  echo info
  result = newCs(CsEventField)
  # todoimpl

# method add*(parent: var CsEventField; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsEventField; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsEventField; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsEventField): string =
  todoimpl
  echo "--> in  gen*(c: var CsEventField)"

# ============= CsEvent ========

proc newCs*(t: typedesc[CsEvent]): CsEvent =
  new result
  result.typ = $typeof(t)
#TODO(create:CsEvent)

proc extract*(t: typedesc[CsEvent]; info: Info): CsEvent =
  echo info
  result = newCs(CsEvent)
  # todoimpl

# method add*(parent: var CsEvent; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsEvent; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsEvent; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsEvent): string =
  todoimpl
  echo "--> in  gen*(c: var CsEvent)"

# ============= CsExplicitInterfaceSpecifier ========

proc newCs*(t: typedesc[CsExplicitInterfaceSpecifier];
    name: string): CsExplicitInterfaceSpecifier =
  new result
  result.typ = $typeof(t)

  result.name = name

proc extract*(t: typedesc[CsExplicitInterfaceSpecifier];
    info: Info): CsExplicitInterfaceSpecifier = #TODO(extract:CsExplicitInterfaceSpecifier)
  let name = info.essentials[0]
  result = newCs(CsExplicitInterfaceSpecifier, name)

# proc add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy, data:AllNeededData) = parent.add(item) # TODO
# method add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsExplicitInterfaceSpecifier; item: Dummy) "
#   #   assert false # TODO(add:CsExplicitInterfaceSpecifier)

# method gen*(c: var CsExplicitInterfaceSpecifier): string = assert false #TODO(gen:CsExplicitInterfaceSpecifier)

# A method body's line.

method add*(c: var CsConstructor; item: CsExpressionStatement) =
  c.body.add(item)
method add*(c: var CsConstructor; item: CsAssignmentExpression) =
  c.body.add(item)
method add*(c: var CsConstructor; item: CsConstructorInitializer) =
  c.initializer = item

proc newCs*(t: typedesc[CsExpressionStatement]): CsExpressionStatement =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsExpressionStatement"
  # result.typ = $typeof(t)

proc extract*(t: typedesc[CsExpressionStatement];
    info: Info): CsExpressionStatement =
  result = newCs(CsExpressionStatement)

method add*(parent: var CsExpressionStatement; item: CsArgumentList) =
  parent.args = item

method add*(parent: var CsTypeArgumentList; item: CsPredefinedType) =
  parent.types.add item.name
method add*(parent: var CsArgument; item: CsLiteralExpression) =
  parent.value = item.gen() # todo:shortcut

method add*(parent: var CsArgumentList; item: CsArgument) =
  parent.args.add item

method add*(parent: var CsExpressionStatement; item: CsAssignmentExpression) =
  todoimpl # TODO

method add*(parent: var CsExpressionStatement; item: CsArgument) =
  parent.args.add item

# proc add*(parent: var CsExpressionStatement; item: CsArgumentList; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: var CsExpressionStatement; item: CsInvocationExpression) =
  parent.call = item

# proc add*(parent: var CsExpressionStatement; item: CsInvocationExpression; data: AllNeededData) = parent.add(item) # TODO

method gen*(c: CsExpressionStatement): string =
  echo "--> in  gen*(c: CsExpressionStatement)"
  echo "generating for expression statement"
  echo "source is: " & c.src.strip()
  if not c.call.isNil:
    result = c.call.gen()
    # if c.args.args.len > 0:
    #   result &= c.args.gen()
    # result &= ")"
    if c.call.callName.contains(".") and c.call.callName.startsWith(re.re"[A-Z]"):
      result &= " # " & c.call.callName.rsplit(".", 1)[0]
  echo "expression statement generated result: " & result

# ============= CsExternAliasDirective ========

proc newCs*(t: typedesc[CsExternAliasDirective];
    name: string): CsExternAliasDirective =
  new result
  result.typ = $typeof(t)
#TODO(create:CsExternAliasDirective)

proc extract*(t: typedesc[CsExternAliasDirective];
    info: Info): CsExternAliasDirective =
  echo info
  let name = "" # info.essentials[0] # TODO!! cs environ got messed up after last extension update. after fixing, add name to info
  result = newCs(t, name) # rare, it's a name for the dll when ns+class ambiguity occurs, should be in Namespace i think.

# method add*(parent: var CsExternAliasDirective; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsExternAliasDirective; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsExternAliasDirective; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsExternAliasDirective): string =
  todoimpl
  echo "--> in  gen*(c: var CsExternAliasDirective)"
# hmm, it's actually called a property.

# ============= CsFinallyClause ========

proc newCs*(t: typedesc[CsFinallyClause]): CsFinallyClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsFinallyClause)

proc extract*(t: typedesc[CsFinallyClause]; info: Info): CsFinallyClause =
  echo info
  result = newCs(CsFinallyClause)

# method add*(parent: var CsFinallyClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsFinallyClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsFinallyClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsFinallyClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsFinallyClause)"

# ============= CsFixedStatement ========

proc newCs*(t: typedesc[CsFixedStatement]): CsFixedStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsFixedStatement)

proc extract*(t: typedesc[CsFixedStatement]; info: Info): CsFixedStatement =
  echo info
  result = newCs(CsFixedStatement)
  # todoimpl

# method add*(parent: var CsFixedStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsFixedStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsFixedStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsFixedStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsFixedStatement)"

# ============= CsForEachStatement ========

proc newCs*(t: typedesc[CsForEachStatement]): CsForEachStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsForEachStatement)

proc extract*(t: typedesc[CsForEachStatement]; info: Info): CsForEachStatement =
  echo info
  result = newCs(CsForEachStatement)
  # todoimpl

# method add*(parent: var CsForEachStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsForEachStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsForEachStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsForEachStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsForEachStatement)"

# ============= CsForEachVariableStatement ========

proc newCs*(t: typedesc[CsForEachVariableStatement]): CsForEachVariableStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsForEachVariableStatement)

proc extract*(t: typedesc[CsForEachVariableStatement]; info: Info): CsForEachVariableStatement =
  echo info
  result = newCs(CsForEachVariableStatement)
  # todoimpl

# method add*(parent: var CsForEachVariableStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsForEachVariableStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsForEachVariableStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsForEachVariableStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsForEachVariableStatement)"

# ============= CsForStatement ========

proc newCs*(t: typedesc[CsForStatement]): CsForStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsForStatement)

proc extract*(t: typedesc[CsForStatement]; info: Info): CsForStatement =
  echo "in proc extract*(t: typedesc[CsForStatement];    info: Info): CsForStatement"
  echo info
  result = newCs(t)
  # todoimpl

# method add*(parent: var CsForStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsForStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsForStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsForStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsForStatement)"

# ============= CsFromClause ========

proc newCs*(t: typedesc[CsFromClause]): CsFromClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsFromClause)

proc extract*(t: typedesc[CsFromClause]; info: Info): CsFromClause =
  echo info
  result = newCs(CsFromClause)
  # todoimpl

# method add*(parent: var CsFromClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsFromClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsFromClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsFromClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsFromClause)"

proc newCs*(t: typedesc[CsGenericName]): CsGenericName =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGenericName)

proc extract*(t: typedesc[CsGenericName]; info: Info): CsGenericName =
  result = newCs(t)
  # assert false #TODO(extract:CsGenericName)

# method add*(parent: var CsGenericName; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsGenericName; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsGenericName; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsGenericName): string =
  todoimpl
  echo "--> in  gen*(c: var CsGenericName)"

# ============= CsGlobalStatement ========

proc newCs*(t: typedesc[CsGlobalStatement]): CsGlobalStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGlobalStatement)

proc extract*(t: typedesc[CsGlobalStatement]; info: Info): CsGlobalStatement =
  echo info
  result = newCs(CsGlobalStatement)
  # todoimpl

# method add*(parent: var CsGlobalStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsGlobalStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsGlobalStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsGlobalStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsGlobalStatement)"

# ============= CsGotoStatement ========

proc newCs*(t: typedesc[CsGotoStatement]): CsGotoStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGotoStatement)

proc extract*(t: typedesc[CsGotoStatement]; info: Info): CsGotoStatement =
  echo info
  result = newCs(CsGotoStatement)
  # todoimpl

# method add*(parent: var CsGotoStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsGotoStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsGotoStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsGotoStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsGotoStatement)"

# ============= CsGroupClause ========

proc newCs*(t: typedesc[CsGroupClause]): CsGroupClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsGroupClause)

proc extract*(t: typedesc[CsGroupClause]; info: Info): CsGroupClause =
  echo info
  result = newCs(CsGroupClause)
  # todoimpl

# method add*(parent: var CsGroupClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsGroupClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsGroupClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsGroupClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsGroupClause)"

# ============= CsIfStatement ========

proc newCs*(t: typedesc[CsIfStatement]): CsIfStatement =
  new result
  result.typ = $typeof(t)
  result.ttype = $typeof(t)
#TODO(create:CsIfStatement)

proc extract*(t: typedesc[CsIfStatement]; info: Info): CsIfStatement =
  echo info
  result = newCs(CsIfStatement)
  # todoimpl


# method add*(parent: var CsIfStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsIfStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsIfStatement; item: Dummy; data: AllNeededData) = parent.add(item)


# ============= CsImplicitArrayCreationExpression ========

proc newCs*(t: typedesc[CsImplicitArrayCreationExpression]): CsImplicitArrayCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsImplicitArrayCreationExpression)

proc extract*(t: typedesc[CsImplicitArrayCreationExpression]; info: Info): CsImplicitArrayCreationExpression =
  echo info
  result = newCs(CsImplicitArrayCreationExpression)
  # todoimpl

# method add*(parent: var CsImplicitArrayCreationExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsImplicitArrayCreationExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsImplicitArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsImplicitArrayCreationExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsImplicitArrayCreationExpression)"

# ============= CsImplicitElementAccess ========

proc newCs*(t: typedesc[CsImplicitElementAccess]): CsImplicitElementAccess =
  new result
  result.typ = $typeof(t)
#TODO(create:CsImplicitElementAccess)

proc extract*(t: typedesc[CsImplicitElementAccess]; info: Info): CsImplicitElementAccess =
  echo info
  result = newCs(CsImplicitElementAccess)
  # todoimpl

# method add*(parent: var CsImplicitElementAccess; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsImplicitElementAccess; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsImplicitElementAccess; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsImplicitElementAccess): string =
  todoimpl
  echo "--> in  gen*(c: var CsImplicitElementAccess)"

# ============= CsIncompleteMember ========

proc newCs*(t: typedesc[CsIncompleteMember]): CsIncompleteMember =
  new result
  result.typ = $typeof(t)
#TODO(create:CsIncompleteMember)

proc extract*(t: typedesc[CsIncompleteMember]; info: Info): CsIncompleteMember =
  echo info
  result = newCs(CsIncompleteMember)
  # todoimpl

# method add*(parent: var CsIncompleteMember; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsIncompleteMember; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsIncompleteMember; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsIncompleteMember): string =
  todoimpl
  echo "--> in  gen*(c: var CsIncompleteMember)"

# ============= CsIndexer ========

proc newCs*(t: typedesc[CsIndexer]): CsIndexer =
  new result
  result.typ = $typeof(t)

  result.hasDefaultGet = true
  result.hasDefaultSet = true

proc extract*(t: typedesc[CsIndexer]; info: Info): CsIndexer =
  echo "extract info:", info
  result = newCs(CsIndexer)

method add*(parent: var CsIndexer; item: CsParameter) =
  parent.varName = item.name
  parent.varType = item.ptype

method add*(parent: var CsIndexer; item: CsBracketedParameterList) =
  discard # add (csindexer, csparameter) already does what we need. because indexer has just one parameter.

method add*(parent: var CsIndexer; item: CsPredefinedType) =

  parent.retType = item.name
# proc add*(parent: var CsIndexer; item: CsPredefinedType; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: var CsIndexer; item: CsExplicitInterfaceSpecifier) =

  parent.firstVarType = item.name
# proc add*(parent: var CsIndexer; item: CsExplicitInterfaceSpecifier; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: CsLiteralExpression; item: CsPrefixUnaryExpression) =
  parent.value = item.prefix & parent.value

# proc addBExpr(p: CsInitializerExpression; b: BodyExpr) =
#   echo "in addBExpr: " & b.typ
#   if p.somePrefixOp.isNil:
#     p.bexprs.add b
#   else:
#     case b.typ
#     of "CsLiteralExpression":
#     # method add*(parent: var CsLiteralExpression; item: CsPrefixUnaryExpression) =
#       CsLiteralExpression(b).add(p.somePrefixOp) # first apply prefix to obj
#       p.bexprs.add b # and then add applied-obj to list.
#     else: assert false
#     p.somePrefixOp = nil # disable the op.

proc newCs*(t: typedesc[CsInitializerExpression]): CsInitializerExpression =
  new result
  result.typ = $typeof(t)

#TODO(create:CsInitializerExpression)

proc extract*(t: typedesc[CsInitializerExpression];
    info: Info): CsInitializerExpression =
  result = newCs(t)
  if info.essentials.len > 1:
    result.valueReceived = info.essentials[1]
  echo "haven't really implemented: proc extract*(t: typedesc[CsInitializerExpression]; info: Info): CsInitializerExpression "
  echo info # Info: InitializerExpression;; @["3", "15, 25, 5"];; @[]
  # 3 is arity. now it's possible they won't be simple literals. the following objects should provide more info.
  # for now we can store them as they are, or just make room, expect 3 more "expressions" or whatever.

# method add*(parent: var CsInitializerExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsInitializerExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsInitializerExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsInitializerExpression): string =
  echo "--> in  gen*(c: var CsInitializerExpression)"
  echo "gen CsInitializerExpression, got values:", c.valueReceived
  # result = ".initWith("
  result = ".initWith(@["
  var ls: seq[string] = @[]
  for b in c.bexprs:
    ls.add b.gen()
  result &= ls.join(", ")
  # result &= ")"
  result &= "])"
  echo "gen result CsInitializerExpression" & result

# ============= CsInterface ========

proc newCs*(t: typedesc[CsInterface]): CsInterface =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterface)

proc extract*(t: typedesc[CsInterface]; info: Info): CsInterface =
  echo info
  result = newCs(CsInterface)
  # todoimpl

method add*(parent: var CsInterface; item: CsProperty) =
  todoimpl # TODO(add:CsInterface)

# proc add*(parent: var CsInterface; item: CsProperty; data: AllNeededData) = parent.add(item) # TODO

method gen*(c: var CsInterface): string =
  todoimpl
  echo "--> in  gen*(c: var CsInterface)"

# ============= CsInterpolatedStringExpression ========

proc newCs*(t: typedesc[CsInterpolatedStringExpression]): CsInterpolatedStringExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolatedStringExpression)

proc extract*(t: typedesc[CsInterpolatedStringExpression]; info: Info): CsInterpolatedStringExpression =
  echo info
  result = newCs(CsInterpolatedStringExpression)
  # todoimpl

# method add*(parent: var CsInterpolatedStringExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsInterpolatedStringExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsInterpolatedStringExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsInterpolatedStringExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsInterpolatedStringExpression)"

# ============= CsInterpolatedStringText ========

proc newCs*(t: typedesc[CsInterpolatedStringText]): CsInterpolatedStringText =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolatedStringText)

proc extract*(t: typedesc[CsInterpolatedStringText]; info: Info): CsInterpolatedStringText =
  echo info
  result = newCs(CsInterpolatedStringText)
  # todoimpl

# method add*(parent: var CsInterpolatedStringText; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsInterpolatedStringText; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsInterpolatedStringText; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsInterpolatedStringText): string =
  todoimpl
  echo "--> in  gen*(c: var CsInterpolatedStringText)"

# ============= CsInterpolationAlignmentClause ========

proc newCs*(t: typedesc[CsInterpolationAlignmentClause]): CsInterpolationAlignmentClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolationAlignmentClause)

proc extract*(t: typedesc[CsInterpolationAlignmentClause]; info: Info): CsInterpolationAlignmentClause =
  echo info
  result = newCs(CsInterpolationAlignmentClause)
  # todoimpl

# method add*(parent: var CsInterpolationAlignmentClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsInterpolationAlignmentClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsInterpolationAlignmentClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsInterpolationAlignmentClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsInterpolationAlignmentClause)"

# ============= CsInterpolationFormatClause ========

proc newCs*(t: typedesc[CsInterpolationFormatClause]): CsInterpolationFormatClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolationFormatClause)

proc extract*(t: typedesc[CsInterpolationFormatClause]; info: Info): CsInterpolationFormatClause =
  echo info
  result = newCs(CsInterpolationFormatClause)
  # todoimpl

# method add*(parent: var CsInterpolationFormatClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsInterpolationFormatClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsInterpolationFormatClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsInterpolationFormatClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsInterpolationFormatClause)"

# ============= CsInterpolation ========

proc newCs*(t: typedesc[CsInterpolation]): CsInterpolation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsInterpolation)

proc extract*(t: typedesc[CsInterpolation]; info: Info): CsInterpolation =
  echo info
  result = newCs(CsInterpolation)
  # todoimpl

# method add*(parent: var CsInterpolation; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsInterpolation; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsInterpolation; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsInterpolation): string =
  todoimpl
  echo "--> in  gen*(c: var CsInterpolation)"

# ============= CsInvocationExpression ========

proc newCs*(t: typedesc[CsInvocationExpression];
    name: string): CsInvocationExpression =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsInvocationExpression"
  result.callName = name

proc extract*(t: typedesc[CsInvocationExpression];
    info: Info): CsInvocationExpression =
  let name = info.essentials[0]
  result = newCs(CsInvocationExpression, name)

func normalizeCallName(s: string): string =
  assert s.contains(".") and s.startsWith(re.re"[A-Z]")
  let parts = s.rsplit(".", 1)
  let lastPart = parts[1] # last part is the function name that was called.
  result = lastPart.lowerFirst()


method gen*(c: CsInvocationExpression): string =
  echo "--> in  gen*(c: CsInvocationExpression)"
  result = if c.callName.contains(".") and c.callName.startsWith(re.re"[A-Z]"):
    normalizeCallName(c.callName)
  elif c.callName.startsWith(re.re"[A-Z]"):
    c.callName.lowerFirst()
  else:
    c.callName

  result &= "("
  if c.args != nil and c.args.args.len > 0:
    let args = c.args.args.mapIt(it.value).join(", ")
    result &= args
  result &= ")"

proc newCs*(t: typedesc[CsIsPatternExpression]): CsIsPatternExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsIsPatternExpression)

proc extract*(t: typedesc[CsIsPatternExpression]; info: Info): CsIsPatternExpression =
  echo info
  result = newCs(CsIsPatternExpression)
  # todoimpl

# method add*(parent: var CsIsPatternExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsIsPatternExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsIsPatternExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsIsPatternExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsIsPatternExpression)"

# ============= CsJoinClause ========

proc newCs*(t: typedesc[CsJoinClause]): CsJoinClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsJoinClause)

proc extract*(t: typedesc[CsJoinClause]; info: Info): CsJoinClause =
  echo info
  result = newCs(CsJoinClause)
  # todoimpl

# method add*(parent: var CsJoinClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsJoinClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsJoinClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsJoinClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsJoinClause)"

# ============= CsJoinIntoClause ========

proc newCs*(t: typedesc[CsJoinIntoClause]): CsJoinIntoClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsJoinIntoClause)

proc extract*(t: typedesc[CsJoinIntoClause]; info: Info): CsJoinIntoClause =
  echo info
  result = newCs(CsJoinIntoClause)
  # todoimpl

# method add*(parent: var CsJoinIntoClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsJoinIntoClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsJoinIntoClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsJoinIntoClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsJoinIntoClause)"

# ============= CsLabeledStatement ========

proc newCs*(t: typedesc[CsLabeledStatement]): CsLabeledStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLabeledStatement)

proc extract*(t: typedesc[CsLabeledStatement]; info: Info): CsLabeledStatement =
  echo info
  result = newCs(CsLabeledStatement)
  # todoimpl

# method add*(parent: var CsLabeledStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsLabeledStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsLabeledStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsLabeledStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsLabeledStatement)"

# ============= CsLetClause ========

proc newCs*(t: typedesc[CsLetClause]): CsLetClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLetClause)

proc extract*(t: typedesc[CsLetClause]; info: Info): CsLetClause =
  echo info
  result = newCs(CsLetClause)
  # todoimpl

# method add*(parent: var CsLetClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsLetClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsLetClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsLetClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsLetClause)"

# ============= CsLiteralExpression ========


method add*(parent: var CsInitializerExpression; item: CsMemberAccessExpression) =
  parent.bexprs.add item
  todoimpl # TODO
method add*(parent: var CsInitializerExpression; item: CsInitializerExpression) =
  parent.bexprs.add item
  todoimpl # TODO
method add*(parent: var CsInitializerExpression; item: CsAssignmentExpression) =
  parent.bexprs.add item
  todoimpl # TODO
method add*(parent: var CsInitializerExpression; item: CsObjectCreationExpression) =
  parent.bexprs.add item
  todoimpl #TODO
method add*(parent: var CsInitializerExpression; item: CsPrefixUnaryExpression) =
  parent.bexprs.add item

method add*(parent: var CsInitializerExpression; item: CsLiteralExpression) =
  parent.bexprs.add item

method add*(parent: var CsBaseList; item: CsSimpleBaseType) =
  parent.baseList2.add item
  parent.baseList.add item.name

method add*(parent: var CsBracketedParameterList; item: CsParameter) =
  parent.plist.add item.gen()

method add*(parent: var CsPrefixUnaryExpression; item: CsLiteralExpression) =
  parent.actingOn = item.CsObject

method add*(em: var CsEnumMember; item: CsLiteralExpression) =
  em.add(item.value)
proc newCs(t: typedesc[CsLiteralExpression]; val: string): CsLiteralExpression =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsLiteralExpression"
  result.value = val

proc extract*(_: typedesc[CsLiteralExpression];
    info: Info): CsLiteralExpression =
  let strVal = info.essentials[0]
  result = newCs(CsLiteralExpression, strVal)

method gen*(lit: CsLiteralExpression): string =

  echo "--> in  gen*(lit: CsLiteralExpression)"
  lit.value

# ============= CsLocalDeclarationStatement ========

# proc add*(parent: var CsLocalDeclarationStatement; item: Dummy; data: AllNeededData) = parent.add(item)

# ============= CsLocalFunctionStatement ========

proc newCs*(t: typedesc[CsLocalFunctionStatement]): CsLocalFunctionStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLocalFunctionStatement)

proc extract*(t: typedesc[CsLocalFunctionStatement]; info: Info): CsLocalFunctionStatement =
  echo info
  result = newCs(CsLocalFunctionStatement)
  # todoimpl

# method add*(parent: var CsLocalFunctionStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsLocalFunctionStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsLocalFunctionStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsLocalFunctionStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsLocalFunctionStatement)"

proc newCs*(t: typedesc[CsAssignmentExpression]): CsAssignmentExpression =
  new result
  result.typ = $typeof(t)

# ============= CsLockStatement ========

proc newCs*(t: typedesc[CsLockStatement]): CsLockStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsLockStatement)

proc extract*(t: typedesc[CsLockStatement]; info: Info): CsLockStatement =
  echo info
  result = newCs(CsLockStatement)
  # todoimpl

# method add*(parent: var CsLockStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsLockStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsLockStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsLockStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsLockStatement)"

# ============= CsMakeRefExpression ========

proc newCs*(t: typedesc[CsMakeRefExpression]): CsMakeRefExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsMakeRefExpression)

proc extract*(t: typedesc[CsMakeRefExpression]; info: Info): CsMakeRefExpression =
  echo info
  result = newCs(CsMakeRefExpression)
  # todoimpl

# method add*(parent: var CsMakeRefExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsMakeRefExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsMakeRefExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsMakeRefExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsMakeRefExpression)"

# ============= CsMemberBindingExpression ========

proc newCs*(t: typedesc[CsMemberBindingExpression]): CsMemberBindingExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsMemberBindingExpression)

proc extract*(t: typedesc[CsMemberBindingExpression]; info: Info): CsMemberBindingExpression =
  echo info
  result = newCs(CsMemberBindingExpression)
  # todoimpl

# method add*(parent: var CsMemberBindingExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsMemberBindingExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsMemberBindingExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsMemberBindingExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsMemberBindingExpression)"

proc newCs*(t: typedesc[CsMethod]; name: string): CsMethod =
  new result
  result.typ = $typeof(t)

  result.name = name

method add*(parent: var CsMethod; t: CsPredefinedType) =
  parent.returnType = t.name

method add*(parent: var CsMethod; p: CsParameterList) =
  parent.parameterList = p

method gen*(item: CsObjectCreationExpression): string =

  echo "--> in  gen*(item:CsObjectCreationExpression) "
  result = "new" & item.name.replacementGenericTypes() &
    "(" &
    item.args.gen().replacementGenericTypes() &
    ")"
  if not item.initExpr.isNil:
    echo "trying to gen initExpr"
    result &= item.initExpr.gen()

method add*(parent: var CsObjectCreationExpression; item: CsGenericName) =
  parent.genericName = item

method add*(parent: var CsObjectCreationExpression; item: CsPredefinedType) = todoimpl #TODO
method add*(parent: var CsObjectCreationExpression;
    item: CsInitializerExpression) =
  parent.initExpr = item
  # assert false

proc extract*(t: typedesc[CsAssignmentExpression]; info: Info): CsAssignmentExpression =
  echo "extract*(t: typedesc[CsAssignmentExpression]; info: Info): CsAssignmentExpression"
  result = newCs(CsAssignmentExpression)
  # let t = colonsToTable(info.essentials)
  # echo t
  echo info
  result.left = info.essentials[0]
  # result.right = info.essentials[1]

method add*(parent: CsAssignmentExpression; item: CsTypeArgumentList) =
  echo "havent implemented method add*(parent:CsAssignmentExpression; item: CsTypeArgumentList) "
  discard # TODO?

method add*(parent: CsAssignmentExpression; item: CsGenericName) =
  echo "havent implemented method add*(parent:CsAssignmentExpression; item: CsGenericName) "
  discard # TODO?

method add*(parent: CsAssignmentExpression; item: CsArgumentList) =
  echo "havent implemented method add*(parent:CsAssignmentExpression; item: CsArgumentList) "
  discard # TODO?

method add*(parent: CsAssignmentExpression; item: CsObjectCreationExpression) =
  parent.right = item


method add*(parent: CsGenericName; item: CsTypeArgumentList) =
  parent.typearglist = item

method gen*(c: CsVariableDeclarator): string =
  echo c.src
  echo "start of method gen*(c:CsVariableDeclarator)"
  # assert c.rhs != nil
  if not c.rhs.isNil:
    echo "rhs is: " & c.rhs.typ & c.rhs.ttype
    result &= c.rhs.gen()
  else:
    if c.ev != nil and c.ev.rhsValue != nil:
      result = c.ev.rhsValue.gen()
  echo result
  echo "end of  method gen*(c:CsVariableDeclarator)"

# method add*(parent: var CsMethod; item: CsObjectCreationExpression) =
#   parent.body.add item
# proc add*(parent: var CsMethod; item: CsObjectCreationExpression; data: AllNeededData) = parent.add(item) # TODO

method add*(parent: var CsMethod; item: CsReturnStatement) =
  parent.body.add item
# proc add*(parent: var CsMethod; item: CsReturnStatement; data: AllNeededData) = parent.add(item) # TODO
method add*(parent: var CsMethod; item: CsExpressionStatement) =
  parent.body.add item

# ============= CsNameColon ========

proc newCs*(t: typedesc[CsNameColon]): CsNameColon =
  new result
  result.typ = $typeof(t)
#TODO(create:CsNameColon)

proc extract*(t: typedesc[CsNameColon]; info: Info): CsNameColon =
  echo info
  result = newCs(CsNameColon)
  # todoimpl

# method add*(parent: var CsNameColon; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsNameColon; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsNameColon; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsNameColon): string =
  todoimpl
  echo "--> in  gen*(c: var CsNameColon)"

# ============= CsNameEquals ========

proc newCs*(t: typedesc[CsNameEquals]; name: string): CsNameEquals =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsNameEquals]; info: Info): CsNameEquals =
  var name = ""
  if info.essentials.len > 0:
    name = info.essentials[0] # TODO: add in csdisplay
  result = newCs(CsNameEquals, name)


method add*(parent: var CsNameEquals; item: CsGenericName) =
  parent.genericName = item

method add*(parent: var CsField; item: CsVariableDeclarator) =
  echo "in add*(parent: var CsField; item: CsVariableDeclarator)"

method add*(parent: var CsField; item: CsVariable) =
  echo "in add*(parent: var CsField; item: CsVariable)"
  if parent.name.isEmptyOrWhitespace:
    parent.name = item.name
  if parent.thetype.isEmptyOrWhitespace:
    parent.thetype = item.thetype


method add*(parent: var CsParameter; item: CsPredefinedType) =
  parent.ptype = item.name
method add*(parent: var CsParameter; item: CsGenericName) =
  parent.genericType = item

# proc add*(parent: var CsNameEquals; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsNameEquals): string =
  todoimpl
  echo "--> in  gen*(c: var CsNameEquals)"

# type Child* = object
#   name: string
#   case kind: NamespaceParts
#   of NamespaceParts.Classes:
#     npCls: CsClass
#   of NamespaceParts.Interfaces:
#     npIface: CsInterface
#   of NamespaceParts.Enums:
#     npEnum: CsEnum

proc `$`*(c: CsUsingDirective): string =
  result = "import: ("
  result &= "name: " & c.name
  result &= ")"

proc `$`*(c: CsClass): string =
  result = "class: (name: " & c.name
  result &= "; methods: " & $c.methods.len
  result &= "; properties: " & $c.properties.len
  result &= ")"

proc `$`*(e: CsEnum): string =
  result = "enum: (name: " & e.name
  result &= "; items: " & $e.items.len
  result &= " )"

proc `$`*(n: CsNamespace): string =
  result = "namespace: ("
  result &= "name: " & n.name
  result &= "; imports: [" & n.imports.mapIt($it).join(", ") & "]"
  result &= "; classes: [" & n.classes.mapIt($it).join(", ") & "]"
  result &= "; enums: [" & n.enums.mapIt($it).join(", ") & "]"
  result &= ")"

proc newCs*(t: typedesc[CsNamespace]; name: string): CsNamespace =
  new result
  result.typ = $typeof(t)
  result.name = name
  result.classes = @[]
  result.classTable = newTable[string, CsClass]()
  result.enums = @[]
  result.enumTable = newTable[string, CsEnum]()
  result.interfaces = @[]
  result.interfaceTable = newTable[string, CsInterface]()

proc extract*(t: typedesc[CsMethod]; info: Info;
    data: AllNeededData): CsMethod =
  let name = info.essentials[0]
  let m = newCs(CsMethod, name)
  result = m
  if info.extras.len > 0:
    let e = info.extras[0]
    echo e
    if e.contains("static"):
      result.isStatic = true

  if info.essentials.len > 1:
    let ret = info.essentials[1]
    if not ret.isEmptyOrWhitespace: result.returnType = ret

proc extract*(t: typedesc[CsClass]; info: Info; data: AllNeededData): CsClass =
  # new result
  let name = info.essentials[0]
  if info.essentials.len > 1:
    let baseTypes = info.essentials[1].split(", ")
    # echo "BASETYPES: " & $baseTypes
    if baseTypes.len > 1:
      result = newCs(CsClass, name, baseTypes[0], baseTypes[1..^1])
    else: result = newCs(CsClass, name, baseTypes[0])
  else:
    result = newCs(CsClass, name)
  if info.extras.len > 0:
    let modifiers = info.extras[0]
    for m in modifiers.split(" "):
      result.mods.incl(m)

proc extract*(t: typedesc[CsNamespace]; info: Info; ): CsNamespace =
  echo "extract CsNamespace"
  echo info
  echo info.essentials[0]
  result = newCs(t, info.essentials[0])

proc extract*(t: typedesc[CsNamespace]; info: Info;
    data: AllNeededData): CsNamespace =
  extract(t, info)

method add*(parent: var CsNamespace; item: CsEnum) =

  parent.enums.add item
  parent.enumTable[item.name] = item
  parent.lastAddedTo = some(NamespaceParts.Enums)
  # parent.lastAdded = Child(kind: NamespaceParts.Enums, npEnum: item)

# proc add*(parent: var CsNamespace; item: CsEnum; data: AllNeededData) = parent.add(item) # TODO

method add*(ns: var CsNamespace; class: CsClass) =
  ns.classes.add(class)
  ns.classTable[class.name] = class
  ns.lastAddedTo = some(NamespaceParts.Classes)

method add*(ns: var CsNamespace; use: CsUsingDirective) =
  ns.imports.add use
  ns.lastAddedTo = some(NamespaceParts.Using)

method gen*(c: CsUsingDirective): string =

  echo "--> in  gen*(c: CsUsingDirective)"
  result = "import dotnet/" & c.name.toLowerAscii.replace(".", "/")

proc gen*(r: CsNamespace): string =

  echo "--> in  gen*(r: CsNamespace)"
  echo "generating namespace: " & r.name
  var s: seq[string] = @[]
  for u in r.imports:
    s.add(u.gen())
  s.add("")
  for c in r.classes:
    s.add(c.gen())
  s.add("")
  for e in r.enums:
    s.add(e.gen())
  result = s.join("\r\n")

proc hash*(c: CsNamespace): Hash =
  result = hash(c.name)



method add*(parent: var CsUsingDirective; item: CsGenericName) =
  todoimpl

method add*(parent: var CsUsingDirective; item: CsNameEquals) =
  parent.shorthand = item

# ============= CsNullableType ========

proc newCs*(t: typedesc[CsNullableType]): CsNullableType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsNullableType)

proc extract*(t: typedesc[CsNullableType]; info: Info): CsNullableType =
  echo info
  result = newCs(CsNullableType)

# method add*(parent: var CsNullableType; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsNullableType; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsNullableType; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsNullableType): string =
  todoimpl
  echo "--> in  gen*(c: var CsNullableType)"

# ============= CsObjectCreationExpression ========

proc newCs*(t: typedesc[CsObjectCreationExpression];
    name: string): CsObjectCreationExpression =
  new result
  result.typ = $typeof(t)

  result.name = name
  result.ttype = "CsObjectCreationExpression"

proc extract*(t: typedesc[CsObjectCreationExpression];
    info: Info): CsObjectCreationExpression =
  let newClassName = info.essentials[0]
  result = newCs(CsObjectCreationExpression, newClassName)

method add*(parent: var CsObjectCreationExpression; item: CsArgumentList) =
  parent.args = item

# proc add*(parent: var CsObjectCreationExpression; item: CsArgumentList; data: AllNeededData) = parent.add(item) # TODO
# proc add*(parent: var CsObjectCreationExpression; item: CsParameterList, data:AllNeededData) = parent.add(item) # TODO

# proc add*(parent: var CsObjectCreationExpression; item: CsParameterList) = todoimpl

# ============= CsOmittedArraySizeExpression ========

proc newCs*(t: typedesc[CsOmittedArraySizeExpression]): CsOmittedArraySizeExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOmittedArraySizeExpression)

proc extract*(t: typedesc[CsOmittedArraySizeExpression]; info: Info): CsOmittedArraySizeExpression =
  echo info
  result = newCs(CsOmittedArraySizeExpression)
  # todoimpl

# method add*(parent: var CsOmittedArraySizeExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsOmittedArraySizeExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsOmittedArraySizeExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsOmittedArraySizeExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsOmittedArraySizeExpression)"

# ============= CsOmittedTypeArgument ========

proc newCs*(t: typedesc[CsOmittedTypeArgument]): CsOmittedTypeArgument =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOmittedTypeArgument)

proc extract*(t: typedesc[CsOmittedTypeArgument]; info: Info): CsOmittedTypeArgument =
  echo info
  result = newCs(CsOmittedTypeArgument)
  # todoimpl

# method add*(parent: var CsOmittedTypeArgument; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsOmittedTypeArgument; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsOmittedTypeArgument; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsOmittedTypeArgument): string =
  todoimpl
  echo "--> in  gen*(c: var CsOmittedTypeArgument)"

# ============= CsOperator ========

proc newCs*(t: typedesc[CsOperator]): CsOperator =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOperator)

proc extract*(t: typedesc[CsOperator]; info: Info): CsOperator =
  echo info
  result = newCs(CsOperator)
  # todoimpl

# method add*(parent: var CsOperator; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsOperator; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsOperator; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsOperator): string =
  todoimpl
  echo "--> in  gen*(c: var CsOperator)"

# ============= CsOrderByClause ========

proc newCs*(t: typedesc[CsOrderByClause]): CsOrderByClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOrderByClause)

proc extract*(t: typedesc[CsOrderByClause]; info: Info): CsOrderByClause =
  echo info
  result = newCs(CsOrderByClause)
  # todoimpl

# method add*(parent: var CsOrderByClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsOrderByClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsOrderByClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsOrderByClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsOrderByClause)"

# ============= CsOrdering ========

proc newCs*(t: typedesc[CsOrdering]): CsOrdering =
  new result
  result.typ = $typeof(t)
#TODO(create:CsOrdering)

proc extract*(t: typedesc[CsOrdering]; info: Info): CsOrdering =
  echo info
  result = newCs(CsOrdering)
  # todoimpl

# method add*(parent: var CsOrdering; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsOrdering; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsOrdering; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsOrdering): string =
  todoimpl
  echo "--> in  gen*(c: var CsOrdering)"

# ============ CsParameterList =================

proc newCs*(t: typedesc[CsParameterList]): CsParameterList =
  new result # start empty.
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsParameterList]; info: Info;
    data: AllNeededData): CsParameterList =
  result = newCs(CsParameterList)

method add*(parent: var CsParameterList; item: CsParameter) =

  parent.parameters.add item

# proc add*(parent: var CsParameterList; item: CsParameter; data: AllNeededData) = parent.add(item) # TODO

proc extract*(t: typedesc[CsParameter]; info: Info): CsParameter =
  assert info.essentials.len >= 2
  let name = info.essentials[0].strip()
  let ty = info.essentials[1].strip()
  result = newCs(CsParameter, name, ty)
  if info.extras.len > 0:
    let e = info.extras[0]
    if e.contains("ref"): result.isRef = true

# ============= CsParenthesizedExpression ========

proc newCs*(t: typedesc[CsParenthesizedExpression]): CsParenthesizedExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsParenthesizedExpression)

proc extract*(t: typedesc[CsParenthesizedExpression]; info: Info): CsParenthesizedExpression =
  echo info
  result = newCs(CsParenthesizedExpression)
  # todoimpl

# method add*(parent: var CsParenthesizedExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsParenthesizedExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsParenthesizedExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsParenthesizedExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsParenthesizedExpression)"

# ============= CsParenthesizedLambdaExpression ========

proc newCs*(t: typedesc[CsParenthesizedLambdaExpression]): CsParenthesizedLambdaExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsParenthesizedLambdaExpression)

proc extract*(t: typedesc[CsParenthesizedLambdaExpression]; info: Info): CsParenthesizedLambdaExpression =
  echo info
  result = newCs(CsParenthesizedLambdaExpression)
  # todoimpl

# method add*(parent: var CsParenthesizedLambdaExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsParenthesizedLambdaExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsParenthesizedLambdaExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsParenthesizedLambdaExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsParenthesizedLambdaExpression)"

# ============= CsParenthesizedVariableDesignation ========

proc newCs*(t: typedesc[CsParenthesizedVariableDesignation]): CsParenthesizedVariableDesignation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsParenthesizedVariableDesignation)

proc extract*(t: typedesc[CsParenthesizedVariableDesignation]; info: Info): CsParenthesizedVariableDesignation =
  echo info
  result = newCs(CsParenthesizedVariableDesignation)
  # todoimpl

# method add*(parent: var CsParenthesizedVariableDesignation; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsParenthesizedVariableDesignation; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsParenthesizedVariableDesignation; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsParenthesizedVariableDesignation): string =
  todoimpl
  echo "--> in  gen*(c: var CsParenthesizedVariableDesignation)"

# ============= CsPointerType ========

proc newCs*(t: typedesc[CsPointerType]): CsPointerType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsPointerType)

proc extract*(t: typedesc[CsPointerType]; info: Info): CsPointerType =
  echo info
  result = newCs(CsPointerType)
  #todoimpl

# method add*(parent: var CsPointerType; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsPointerType; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsPointerType; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsPointerType): string =
  todoimpl
  echo "--> in  gen*(c: var CsPointerType)"

# ============= CsPostfixUnaryExpression ========

proc newCs*(t: typedesc[CsPostfixUnaryExpression]): CsPostfixUnaryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsPostfixUnaryExpression)

proc extract*(t: typedesc[CsPostfixUnaryExpression]; info: Info): CsPostfixUnaryExpression =
  echo info
  result = newCs(CsPostfixUnaryExpression)
  # todoimpl

# method add*(parent: var CsPostfixUnaryExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsPostfixUnaryExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsPostfixUnaryExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsPostfixUnaryExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsPostfixUnaryExpression)"

# ============= CsPredefinedType ========

proc newCs*(t: typedesc[CsPredefinedType]; name: string): CsPredefinedType =
  new result
  result.typ = $typeof(t)
  result.name = name

proc extract*(t: typedesc[CsPredefinedType]; info: Info;
    data: AllNeededData): CsPredefinedType =
  var name: string
  if info.essentials.len > 0:
    name = info.essentials[0]
  else: name = ""
  result = newCs(CsPredefinedType, name)

method gen*(c: var CsPredefinedType): string =
  todoimpl
  echo "--> in  gen*(c: var CsPredefinedType)"

# ============= CsPrefixUnaryExpression ========

proc newCs*(t: typedesc[CsPrefixUnaryExpression]): CsPrefixUnaryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsPrefixUnaryExpression)

proc extract*(t: typedesc[CsPrefixUnaryExpression];
    info: Info): CsPrefixUnaryExpression =
  result = newCs(t)
  result.prefix = info.essentials[0]
  result.expectedActingOn = info.essentials[1]


method gen*(c: CsPrefixUnaryExpression): string =
  echo "--> in  gen*(c: var CsPrefixUnaryExpression)"
  todoimpl

proc newCs*(t: typedesc[CsProperty]; name: string): CsProperty =
  new result
  result.typ = $typeof(t)
  result.name = name

proc extract*(t: typedesc[CsProperty]; info: Info): CsProperty =
  echo info
  ## NOTE: very strange, no type from CsDisplay.
  let name = info.essentials[0] #name
  result = newCs(CsProperty, name)
  let cnt = info.extras.len # how many
                            # let cnt = info.essentials[1].parseInt # how many
  if cnt > 0:
    let acc1 = info.extras[0] # get, or set, or both
    case acc1
    of "get": result.hasGet = true
    of "set": result.hasSet = true
    if cnt > 1:
      let acc2 = info.extras[1]
      case acc2
      of "get": result.hasGet = true
      of "set": result.hasSet = true

method add*(parent: var CsProperty; a: CsPredefinedType) =
  parent.retType = a.name

# ============= CsQueryBody ========

proc newCs*(t: typedesc[CsQueryBody]): CsQueryBody =
  new result
  result.typ = $typeof(t)
#TODO(create:CsQueryBody)

proc extract*(t: typedesc[CsQueryBody]; info: Info): CsQueryBody =
  echo info
  result = newCs(CsQueryBody)
  # todoimpl

# method add*(parent: var CsQueryBody; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsQueryBody; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsQueryBody; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsQueryBody): string =
  todoimpl
  echo "--> in  gen*(c: var CsQueryBody)"

# ============= CsQueryContinuation ========

proc newCs*(t: typedesc[CsQueryContinuation]): CsQueryContinuation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsQueryContinuation)

proc extract*(t: typedesc[CsQueryContinuation]; info: Info): CsQueryContinuation =
  echo info
  result = newCs(CsQueryContinuation)
  # todoimpl

# method add*(parent: var CsQueryContinuation; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsQueryContinuation; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsQueryContinuation; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsQueryContinuation): string =
  todoimpl
  echo "--> in  gen*(c: var CsQueryContinuation)"

# ============= CsQueryExpression ========

proc newCs*(t: typedesc[CsQueryExpression]): CsQueryExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsQueryExpression)

proc extract*(t: typedesc[CsQueryExpression]; info: Info): CsQueryExpression =
  echo info
  result = newCs(CsQueryExpression)
  #todoimpl

# method add*(parent: var CsQueryExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsQueryExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsQueryExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsQueryExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsQueryExpression)"

# ============= CsRefExpression ========

proc newCs*(t: typedesc[CsRefExpression]): CsRefExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefExpression)

proc extract*(t: typedesc[CsRefExpression]; info: Info): CsRefExpression =
  echo info
  result = newCs(CsRefExpression)
  # todoimpl

# method add*(parent: var CsRefExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsRefExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsRefExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsRefExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsRefExpression)"

# ============= CsRefTypeExpression ========

proc newCs*(t: typedesc[CsRefTypeExpression]): CsRefTypeExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefTypeExpression)

proc extract*(t: typedesc[CsRefTypeExpression]; info: Info): CsRefTypeExpression =
  echo info
  result = newCs(CsRefTypeExpression)
  # todoimpl

# method add*(parent: var CsRefTypeExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsRefTypeExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsRefTypeExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsRefTypeExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsRefTypeExpression)"

# ============= CsRefType ========

proc newCs*(t: typedesc[CsRefType]): CsRefType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefType)

proc extract*(t: typedesc[CsRefType]; info: Info): CsRefType =
  echo info
  result = newCs(CsRefType)
  # todoimpl

# method add*(parent: var CsRefType; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsRefType; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsRefType; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsRefType): string =
  todoimpl
  echo "--> in  gen*(c: var CsRefType)"

# ============= CsRefValueExpression ========

proc newCs*(t: typedesc[CsRefValueExpression]): CsRefValueExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsRefValueExpression)

proc extract*(t: typedesc[CsRefValueExpression]; info: Info): CsRefValueExpression =
  echo info
  result = newCs(CsRefValueExpression)
  # todoimpl

# method add*(parent: var CsRefValueExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsRefValueExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsRefValueExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsRefValueExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsRefValueExpression)"

# ============= CsReturnStatement ========

proc newCs*(t: typedesc[CsReturnStatement]): CsReturnStatement =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsReturnStatement"

proc extract*(t: typedesc[CsReturnStatement]; info: Info): CsReturnStatement =
  result = newCs(CsReturnStatement)
  let expectedFollowupAsString = if info.essentials.len > 0: info.essentials[0] else: ""
  result.value = expectedFollowupAsString
  # echo "From C# side -- expected to follow after return: " & expectedFollowupAsString

method add*(parent: var BodyExpr; item: CsObject) =
  raise newException(Exception,
    "reached here, but should have gone to instance of type: " & parent.ttype)

method add*(parent: var CsReturnStatement; item: CsArgumentList) =
  parent.args = item

method add*(parent: var CsReturnStatement; item: BodyExpr) =
  if parent.isComplete:
    assert false, "already complete with bodyExpr:" & $(not parent.expr.isNil)
  parent.expr = item; parent.isComplete = true

method gen*(c: CsReturnStatement): string =

  echo "--> in  gen*(c: CsReturnStatement)"
  echo "generating CsReturnStatement:"
  if not c.expr.isNil:
    echo "!!!!!!", c.expr.typ, " ", c.expr.ttype
  result = "return"
  if c.expr.isNil:
    if not c.value.isEmptyOrWhitespace:
      result &= " " & c.value
  else:
    echo c.expr.ttype
    result &= " " & c.expr.gen()
    # if not c.args.isNil:
    #   result &= "(" & c.args.gen() & ")"
  echo "result was:" & result

# ============= CsSelectClause ========

proc newCs*(t: typedesc[CsSelectClause]): CsSelectClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSelectClause)

proc extract*(t: typedesc[CsSelectClause]; info: Info): CsSelectClause =
  echo info
  result = newCs(CsSelectClause)
  # todoimpl

# method add*(parent: var CsSelectClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsSelectClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsSelectClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsSelectClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsSelectClause)"

proc newCs*(t: typedesc[CsSimpleBaseType]): CsSimpleBaseType =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsSimpleBaseType]; info: Info): CsSimpleBaseType =
  result = newCs(t)
  let name = info.essentials[0]
  result.name = name

# method add*(parent: var CsSimpleBaseType; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsSimpleBaseType; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsSimpleBaseType; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsSimpleBaseType): string =
  todoimpl
  echo "--> in  gen*(c: var CsSimpleBaseType)"

# ============= CsSimpleLambdaExpression ========

proc newCs*(t: typedesc[CsSimpleLambdaExpression]): CsSimpleLambdaExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSimpleLambdaExpression)

proc extract*(t: typedesc[CsSimpleLambdaExpression]; info: Info): CsSimpleLambdaExpression =
  echo info
  result = newCs(CsSimpleLambdaExpression)
  # todoimpl

# method add*(parent: var CsSimpleLambdaExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsSimpleLambdaExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsSimpleLambdaExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsSimpleLambdaExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsSimpleLambdaExpression)"

# ============= CsSingleVariableDesignation ========

proc newCs*(t: typedesc[CsSingleVariableDesignation]): CsSingleVariableDesignation =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSingleVariableDesignation)

proc extract*(t: typedesc[CsSingleVariableDesignation]; info: Info): CsSingleVariableDesignation =
  echo info
  result = newCs(CsSingleVariableDesignation)
# todoimpl

# method add*(parent: var CsSingleVariableDesignation; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsSingleVariableDesignation; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsSingleVariableDesignation; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsSingleVariableDesignation): string =
  todoimpl
  echo "--> in  gen*(c: var CsSingleVariableDesignation)"

# ============= CsSizeOfExpression ========

proc newCs*(t: typedesc[CsSizeOfExpression]): CsSizeOfExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSizeOfExpression)

proc extract*(t: typedesc[CsSizeOfExpression]; info: Info): CsSizeOfExpression =
  echo info
  result = newCs(CsSizeOfExpression)
  # todoimpl

# method add*(parent: var CsSizeOfExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsSizeOfExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsSizeOfExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsSizeOfExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsSizeOfExpression)"

# ============= CsStackAllocArrayCreationExpression ========

proc newCs*(t: typedesc[CsStackAllocArrayCreationExpression]): CsStackAllocArrayCreationExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsStackAllocArrayCreationExpression)

proc extract*(t: typedesc[CsStackAllocArrayCreationExpression]; info: Info): CsStackAllocArrayCreationExpression =
  echo info
  result = newCs(CsStackAllocArrayCreationExpression)
  # todoimpl

# method add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsStackAllocArrayCreationExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsStackAllocArrayCreationExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsStackAllocArrayCreationExpression)"

# ============= CsStruct ========

proc newCs*(t: typedesc[CsStruct]): CsStruct =
  new result
  result.typ = $typeof(t)
#TODO(create:CsStruct)

proc extract*(t: typedesc[CsStruct]; info: Info): CsStruct =
  echo info
  result = newCs(CsStruct)
  # todoimpl

# method add*(parent: var CsStruct; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsStruct; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsStruct; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsStruct): string =
  todoimpl
  echo "--> in  gen*(c: var CsStruct)"

# ============= CsSwitchSection ========

proc newCs*(t: typedesc[CsSwitchSection]): CsSwitchSection =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSwitchSection)

proc extract*(t: typedesc[CsSwitchSection]; info: Info): CsSwitchSection =
  echo info
  result = newCs(CsSwitchSection)
  # todoimpl

# method add*(parent: var CsSwitchSection; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsSwitchSection; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsSwitchSection; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsSwitchSection): string =
  todoimpl
  echo "--> in  gen*(c: var CsSwitchSection)"

# ============= CsSwitchStatement ========

proc newCs*(t: typedesc[CsSwitchStatement]): CsSwitchStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsSwitchStatement)

proc extract*(t: typedesc[CsSwitchStatement]; info: Info): CsSwitchStatement =
  echo info
  result = newCs(CsSwitchStatement)
  # todoimpl

# method add*(parent: var CsSwitchStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsSwitchStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsSwitchStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsSwitchStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsSwitchStatement)"

proc newCs*(t: typedesc[CsThisExpression]): CsThisExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsThisExpression)

proc extract*(t: typedesc[CsThisExpression];
    info: Info): CsThisExpression =
  echo info
  result = newCs(CsThisExpression)
  # todoimpl

# method add*(parent: var CsThisExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsThisExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsThisExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsThisExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsThisExpression)"

# ============= CsThrowExpression ========

proc newCs*(t: typedesc[CsThrowExpression]): CsThrowExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsThrowExpression)

proc extract*(t: typedesc[CsThrowExpression]; info: Info): CsThrowExpression =
  echo info
  result = newCs(CsThrowExpression)
  # todoimpl

# method add*(parent: var CsThrowExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsThrowExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsThrowExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsThrowExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsThrowExpression)"

# ============= CsThrowStatement ========

proc newCs*(t: typedesc[CsThrowStatement]): CsThrowStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsThrowStatement)

proc extract*(t: typedesc[CsThrowStatement]; info: Info): CsThrowStatement =
  echo info
  result = newCs(CsThrowStatement)
  # todoimpl

# method add*(parent: var CsThrowStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsThrowStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsThrowStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsThrowStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsThrowStatement)"

# ============= CsTryStatement ========

proc newCs*(t: typedesc[CsTryStatement]): CsTryStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTryStatement)

proc extract*(t: typedesc[CsTryStatement]; info: Info): CsTryStatement =
  echo info
  result = newCs(CsTryStatement)
  # todoimpl

# method add*(parent: var CsTryStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsTryStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsTryStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsTryStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsTryStatement)"

# ============= CsTupleElement ========

proc newCs*(t: typedesc[CsTupleElement]): CsTupleElement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTupleElement)

proc extract*(t: typedesc[CsTupleElement]; info: Info): CsTupleElement =
  echo info
  result = newCs(CsTupleElement)
  # todoimpl

# method add*(parent: var CsTupleElement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsTupleElement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsTupleElement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsTupleElement): string =
  todoimpl
  echo "--> in  gen*(c: var CsTupleElement)"

# ============= CsTupleExpression ========

proc newCs*(t: typedesc[CsTupleExpression]): CsTupleExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTupleExpression)

proc extract*(t: typedesc[CsTupleExpression]; info: Info): CsTupleExpression =
  echo info
  result = newCs(CsTupleExpression)
  # todoimpl

# method add*(parent: var CsTupleExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsTupleExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsTupleExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsTupleExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsTupleExpression)"

# ============= CsTupleType ========

proc newCs*(t: typedesc[CsTupleType]): CsTupleType =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTupleType)

proc extract*(t: typedesc[CsTupleType]; info: Info): CsTupleType =
  echo info
  result = newCs(CsTupleType) #todo

# method add*(parent: var CsTupleType; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsTupleType; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsTupleType; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsTupleType): string =
  todoimpl
  echo "--> in  gen*(c: var CsTupleType)"

# ============= CsTypeArgumentList ========

proc newCs*(t: typedesc[CsTypeArgumentList]): CsTypeArgumentList =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsTypeArgumentList]; info: Info): CsTypeArgumentList =
  result = newCs(CsTypeArgumentList)
  result.types = info.essentials[0].split(",").mapIt(it.strip)

# method add*(parent: var CsTypeArgumentList; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeArgumentList; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsTypeArgumentList; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsTypeArgumentList): string =
  todoimpl
  echo "--> in  gen*(c: var CsTypeArgumentList)"

# ============= CsTypeConstraint ========

proc newCs*(t: typedesc[CsTypeConstraint]): CsTypeConstraint =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeConstraint)

proc extract*(t: typedesc[CsTypeConstraint]; info: Info): CsTypeConstraint =
  result = newCs(CsTypeConstraint)
  echo info
  # todoimpl

# method add*(parent: var CsTypeConstraint; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeConstraint; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsTypeConstraint; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsTypeConstraint): string =
  todoimpl
  echo "--> in  gen*(c: var CsTypeConstraint)"

proc newCs*(t: typedesc[CsTypeOfExpression]): CsTypeOfExpression =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeOfExpression)

proc extract*(t: typedesc[CsTypeOfExpression]; info: Info): CsTypeOfExpression =
  echo info
  result = newCs(CsTypeOfExpression)
  # todoimpl

# method add*(parent: var CsTypeOfExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeOfExpression; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsTypeOfExpression; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsTypeOfExpression): string =
  todoimpl
  echo "--> in  gen*(c: var CsTypeOfExpression)"

# ============= CsTypeParameterConstraintClause ========

proc newCs*(t: typedesc[CsTypeParameterConstraintClause]): CsTypeParameterConstraintClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeParameterConstraintClause)

proc extract*(t: typedesc[CsTypeParameterConstraintClause]; info: Info): CsTypeParameterConstraintClause =
  result = newCs(CsTypeParameterConstraintClause)
  echo info
  # todoimpl

# method add*(parent: var CsTypeParameterConstraintClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeParameterConstraintClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsTypeParameterConstraintClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsTypeParameterConstraintClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsTypeParameterConstraintClause)"

# ============= CsTypeParameterList ========

proc newCs*(t: typedesc[CsTypeParameterList]): CsTypeParameterList =
  new result
  result.theTypes = @[]
  result.typ = $typeof(t)
#TODO(create:CsTypeParameterList)

proc extract*(t: typedesc[CsTypeParameterList]; info: Info): CsTypeParameterList =
  echo info
  result = newCs(CsTypeParameterList)
  # let ts =  info.essentials[0].strip(chars = { '<' }).strip(chars = { '>' }).split(",").mapIt(it.strip)
  # echo ts
  # result.theTypes = ts

# method add*(parent: var CsTypeParameterList; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeParameterList; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsTypeParameterList; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsTypeParameterList): string =
  todoimpl
  echo "--> in  gen*(c: var CsTypeParameterList)"

# ============= CsTypeParameter ========

proc newCs*(t: typedesc[CsTypeParameter]): CsTypeParameter =
  new result
  result.typ = $typeof(t)
#TODO(create:CsTypeParameter)

proc extract*(t: typedesc[CsTypeParameter]; info: Info): CsTypeParameter =
  echo info
  result = newCs(CsTypeParameter)
  # result.param = info.essentials[0]

# method add*(parent: var CsTypeParameter; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsTypeParameter; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsTypeParameter; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsTypeParameter): string =
  todoimpl
  echo "--> in  gen*(c: var CsTypeParameter)"

# ============= CsUnsafeStatement ========

proc newCs*(t: typedesc[CsUnsafeStatement]): CsUnsafeStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsUnsafeStatement)

proc extract*(t: typedesc[CsUnsafeStatement]; info: Info): CsUnsafeStatement =
  echo info
  result = newCs(CsUnsafeStatement)
  # todoimpl

# method add*(parent: var CsUnsafeStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsUnsafeStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsUnsafeStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsUnsafeStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsUnsafeStatement)"

# ============= CsUsingDirective ========

proc newCs*(t: typedesc[CsUsingDirective]; name: string): CsUsingDirective =
  new result
  result.typ = $typeof(t)
  result.name = name

proc extract*(t: typedesc[CsUsingDirective]; info: Info): CsUsingDirective =
  let name = info.essentials[0]
  result = newCs(CsUsingDirective, name)

# method add*(parent: var CsUsingDirective; item: Dummy) =

#   assert false # TODO(add:CsUsingDirective)

# proc add*(parent: var CsUsingDirective; item: Dummy; data: AllNeededData) = parent.add(item)

# ============= CsUsingStatement ========

proc newCs*(t: typedesc[CsUsingStatement]): CsUsingStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsUsingStatement)

proc extract*(t: typedesc[CsUsingStatement]; info: Info): CsUsingStatement =
  echo info
  result = newCs(CsUsingStatement)
  # todoimpl

# method add*(parent: var CsUsingStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsUsingStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsUsingStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsUsingStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsUsingStatement)"

# ============= CsWhenClause ========

proc newCs*(t: typedesc[CsWhenClause]): CsWhenClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsWhenClause)

proc extract*(t: typedesc[CsWhenClause]; info: Info): CsWhenClause =
  echo info
  result = newCs(CsWhenClause)
  # todoimpl

# method add*(parent: var CsWhenClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsWhenClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsWhenClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsWhenClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsWhenClause)"

# ============= CsWhereClause ========

proc newCs*(t: typedesc[CsWhereClause]): CsWhereClause =
  new result
  result.typ = $typeof(t)
#TODO(create:CsWhereClause)

proc extract*(t: typedesc[CsWhereClause]; info: Info): CsWhereClause =
  echo info
  result = newCs(CsWhereClause)
  # todoimpl

# method add*(parent: var CsWhereClause; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsWhereClause; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsWhereClause; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsWhereClause): string =
  todoimpl
  echo "--> in  gen*(c: var CsWhereClause)"

# ============= CsWhileStatement ========

proc newCs*(t: typedesc[CsWhileStatement]): CsWhileStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsWhileStatement)

proc extract*(t: typedesc[CsWhileStatement]; info: Info): CsWhileStatement =
  echo info
  result = newCs(CsWhileStatement)
  # todoimpl

# method add*(parent: var CsWhileStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsWhileStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsWhileStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsWhileStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsWhileStatement)"

# ============= CsYieldStatement ========

proc newCs*(t: typedesc[CsYieldStatement]): CsYieldStatement =
  new result
  result.typ = $typeof(t)
#TODO(create:CsYieldStatement)

proc extract*(t: typedesc[CsYieldStatement]; info: Info): CsYieldStatement =
  echo info
  result = newCs(CsYieldStatement)

# method add*(parent: var CsYieldStatement; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent: var CsYieldStatement; item: Dummy) "
#   if stopEarly: assert false

# proc add*(parent: var CsYieldStatement; item: Dummy; data: AllNeededData) = parent.add(item)

method gen*(c: var CsYieldStatement): string =
  todoimpl
  echo "--> in  gen*(c: var CsYieldStatement)"

# ======================================================

proc newCs*(t: typedesc[CsBlock]): CsBlock =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsBlock], info: Info, data: AllNeededData): CsBlock =
  result = newCs(t)

method gen*(c: CsBlock): string = todoimpl

proc newCs*(t: typedesc[CsVariable]): CsVariable =
  new result
  result.typ = $typeof(t)

proc newCs*(t: typedesc[CsLocalDeclarationStatement]): CsLocalDeclarationStatement =
  new result
  result.typ = $typeof(t)
  result.ttype = "CsLocalDeclarationStatement"

proc extract*(t: typedesc[CsLocalDeclarationStatement]; info: Info;
    data: AllNeededData): CsLocalDeclarationStatement =
  result = newCs(CsLocalDeclarationStatement)
  result.vartype = info.essentials[1]
  result.names = info.essentials[0].split(",").mapIt(it.strip)


method add*(parent: var CsVariable, item: CsGenericName) =
  parent.genericName = item


method gen*(c: CsLocalDeclarationStatement): string =

  echo "--> in  gen*(c:  CsLocalDeclarationStatement)"
  # echo "first gen attempt!!!", c.names.join(", ") & " : " & c.vartype
  # result = "var " & $c.names.join(", ")
  # if c.vartype != "var":
  #   result &= " : " & c.vartype
  echo "START OF gen CsLocalDeclarationStatement:"
  echo "left hand side"
  result &= c.lhs.gen()
  echo "gen result so far: " & result
  echo "right hand side: "
  if not c.rhs.isNil:
    echo "rhs type" & c.rhs.typ
    result &= c.rhs.gen()
  else:
    echo "c.rhs was nil"
  echo "gen result so far: " & result
  echo "END OF gen CsLocalDeclarationStatement."

method add*(parent: var CsMethod; t: CsLocalDeclarationStatement) =
  parent.body.add t

method add*(parent: var CsLocalDeclarationStatement; item: CsVariable) =
  parent.lhs = item

method add*(parent: var CsLocalDeclarationStatement; item: CsGenericName) =
  parent.lhs.genericName = item

method add*(parent: var CsLocalDeclarationStatement; item: CsTypeArgumentList) =
  parent.lhs.genericName.typearglist = item
  # TODO: can also be the rhs. so we should forward to last construct that fits instead of a high parent.

method add*(parent: var CsLocalDeclarationStatement;
    item: CsVariableDeclarator) =
  parent.rhs = item

method add*(parent: var CsVariableDeclarator; item: CsLiteralExpression) =
  if parent.rhs.isNil:
    parent.rhs = item
method add*(parent: var CsVariableDeclarator; item: CsArgumentList) =
  parent.arglist = item # FIXME!

method add*(parent: var CsLocalDeclarationStatement;
    item: CsLiteralExpression) =
  parent.rhs.add item

method add*(parent: var CsLocalDeclarationStatement; item: CsArgumentList) =
  parent.rhs.add item

method add*(parent: var CsVariable; item: CsVariableDeclarator) =
  parent.declarator = item

method add*(parent: var CsVariable; item: CsPredefinedType) =
  # echo item.name
  # echo parent.thetype
  if parent.thetype.isEmptyOrWhitespace:
    parent.thetype = item.name

method add*(parent: var CsVariableDeclarator; item: CsEqualsValueClause) =
  parent.ev = item

proc newCs*(t: typedesc[CsVariableDeclarator]): CsVariableDeclarator =
  new result
  result.typ = $typeof(t)

method add*(parent: var CsVariableDeclarator; item: CsMemberAccessExpression) =
  if parent.rhs.isNil:
    parent.rhs = item

method add*(parent: var CsVariableDeclarator; item: CsBinaryExpression) =
  if parent.rhs.isNil:
    parent.rhs = item

method add*(parent: var CsVariableDeclarator;
    item: CsObjectCreationExpression) =
  if parent.rhs.isNil:
    parent.rhs = item
  # assert parent.bexpr.isNil
  # parent.bexpr = item

proc extract*(_: typedesc[CsVariableDeclarator];
    info: Info): CsVariableDeclarator =
  result = newCs(CsVariableDeclarator)
  result.name = info.essentials[0]

proc extract*(t: typedesc[CsVariable], info: Info,
    data: AllNeededData): CsVariable =
  result = newCs(CsVariable)
  let p = info.essentials[0].split(":");
  result.thetype = p[1]
  assert p[0] == "type"
  let n = info.essentials[1].split(":");
  result.name = n[1]
  assert n[0] == "name"

method gen*(c: CsVariable): string =
  result = "var " & c.name
  if c.thetype != "var":
    result &= " : " & c.thetype.replacementGenericTypes()
  if not c.declarator.isNil:
    let gendecl = c.declarator.gen()
    result &= " = " & gendecl


proc newCs*(t: typedesc[CsBinaryPattern]): CsBinaryPattern =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsBinaryPattern], info: Info, data: AllNeededData): CsBinaryPattern =
  echo info
  result = newCs(CsBinaryPattern)
  # todoimpl
method gen*(c: CsBinaryPattern): string = todoimpl


proc newCs*(t: typedesc[CsDiscardPattern]): CsDiscardPattern =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsDiscardPattern], info: Info, data: AllNeededData): CsDiscardPattern =
  echo info
  result = newCs(CsDiscardPattern)
  # todoimpl
method gen*(c: CsDiscardPattern): string = todoimpl

proc newCs*(t: typedesc[CsFunctionPointerType]): CsFunctionPointerType =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsFunctionPointerType], info: Info, data: AllNeededData): CsFunctionPointerType =
  echo info
  result = newCs(CsFunctionPointerType)
  # todoimpl
method gen*(c: CsFunctionPointerType): string = todoimpl

proc newCs*(t: typedesc[CsImplicitObjectCreationExpression]): CsImplicitObjectCreationExpression =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsImplicitObjectCreationExpression], info: Info): CsImplicitObjectCreationExpression =
  echo info
  result = newCs(CsImplicitObjectCreationExpression)
  # todoimpl

method gen*(c: CsImplicitObjectCreationExpression): string = todoimpl

proc newCs*(t: typedesc[CsMemberAccessExpression]): CsMemberAccessExpression =
  new result
  result.typ = $typeof(t)

# method add*(parent:var CsMemberAccessExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent:var CsMemberAccessExpression; item: Dummy) "
#   #   assert false

proc extract*(t: typedesc[CsMemberAccessExpression], info: Info,
    data: AllNeededData): CsMemberAccessExpression =
  result = newCs(CsMemberAccessExpression)
  echo info
  result.member = info.essentials[0]
  result.fromPart = info.essentials[1]

method gen*(c: CsMemberAccessExpression): string =
  echo "in gen*(c: CsMemberAccessExpression)"
  result = c.fromPart & "." & c.member.lowerFirst
proc newCs*(t: typedesc[CsParenthesizedPattern]): CsParenthesizedPattern =
  new result
  result.typ = $typeof(t)
proc extract*(t: typedesc[CsParenthesizedPattern], info: Info, data: AllNeededData): CsParenthesizedPattern =
  echo info
  result = newCs(CsParenthesizedPattern)
  # todoimpl
method gen*(c: CsParenthesizedPattern): string = todoimpl

proc newCs*(t: typedesc[CsPositionalPatternClause]): CsPositionalPatternClause =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsPositionalPatternClause], info: Info, data: AllNeededData): CsPositionalPatternClause =
  echo info
  result = newCs(CsPositionalPatternClause)
  # todoimpl
method gen*(c: CsPositionalPatternClause): string = todoimpl

# method add*(parent:var CsPrimaryConstructorBaseType; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent:var CsPrimaryConstructorBaseType; item: Dummy) "
#   #   assert false
proc newCs*(t: typedesc[CsPrimaryConstructorBaseType]): CsPrimaryConstructorBaseType =
  new result
  result.typ = $typeof(t)
proc extract*(t: typedesc[CsPrimaryConstructorBaseType], info: Info, data: AllNeededData): CsPrimaryConstructorBaseType =
  echo info
  result = newCs(CsPrimaryConstructorBaseType)
  # todoimpl
method gen*(c: CsPrimaryConstructorBaseType): string = todoimpl

proc newCs*(t: typedesc[CsPropertyPatternClause]): CsPropertyPatternClause =
  new result
  result.typ = $typeof(t)
proc extract*(t: typedesc[CsPropertyPatternClause], info: Info, data: AllNeededData): CsPropertyPatternClause =
  echo info
  result = newCs(CsPropertyPatternClause)
  # todoimpl
method gen*(c: CsPropertyPatternClause): string = todoimpl

proc newCs*(t: typedesc[CsRangeExpression]): CsRangeExpression =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsRangeExpression], info: Info, data: AllNeededData): CsRangeExpression =
  echo info
  result = newCs(CsRangeExpression)
  # todoimpl
method gen*(c: CsRangeExpression): string = todoimpl

proc newCs*(t: typedesc[CsRecord]): CsRecord =
  new result
  result.typ = $typeof(t)
proc extract*(t: typedesc[CsRecord], info: Info, data: AllNeededData): CsRecord =
  echo info
  result = newCs(CsRecord)
  # todoimpl
method gen*(c: CsRecord): string = todoimpl

# method add*(parent:var CsRecursivePattern; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent:var CsRecursivePattern; item: Dummy) "
#   #   assert false
proc newCs*(t: typedesc[CsRecursivePattern]): CsRecursivePattern =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsRecursivePattern], info: Info, data: AllNeededData): CsRecursivePattern =
  echo info
  result = newCs(CsRecursivePattern)
  # todoimpl
method gen*(c: CsRecursivePattern): string = todoimpl

proc newCs*(t: typedesc[CsRelationalPattern]): CsRelationalPattern =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsRelationalPattern], info: Info, data: AllNeededData): CsRelationalPattern =
  echo info
  result = newCs(CsRelationalPattern)
  # todoimpl
method gen*(c: CsRelationalPattern): string = todoimpl

proc newCs*(t: typedesc[CsSubpattern]): CsSubpattern =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsSubpattern], info: Info, data: AllNeededData): CsSubpattern =
  echo info
  result = newCs(CsSubpattern)
  # todoimpl
method gen*(c: CsSubpattern): string = todoimpl

proc newCs*(t: typedesc[CsSwitchExpression]): CsSwitchExpression =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsSwitchExpression], info: Info, data: AllNeededData): CsSwitchExpression =
  echo info
  result = newCs(CsSwitchExpression)

method gen*(c: CsSwitchExpression): string = todoimpl

proc newCs*(t: typedesc[CsSwitchExpressionArm]): CsSwitchExpressionArm =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsSwitchExpressionArm], info: Info, data: AllNeededData): CsSwitchExpressionArm =
  echo info
  result = newCs(CsSwitchExpressionArm)
  # todoimpl
method gen*(c: CsSwitchExpressionArm): string = todoimpl

proc newCs*(t: typedesc[CsTypePattern]): CsTypePattern =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsTypePattern], info: Info, data: AllNeededData): CsTypePattern =
  echo info
  result = newCs(CsTypePattern)
  # todoimpl
method gen*(c: CsTypePattern): string = todoimpl

proc newCs*(t: typedesc[CsUnaryPattern]): CsUnaryPattern =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsUnaryPattern], info: Info, data: AllNeededData): CsUnaryPattern =
  echo info
  result = newCs(CsUnaryPattern)
  # todoimpl
method gen*(c: CsUnaryPattern): string = todoimpl

proc newCs*(t: typedesc[CsVarPattern]): CsVarPattern =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsVarPattern], info: Info, data: AllNeededData): CsVarPattern =
  echo info
  result = newCs(CsVarPattern)
  # todoimpl

method gen*(c: CsVarPattern): string = todoimpl

proc newCs*(t: typedesc[CsWithExpression]): CsWithExpression =
  new result
  result.typ = $typeof(t)

proc extract*(t: typedesc[CsWithExpression], info: Info, data: AllNeededData): CsWithExpression =
  echo info
  result = newCs(CsWithExpression)
  # todoimpl
method gen*(c: CsWithExpression): string = todoimpl

# method add*(parent:var CsImplicitStackAllocArrayCreationExpression; item: Dummy)  =
#   echo "!!! ---->> unimplemented:  method add*(parent:var CsImplicitStackAllocArrayCreationExpression; item: Dummy) "
#   #   assert false
proc extract*(t: typedesc[CsImplicitStackAllocArrayCreationExpression], info: Info, data: AllNeededData): CsImplicitStackAllocArrayCreationExpression =
  todoimpl
method gen*(c: CsImplicitStackAllocArrayCreationExpression): string = todoimpl


method add*(parent: var CsParameter; item: CsEqualsValueClause) =
  echo "in method add*(parent: var CsParameter; item: CsEqualsValueClause)"
  todoimpl # TODO(add:CsParameter)

method add*(parent: var CsEqualsValueClause; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsEqualsValueClause)
method add*(parent: var CsArgument; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsArgument; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add:CsArgument)

method add*(parent: var CsArgument; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsArgument; item: CsObjectCreationExpression)"
  todoimpl # TODO(add:CsArgument)

method add*(parent: var CsArgument; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsArgument; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsArgument)
method add*(parent: var CsArgument; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsArgument; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsArgument)

method add*(parent: var CsArgument; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsArgument; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsArgument)

method add*(parent: var CsArgument; item: CsAssignmentExpression) =
  echo "in method add*(parent: var CsArgument; item: CsAssignmentExpression)"
  todoimpl # TODO(add:CsArgument)

method add*(parent: var CsTypeArgumentList; item: CsGenericName) =
  echo "in method add*(parent: var CsTypeArgumentList; item: CsGenericName)"
  todoimpl # TODO(add:CsTypeArgumentList, CsGenericName)

method add*(parent: var CsBaseList; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsBaseList; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsBaseList, CsMemberAccessExpression)

method add*(parent: var CsBaseList; item: CsConstructorInitializer) =
  echo "in method add*(parent: var CsBaseList; item: CsConstructorInitializer)"
  todoimpl # TODO(add:CsBaseList, CsConstructorInitializer)

method add*(parent: var CsMemberAccessExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsMemberAccessExpression, CsMemberAccessExpression)

method add*(parent: var CsBinaryExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsBinaryExpression, CsMemberAccessExpression)
method add*(parent: var CsBinaryExpression; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add:CsBinaryExpression, CsLiteralExpression)
method add*(parent: var CsBinaryExpression; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsBinaryExpression, CsBinaryExpression)

method add*(parent: var CsTypeParameterList; item: CsTypeParameter) =
  echo "in method add*(parent: var CsTypeParameterList, item: CsTypeParameter)"
  parent.theTypes.add item


method add*(parent: var CsClass; item: CsTypeParameterConstraintClause) =
  echo "in method add*(parent: var CsClass; item: CsTypeParameterConstraintClause)"
  todoimpl # TODO(add:CsClass, CsTypeParameterConstraintClause)

method add*(parent: var CsTypeParameterConstraintClause; item: CsTypeConstraint) =
  echo "in method add*(parent: var CsTypeParameterConstraintClause; item: CsTypeConstraint)"
  todoimpl # TODO(add:CsTypeParameterConstraintClause, CsTypeConstraint)

method add*(parent: var CsTypeConstraint; item: CsGenericName) =
  echo "in method add*(parent: var CsTypeConstraint; item: CsGenericName)"
  todoimpl # TODO(add:CsTypeConstraint, CsGenericName)
method add*(parent: var CsInvocationExpression; item: CsGenericName) =
  echo "in method add*(parent: var CsInvocationExpression; item: CsGenericName)"
  todoimpl # TODO(add:CsInvocationExpression, CsGenericName)

method add*(parent: var CsIfStatement; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsIfStatement; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsIfStatement, CsBinaryExpression)

method add*(parent: var CsBinaryExpression; item: CsTypeOfExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add:CsBinaryExpression, CsTypeOfExpression)
method add*(parent: var CsAssignmentExpression; item: CsCastExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsCastExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsCastExpression)

method add*(parent: var CsCastExpression; item: CsThisExpression) =
  echo "in method add*(parent: var CsCastExpression; item: CsThisExpression)"
  todoimpl # TODO(add:CsCastExpression, CsThisExpression)

method add*(parent: var CsParameter; item: CsArrayType) =
  echo "in method add*(parent: var CsParameter; item: CsArrayType)"
  todoimpl # TODO(add:CsParameter, CsArrayType)

method add*(parent: var CsArrayType; item: CsPredefinedType) =
  echo "in method add*(parent: var CsArrayType; item: CsPredefinedType)"
  todoimpl # TODO(add:CsArrayType, CsPredefinedType)

method add*(parent: var CsArrayType; item: CsArrayRankSpecifier) =
  echo "in method add*(parent: var CsArrayType; item: CsArrayRankSpecifier)"
  todoimpl # TODO(add:CsArrayType, CsArrayRankSpecifier)

method add*(parent: var CsArrayRankSpecifier; item: CsOmittedArraySizeExpression) =
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsOmittedArraySizeExpression)"
  todoimpl # TODO(add:CsArrayRankSpecifier, CsOmittedArraySizeExpression)

method add*(parent: var CsMemberAccessExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsMemberAccessExpression, CsInvocationExpression)

method add*(parent: var CsMethod; item: CsArrowExpressionClause) =
  echo "in method add*(parent: var CsMethod; item: CsArrowExpressionClause)"
  todoimpl # TODO(add:CsMethod, CsArrowExpressionClause)

method add*(parent: var CsArrowExpressionClause; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsArrowExpressionClause, CsInvocationExpression)

method add*(parent: var CsArgument; item: CsSimpleLambdaExpression) =
  echo "in method add*(parent: var CsArgument; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add:CsArgument, CsSimpleLambdaExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsParameter) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsParameter)"
  todoimpl # TODO(add:CsSimpleLambdaExpression, CsParameter)

method add*(parent: var CsMemberAccessExpression; item: CsGenericName) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsGenericName)"
  todoimpl # TODO(add:CsMemberAccessExpression, CsGenericName)

method add*(parent: var CsIfStatement; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsIfStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsIfStatement, CsInvocationExpression)

method add*(parent: var CsMethod; item: CsForStatement) =
  echo "in method add*(parent: var CsMethod; item: CsForStatement)"
  todoimpl # TODO(add:CsMethod, CsForStatement)

method add*(parent: var CsForStatement; item: CsVariable) =
  echo "in method add*(parent: var CsForStatement; item: CsVariable)"
  todoimpl # TODO(add:CsForStatement, CsVariable)

method add*(parent: var CsVariable; item: CsArrayType) =
  echo "in method add*(parent: var CsVariable; item: CsArrayType)"
  todoimpl # TODO(add:CsVariable, CsArrayType)

method add*(parent: var CsEqualsValueClause; item: CsInitializerExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsInitializerExpression)"
  todoimpl # TODO(add:CsEqualsValueClause, CsInitializerExpression)

method add*(parent: var CsMethod; item: CsDoStatement) =
  echo "in method add*(parent: var CsMethod; item: CsDoStatement)"
  todoimpl # TODO(add:CsMethod, CsDoStatement)

method add*(parent: var CsForStatement; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsForStatement; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsForStatement, CsBinaryExpression)

method add*(parent: var CsForStatement; item: CsPostfixUnaryExpression) =
  echo "in method add*(parent: var CsForStatement; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add:CsForStatement, CsPostfixUnaryExpression)

method add*(parent: var CsMemberAccessExpression; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add:CsMemberAccessExpression, CsElementAccessExpression)

method add*(parent: var CsElementAccessExpression; item: CsBracketedArgumentList) =
  echo "in method add*(parent: var CsElementAccessExpression; item: CsBracketedArgumentList)"
  parent.value = item
  # todoimpl # TODO(add:CsElementAccessExpression, CsBracketedArgumentList)

method add*(parent: var CsBracketedArgumentList; item: CsArgument) =
  echo "in method add*(parent: var CsBracketedArgumentList; item: CsArgument)"
  parent.args.add item

method add*(parent: var CsBinaryExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsBinaryExpression, CsInvocationExpression)

method add*(parent: var CsSimpleBaseType; item: CsGenericName) =
  echo "in method add*(parent: var CsSimpleBaseType; item: CsGenericName)"
  parent.genericName = item

method add*(parent: var CsNameEquals; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsNameEquals; item: CsPrefixUnaryExpression)"
  # rhs can have such a thing.
  todoimpl # TODO(add:CsNameEquals, CsPrefixUnaryExpression)

method add*(parent: var CsAssignmentExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsMemberAccessExpression)

method add*(parent: var CsMemberAccessExpression; item: CsThisExpression) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsThisExpression)"
  todoimpl # TODO(add:CsMemberAccessExpression, CsThisExpression)

method add*(parent: var CsAssignmentExpression; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsLiteralExpression)

method add*(parent: var CsMethod; item: CsWhileStatement) =
  echo "in method add*(parent: var CsMethod; item: CsWhileStatement)"
  todoimpl # TODO(add:CsMethod, CsWhileStatement)

method add*(parent: var CsWhileStatement; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsWhileStatement; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsWhileStatement, CsBinaryExpression)

method add*(parent: var CsExpressionStatement; item: CsPostfixUnaryExpression) =
  echo "in method add*(parent: var CsExpressionStatement; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add:CsExpressionStatement, CsPostfixUnaryExpression)

method add*(parent: var CsIfStatement; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsIfStatement; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add:CsIfStatement, CsPrefixUnaryExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsPrefixUnaryExpression, CsInvocationExpression)

method add*(parent: var CsBinaryExpression; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add:CsBinaryExpression, CsParenthesizedExpression)

method add*(parent: var CsParenthesizedExpression; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsParenthesizedExpression, CsBinaryExpression)

method add*(parent: var CsArgument; item: CsInterpolatedStringExpression) =
  echo "in method add*(parent: var CsArgument; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add:CsArgument, CsInterpolatedStringExpression)

method add*(parent: var CsMethod; item: CsArrayType) =
  echo "in method add*(parent: var CsMethod; item: CsArrayType)"
  todoimpl # TODO(add:CsMethod, CsArrayType)

method add*(parent: var CsIfStatement; item: CsThrowStatement) =
  echo "in method add*(parent: var CsIfStatement; item: CsThrowStatement)"
  todoimpl # TODO(add:CsIfStatement, CsThrowStatement)

method add*(parent: var CsThrowStatement; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsThrowStatement; item: CsObjectCreationExpression)"
  todoimpl # TODO(add:CsThrowStatement, CsObjectCreationExpression)

method add*(parent: var CsArgument; item: CsConditionalExpression) =
  echo "in method add*(parent: var CsArgument; item: CsConditionalExpression)"
  todoimpl # TODO(add:CsArgument, CsConditionalExpression)

method add*(parent: var CsConditionalExpression; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add:CsConditionalExpression, CsParenthesizedExpression)

method add*(parent: var CsConditionalExpression; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add:CsConditionalExpression, CsLiteralExpression)

method add*(parent: var CsConditionalExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsConditionalExpression, CsMemberAccessExpression)

method add*(parent: var CsMemberAccessExpression; item: CsPredefinedType) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsPredefinedType)"
  todoimpl # TODO(add:CsMemberAccessExpression, CsPredefinedType)

method add*(parent: var CsEqualsValueClause; item: CsArrayCreationExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsArrayCreationExpression)"
  todoimpl # TODO(add:CsEqualsValueClause, CsArrayCreationExpression)


method add*(parent: var CsArrayCreationExpression; item: CsArrayType) =
  echo "in method add*(parent: var CsArrayCreationExpression; item: CsArrayType)"
  todoimpl # TODO(add:CsArrayCreationExpression, CsArrayType)

method add*(parent: var CsIfStatement; item: CsExpressionStatement) =
  echo "in method add*(parent: var CsIfStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add:CsIfStatement, CsExpressionStatement)

method add*(parent: var CsArrayCreationExpression; item: CsInitializerExpression) =
  echo "in method add*(parent: var CsArrayCreationExpression; item: CsInitializerExpression)"
  todoimpl # TODO(add:CsArrayCreationExpression, CsInitializerExpression)

method add*(parent: var CsInitializerExpression; item: CsArrayCreationExpression) =
  echo "in method add*(parent: var CsInitializerExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add:CsInitializerExpression, CsArrayCreationExpression)

method add*(parent: var CsMethod; item: CsUsingStatement) =
  echo "in method add*(parent: var CsMethod; item: CsUsingStatement)"
  todoimpl # TODO(add:CsMethod, CsUsingStatement)

method add*(parent: var CsUsingStatement; item: CsVariable) =
  echo "in method add*(parent: var CsUsingStatement; item: CsVariable)"
  todoimpl # TODO(add:CsUsingStatement, CsVariable)

method add*(parent: var CsUsingStatement; item: CsUsingStatement) =
  echo "in method add*(parent: var CsUsingStatement; item: CsUsingStatement)"
  todoimpl # TODO(add:CsUsingStatement, CsUsingStatement)

method add*(parent: var CsUsingStatement; item: CsExpressionStatement) =
  echo "in method add*(parent: var CsUsingStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add:CsUsingStatement, CsExpressionStatement)

method add*(parent: var CsAssignmentExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsInvocationExpression)

method add*(parent: var CsArgument; item: CsParenthesizedLambdaExpression) =
  echo "in method add*(parent: var CsArgument; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add:CsArgument, CsParenthesizedLambdaExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsParameterList) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsParameterList)"
  todoimpl # TODO(add:CsParenthesizedLambdaExpression, CsParameterList)

method add*(parent: var CsMethod; item: CsTryStatement) =
  echo "in method add*(parent: var CsMethod; item: CsTryStatement)"
  todoimpl # TODO(add:CsMethod, CsTryStatement)

method add*(parent: var CsTryStatement; item: CsCatchClause) =
  echo "in method add*(parent: var CsTryStatement; item: CsCatchClause)"
  todoimpl # TODO(add:CsTryStatement, CsCatchClause)

method add*(parent: var CsCatchClause; item: CsCatch) =
  echo "in method add*(parent: var CsCatchClause; item: CsCatch)"
  todoimpl # TODO(add:CsCatchClause, CsCatch)

method add*(parent: var CsAssignmentExpression; item: CsAssignmentExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsAssignmentExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsAssignmentExpression)

method add*(parent: var CsInterpolatedStringExpression; item: CsInterpolatedStringText) =
  echo "in method add*(parent: var CsInterpolatedStringExpression; item: CsInterpolatedStringText)"
  todoimpl # TODO(add:CsInterpolatedStringExpression, CsInterpolatedStringText)

method add*(parent: var CsAccessor; item: CsReturnStatement) =
  echo "in method add*(parent: var CsAccessor; item: CsReturnStatement)"
  parent.statements.add item

method add*(parent: var CsReturnStatement; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsElementAccessExpression)"
  parent.expr = item
  # todoimpl # TODO(add:CsReturnStatement, CsElementAccessExpression)

method add*(parent: var CsMethod; item: CsThrowStatement) =
  echo "in method add*(parent: var CsMethod; item: CsThrowStatement)"
  todoimpl # TODO(add:CsMethod, CsThrowStatement)

method add*(parent: var CsMethod; item: CsTypeParameterList) =
  echo "in method add*(parent: var CsMethod; item: CsTypeParameterList)"
  todoimpl # TODO(add:CsMethod, CsTypeParameterList)

method add*(parent: var CsReturnStatement; item: CsCastExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsCastExpression)"
  todoimpl # TODO(add:CsReturnStatement, CsCastExpression)

method add*(parent: var CsReturnStatement; item: CsConditionalExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsConditionalExpression)"
  todoimpl # TODO(add:CsReturnStatement, CsConditionalExpression)

method add*(parent: var CsProperty; item: CsArrayType) =
  echo "in method add*(parent: var CsProperty; item: CsArrayType)"
  todoimpl # TODO(add:CsProperty, CsArrayType)

method add*(parent: var CsProperty; item: CsArrowExpressionClause) =
  echo "in method add*(parent: var CsProperty; item: CsArrowExpressionClause)"
  todoimpl # TODO(add:CsProperty, CsArrowExpressionClause)

method add*(parent: var CsProperty; item: CsEqualsValueClause) =
  echo "in method add*(parent: var CsProperty; item: CsEqualsValueClause)"
  todoimpl # TODO(add:CsProperty, CsEqualsValueClause)

method add*(parent: var CsProperty; item: CsExplicitInterfaceSpecifier) =
  echo "in method add*(parent: var CsProperty; item: CsExplicitInterfaceSpecifier)"
  todoimpl # TODO(add:CsProperty, CsExplicitInterfaceSpecifier)

method add*(parent: var CsProperty; item: CsGenericName) =
  echo "in method add*(parent: var CsProperty; item: CsGenericName)"
  todoimpl # TODO(add:CsProperty, CsGenericName)

method add*(parent: var CsProperty; item: CsLocalDeclarationStatement) =
  echo "in method add*(parent: var CsProperty; item: CsLocalDeclarationStatement)"
  todoimpl # TODO(add:CsProperty, CsLocalDeclarationStatement)

method add*(parent: var CsAssignmentExpression; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsBinaryExpression)

method add*(parent: var CsAssignmentExpression; item: CsInitializerExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsInitializerExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsInitializerExpression)

method add*(parent: var CsAssignmentExpression; item: CsParenthesizedLambdaExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsParenthesizedLambdaExpression)

method add*(parent: var CsAssignmentExpression; item: CsSimpleLambdaExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsSimpleLambdaExpression)

method add*(parent: var CsAssignmentExpression; item: CsThisExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsThisExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsThisExpression)

method add*(parent: var CsInitializerExpression; item: CsParenthesizedLambdaExpression) =
  echo "in method add*(parent: var CsInitializerExpression; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add:CsInitializerExpression, CsParenthesizedLambdaExpression)
method add*(parent: var CsEqualsValueClause; item: CsParenthesizedLambdaExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add:CsEqualsValueClause, CsParenthesizedLambdaExpression)

method add*(parent: var CsArgument; item: CsCastExpression) =
  echo "in method add*(parent: var CsArgument; item: CsCastExpression)"
  todoimpl # TODO(add:CsArgument, CsCastExpression)

method add*(parent: var CsArgument; item: CsThisExpression) =
  echo "in method add*(parent: var CsArgument; item: CsThisExpression)"
  todoimpl # TODO(add:CsArgument, CsThisExpression)

method add*(parent: var CsArgument; item: CsTypeOfExpression) =
  echo "in method add*(parent: var CsArgument; item: CsTypeOfExpression)"
  todoimpl # TODO(add:CsArgument, CsTypeOfExpression)

method add*(parent: var CsTypeArgumentList; item: CsArrayType) =
  echo "in method add*(parent: var CsTypeArgumentList; item: CsArrayType)"
  todoimpl # TODO(add:CsTypeArgumentList, CsArrayType)

method add*(parent: var CsPrefixUnaryExpression; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add:CsPrefixUnaryExpression, CsObjectCreationExpression)

method add*(parent: var CsMemberAccessExpression; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add:CsMemberAccessExpression, CsObjectCreationExpression)

method add*(parent: var CsMemberAccessExpression; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add:CsMemberAccessExpression, CsParenthesizedExpression)

method add*(parent: var CsMemberAccessExpression; item: CsTypeOfExpression) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add:CsMemberAccessExpression, CsTypeOfExpression)

method add*(parent: var CsBinaryExpression; item: CsCastExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsCastExpression)"
  todoimpl # TODO(add:CsBinaryExpression, CsCastExpression)

method add*(parent: var CsBinaryExpression; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add:CsBinaryExpression, CsElementAccessExpression)

method add*(parent: var CsIfStatement; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsIfStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsIfStatement, CsMemberAccessExpression)

method add*(parent: var CsIfStatement; item: CsReturnStatement) =
  echo "in method add*(parent: var CsIfStatement; item: CsReturnStatement)"
  todoimpl # TODO(add:CsIfStatement, CsReturnStatement)

method add*(parent: var CsCastExpression; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsCastExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add:CsCastExpression, CsParenthesizedExpression)

method add*(parent: var CsArrowExpressionClause; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsArrowExpressionClause, CsBinaryExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsAssignmentExpression) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsAssignmentExpression)"
  todoimpl # TODO(add:CsSimpleLambdaExpression, CsAssignmentExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsSimpleLambdaExpression, CsBinaryExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsSimpleLambdaExpression, CsInvocationExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsSimpleLambdaExpression, CsMemberAccessExpression)

method add*(parent: var CsForStatement; item: CsForStatement) =
  echo "in method add*(parent: var CsForStatement; item: CsForStatement)"
  todoimpl # TODO(add:CsForStatement, CsForStatement)

method add*(parent: var CsForStatement; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsForStatement; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add:CsForStatement, CsPrefixUnaryExpression)

method add*(parent: var CsWhileStatement; item: CsExpressionStatement) =
  echo "in method add*(parent: var CsWhileStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add:CsWhileStatement, CsExpressionStatement)

method add*(parent: var CsInterpolatedStringExpression; item: CsInterpolation) =
  echo "in method add*(parent: var CsInterpolatedStringExpression; item: CsInterpolation)"
  todoimpl # TODO(add:CsInterpolatedStringExpression, CsInterpolation)

method add*(parent: var CsUsingStatement; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsUsingStatement; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsUsingStatement, CsMemberAccessExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsAssignmentExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsAssignmentExpression)"
  todoimpl # TODO(add:CsParenthesizedLambdaExpression, CsAssignmentExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsConditionalExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsConditionalExpression)"
  todoimpl # TODO(add:CsParenthesizedLambdaExpression, CsConditionalExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsParenthesizedLambdaExpression, CsMemberAccessExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add:CsParenthesizedLambdaExpression, CsObjectCreationExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsPostfixUnaryExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add:CsParenthesizedLambdaExpression, CsPostfixUnaryExpression)

method add*(parent: var CsAccessor; item: CsArrowExpressionClause) =
  echo "in method add*(parent: var CsAccessor; item: CsArrowExpressionClause)"
  todoimpl # TODO(add:CsAccessor, CsArrowExpressionClause)

method add*(parent: var CsAssignmentExpression; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsPrefixUnaryExpression)

method add*(parent: var CsAssignmentExpression; item: CsArrayCreationExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsArrayCreationExpression)

method add*(parent: var CsInitializerExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsInitializerExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsInitializerExpression, CsInvocationExpression)

method add*(parent: var CsInvocationExpression; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsInvocationExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add:CsInvocationExpression, CsElementAccessExpression)

method add*(parent: var CsEqualsValueClause; item: CsConditionalExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsConditionalExpression)"
  todoimpl # TODO(add:CsEqualsValueClause, CsConditionalExpression)

method add*(parent: var CsArgument; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsArgument; item: CsElementAccessExpression)"
  todoimpl # TODO(add:CsArgument, CsElementAccessExpression)

method add*(parent: var CsArgument; item: CsArrayCreationExpression) =
  echo "in method add*(parent: var CsArgument; item: CsArrayCreationExpression)"
  todoimpl # TODO(add:CsArgument, CsArrayCreationExpression)

method add*(parent: var CsBinaryExpression; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add:CsBinaryExpression, CsPrefixUnaryExpression)

method add*(parent: var CsBinaryExpression; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add:CsBinaryExpression, CsObjectCreationExpression)

method add*(parent: var CsCastExpression; item: CsPredefinedType) =
  echo "in method add*(parent: var CsCastExpression; item: CsPredefinedType)"
  todoimpl # TODO(add:CsCastExpression, CsPredefinedType)

method add*(parent: var CsArrowExpressionClause; item: CsCastExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsCastExpression)"
  todoimpl # TODO(add:CsArrowExpressionClause, CsCastExpression)

method add*(parent: var CsArrowExpressionClause; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsLiteralExpression)"
  todoimpl # TODO(add:CsArrowExpressionClause, CsLiteralExpression)

method add*(parent: var CsForStatement; item: CsExpressionStatement) =
  echo "in method add*(parent: var CsForStatement; item: CsExpressionStatement)"
  todoimpl # TODO(add:CsForStatement, CsExpressionStatement)

method add*(parent: var CsElementAccessExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsElementAccessExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsElementAccessExpression, CsInvocationExpression)

method add*(parent: var CsElementAccessExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsElementAccessExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsElementAccessExpression, CsMemberAccessExpression)

method add*(parent: var CsParenthesizedExpression; item: CsCastExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsCastExpression)"
  todoimpl # TODO(add:CsParenthesizedExpression, CsCastExpression)

method add*(parent: var CsConditionalExpression; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsConditionalExpression, CsBinaryExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsParenthesizedLambdaExpression, CsInvocationExpression)
method add*(parent: var CsConstructorInitializer; item: CsArgumentList) =
  echo "in method add*(parent: var CsConstructorInitializer; item: CsArgumentList)"
  todoimpl # TODO(add:CsConstructorInitializer, CsArgumentList)
method add*(parent: var CsEqualsValueClause; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add:CsEqualsValueClause, CsPrefixUnaryExpression)

method add*(parent: var CsEqualsValueClause; item: CsCastExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsCastExpression)"
  todoimpl # TODO(add:CsEqualsValueClause, CsCastExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsPrefixUnaryExpression, CsMemberAccessExpression)

method add*(parent: var CsCastExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsCastExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsCastExpression, CsMemberAccessExpression)

method add*(parent: var CsArrowExpressionClause; item: CsInterpolatedStringExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add:CsArrowExpressionClause, CsInterpolatedStringExpression)

method add*(parent: var CsForStatement; item: CsAssignmentExpression) =
  echo "in method add*(parent: var CsForStatement; item: CsAssignmentExpression)"
  todoimpl # TODO(add:CsForStatement, CsAssignmentExpression)
method add*(parent: var CsParenthesizedExpression; item: CsConditionalExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsConditionalExpression)"
  todoimpl # TODO(add:CsParenthesizedExpression, CsConditionalExpression)
method add*(parent: var CsConditionalExpression; item: CsCastExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsCastExpression)"
  todoimpl # TODO(add:CsConditionalExpression, CsCastExpression)
method add*(parent: var CsInterpolation; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsInterpolation; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsInterpolation, CsMemberAccessExpression)

method add*(parent: var CsNamespace; item: CsMethod) =
  echo "in method add*(parent: var CsNamespace; item: CsMethod)"
  todoimpl # TODO(add:CsNamespace, CsMethod)

method add*(parent: var CsMethod; item: CsExplicitInterfaceSpecifier) =
  echo "in method add*(parent: var CsMethod; item: CsExplicitInterfaceSpecifier)"
  todoimpl # TODO(add:CsMethod, CsExplicitInterfaceSpecifier)

method add*(parent: var CsMethod; item: CsTypeParameterConstraintClause) =
  echo "in method add*(parent: var CsMethod; item: CsTypeParameterConstraintClause)"
  todoimpl # TODO(add:CsMethod, CsTypeParameterConstraintClause)

method add*(parent: var CsEnum; item: CsBaseList) =
  echo "in method add*(parent: var CsEnum; item: CsBaseList)"
  todoimpl # TODO(add:CsEnum, CsBaseList)

method add*(parent: var CsReturnStatement; item: CsTypeOfExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsTypeOfExpression)"
  todoimpl # TODO(add:CsReturnStatement, CsTypeOfExpression)
method add*(parent: var CsReturnStatement; item: CsThisExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsThisExpression)"
  todoimpl # TODO(add:CsReturnStatement, CsThisExpression)

method add*(parent: var CsReturnStatement; item: CsSimpleLambdaExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add:CsReturnStatement, CsSimpleLambdaExpression)
method add*(parent: var CsReturnStatement; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add:CsReturnStatement, CsPrefixUnaryExpression)

method add*(parent: var CsReturnStatement; item: CsParenthesizedLambdaExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add:CsReturnStatement, CsParenthesizedLambdaExpression)

method add*(parent: var CsReturnStatement; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsParenthesizedExpression)"
  todoimpl # TODO(add:CsReturnStatement, CsParenthesizedExpression)

method add*(parent: var CsReturnStatement; item: CsArrayCreationExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsArrayCreationExpression)"
  todoimpl # TODO(add:CsReturnStatement, CsArrayCreationExpression)

method add*(parent: var CsExpressionStatement; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsExpressionStatement; item: CsObjectCreationExpression)"
  todoimpl # TODO(add:CsExpressionStatement, CsObjectCreationExpression)

method add*(parent: var CsExpressionStatement; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsExpressionStatement; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add:CsExpressionStatement, CsPrefixUnaryExpression)
method add*(parent: var CsAssignmentExpression; item: CsConditionalExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsConditionalExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsConditionalExpression)

method add*(parent: var CsAssignmentExpression; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsElementAccessExpression)

method add*(parent: var CsInitializerExpression; item: CsCastExpression) =
  echo "in method add*(parent: var CsInitializerExpression; item: CsCastExpression)"
  todoimpl # TODO(add:CsInitializerExpression, CsCastExpression)

method add*(parent: var CsEqualsValueClause; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsElementAccessExpression)"
  todoimpl # TODO(add:CsEqualsValueClause, CsElementAccessExpression)

method add*(parent: var CsEqualsValueClause; item: CsTypeOfExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsTypeOfExpression)"
  todoimpl # TODO(add:CsEqualsValueClause, CsTypeOfExpression)

method add*(parent: var CsEqualsValueClause; item: CsInterpolatedStringExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add:CsEqualsValueClause, CsInterpolatedStringExpression)

method add*(parent: var CsEqualsValueClause; item: CsSimpleLambdaExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add:CsEqualsValueClause, CsSimpleLambdaExpression)

method add*(parent: var CsArgument; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsArgument; item: CsParenthesizedExpression)"
  todoimpl # TODO(add:CsArgument, CsParenthesizedExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add:CsPrefixUnaryExpression, CsParenthesizedExpression)

method add*(parent: var CsBinaryExpression; item: CsGenericName) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsGenericName)"
  todoimpl # TODO(add:CsBinaryExpression, CsGenericName)

method add*(parent: var CsBinaryExpression; item: CsPredefinedType) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsPredefinedType)"
  todoimpl # TODO(add:CsBinaryExpression, CsPredefinedType)

method add*(parent: var CsIfStatement; item: CsBreakStatement) =
  echo "in method add*(parent: var CsIfStatement; item: CsBreakStatement)"
  todoimpl # TODO(add:CsIfStatement, CsBreakStatement)

method add*(parent: var CsCastExpression; item: CsArrayType) =
  echo "in method add*(parent: var CsCastExpression; item: CsArrayType)"
  todoimpl # TODO(add:CsCastExpression, CsArrayType)

method add*(parent: var CsCastExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsCastExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsCastExpression, CsInvocationExpression)

method add*(parent: var CsCastExpression; item: CsGenericName) =
  echo "in method add*(parent: var CsCastExpression; item: CsGenericName)"
  todoimpl # TODO(add:CsCastExpression, CsGenericName)

method add*(parent: var CsCastExpression; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsCastExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add:CsCastExpression, CsLiteralExpression)

method add*(parent: var CsArrayType; item: CsGenericName) =
  echo "in method add*(parent: var CsArrayType; item: CsGenericName)"
  todoimpl # TODO(add:CsArrayType, CsGenericName)

method add*(parent: var CsArrayRankSpecifier; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsBinaryExpression)"
  todoimpl # TODO(add:CsArrayRankSpecifier, CsBinaryExpression)

method add*(parent: var CsArrayRankSpecifier; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsLiteralExpression)"
  todoimpl # TODO(add:CsArrayRankSpecifier, CsLiteralExpression)

method add*(parent: var CsArrowExpressionClause; item: CsTypeOfExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsTypeOfExpression)"
  todoimpl # TODO(add:CsArrowExpressionClause, CsTypeOfExpression)

method add*(parent: var CsArrowExpressionClause; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsObjectCreationExpression)"
  todoimpl # TODO(add:CsArrowExpressionClause, CsObjectCreationExpression)

method add*(parent: var CsArrowExpressionClause; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsArrowExpressionClause, CsMemberAccessExpression)

method add*(parent: var CsArrowExpressionClause; item: CsAssignmentExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsAssignmentExpression)"
  todoimpl # TODO(add:CsArrowExpressionClause, CsAssignmentExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add:CsSimpleLambdaExpression, CsObjectCreationExpression)

method add*(parent: var CsElementAccessExpression; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsElementAccessExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add:CsElementAccessExpression, CsElementAccessExpression)

method add*(parent: var CsWhileStatement; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsWhileStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsWhileStatement, CsInvocationExpression)

method add*(parent: var CsParenthesizedExpression; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add:CsParenthesizedExpression, CsPrefixUnaryExpression)

method add*(parent: var CsParenthesizedExpression; item: CsPostfixUnaryExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add:CsParenthesizedExpression, CsPostfixUnaryExpression)

method add*(parent: var CsParenthesizedExpression; item: CsParenthesizedLambdaExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add:CsParenthesizedExpression, CsParenthesizedLambdaExpression)

method add*(parent: var CsParenthesizedExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add:CsParenthesizedExpression, CsMemberAccessExpression)

method add*(parent: var CsParenthesizedExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsParenthesizedExpression, CsInvocationExpression)

method add*(parent: var CsParenthesizedExpression; item: CsAssignmentExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsAssignmentExpression)"
  todoimpl # TODO(add:CsParenthesizedExpression, CsAssignmentExpression)

method add*(parent: var CsConditionalExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add:CsConditionalExpression, CsInvocationExpression)

method add*(parent: var CsAssignmentExpression; item: CsInterpolatedStringExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add:CsAssignmentExpression, CsInterpolatedStringExpression)

method add*(parent: var CsInitializerExpression; item: CsTypeOfExpression) =
  echo "in method add*(parent: var CsInitializerExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add:CsInitializerExpression, CsTypeOfExpression)

method add*(parent: var CsLiteralExpression; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsLiteralExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsLiteralExpression, CsBinaryExpression)

method add*(parent: var CsEqualsValueClause; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsParenthesizedExpression)

method add*(parent: var CsMemberAccessExpression; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsLiteralExpression)

method add*(parent: var CsCastExpression; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsCastExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsCastExpression, CsObjectCreationExpression)

method add*(parent: var CsCastExpression; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsCastExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsCastExpression, CsElementAccessExpression)

method add*(parent: var CsCastExpression; item: CsCastExpression) =
  echo "in method add*(parent: var CsCastExpression; item: CsCastExpression)"
  todoimpl # TODO(add: CsCastExpression, CsCastExpression)

method add*(parent: var CsArrayRankSpecifier; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsArrayRankSpecifier; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsArrayRankSpecifier, CsMemberAccessExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsConditionalExpression) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsConditionalExpression)

method add*(parent: var CsWhileStatement; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsWhileStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsLiteralExpression)

method add*(parent: var CsConditionalExpression; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsObjectCreationExpression)

method add*(parent: var CsConditionalExpression; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsPrefixUnaryExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsBinaryExpression)

method add*(parent: var CsNamespace; item: CsExternAliasDirective) =
  echo "in method add*(parent: var CsNamespace; item: CsExternAliasDirective)"
  todoimpl # TODO(add: CsNamespace, CsExternAliasDirective)

method add*(parent: var CsMethod; item: CsCastExpression) =
  echo "in method add*(parent: var CsMethod; item: CsCastExpression)"
  todoimpl # TODO(add: CsMethod, CsCastExpression)

method add*(parent: var CsReturnStatement; item: CsPostfixUnaryExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsPostfixUnaryExpression)

method add*(parent: var CsConstructor; item: CsArrowExpressionClause) =
  echo "in method add*(parent: var CsConstructor; item: CsArrowExpressionClause)"
  todoimpl # TODO(add: CsConstructor, CsArrowExpressionClause)

method add*(parent: var CsAssignmentExpression; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsAssignmentExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsAssignmentExpression, CsParenthesizedExpression)

method add*(parent: var CsInitializerExpression; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsInitializerExpression; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsBinaryExpression)

method add*(parent: var CsInvocationExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsInvocationExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsInvocationExpression)

method add*(parent: var CsInvocationExpression; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsInvocationExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsInvocationExpression, CsLiteralExpression)

method add*(parent: var CsEqualsValueClause; item: CsAssignmentExpression) =
  echo "in method add*(parent: var CsEqualsValueClause; item: CsAssignmentExpression)"
  todoimpl # TODO(add: CsEqualsValueClause, CsAssignmentExpression)

method add*(parent: var CsArgument; item: CsPostfixUnaryExpression) =
  echo "in method add*(parent: var CsArgument; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsArgument, CsPostfixUnaryExpression)

method add*(parent: var CsPrefixUnaryExpression; item: CsCastExpression) =
  echo "in method add*(parent: var CsPrefixUnaryExpression; item: CsCastExpression)"
  todoimpl # TODO(add: CsPrefixUnaryExpression, CsCastExpression)

method add*(parent: var CsMemberAccessExpression; item: CsArrayCreationExpression) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsArrayCreationExpression)

method add*(parent: var CsBinaryExpression; item: CsArrayType) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsArrayType)"
  todoimpl # TODO(add: CsBinaryExpression, CsArrayType)

method add*(parent: var CsBinaryExpression; item: CsPostfixUnaryExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsPostfixUnaryExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsPostfixUnaryExpression)

method add*(parent: var CsBinaryExpression; item: CsThisExpression) =
  echo "in method add*(parent: var CsBinaryExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsBinaryExpression, CsThisExpression)

method add*(parent: var CsIfStatement; item: CsConditionalExpression) =
  echo "in method add*(parent: var CsIfStatement; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsIfStatement, CsConditionalExpression)

method add*(parent: var CsIfStatement; item: CsIfStatement) =
  echo "in method add*(parent: var CsIfStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsIfStatement, CsIfStatement)

method add*(parent: var CsIfStatement; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsIfStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsIfStatement, CsLiteralExpression)

method add*(parent: var CsIfStatement; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsIfStatement; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsIfStatement, CsParenthesizedExpression)

method add*(parent: var CsCastExpression; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsCastExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsCastExpression, CsPrefixUnaryExpression)

method add*(parent: var CsArrowExpressionClause; item: CsParenthesizedLambdaExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsParenthesizedLambdaExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsLiteralExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsParenthesizedExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsPrefixUnaryExpression)

method add*(parent: var CsSimpleLambdaExpression; item: CsSimpleLambdaExpression) =
  echo "in method add*(parent: var CsSimpleLambdaExpression; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add: CsSimpleLambdaExpression, CsSimpleLambdaExpression)

method add*(parent: var CsForStatement; item: CsIfStatement) =
  echo "in method add*(parent: var CsForStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsForStatement, CsIfStatement)

method add*(parent: var CsElementAccessExpression; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsElementAccessExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsObjectCreationExpression)

method add*(parent: var CsElementAccessExpression; item: CsThisExpression) =
  echo "in method add*(parent: var CsElementAccessExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsThisExpression)

method add*(parent: var CsSimpleBaseType; item: CsPredefinedType) =
  echo "in method add*(parent: var CsSimpleBaseType; item: CsPredefinedType)"
  todoimpl # TODO(add: CsSimpleBaseType, CsPredefinedType)

method add*(parent: var CsParenthesizedExpression; item: CsArrayCreationExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsArrayCreationExpression)

method add*(parent: var CsParenthesizedExpression; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsLiteralExpression)

method add*(parent: var CsParenthesizedExpression; item: CsObjectCreationExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsObjectCreationExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsObjectCreationExpression)

method add*(parent: var CsThrowStatement; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsThrowStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsThrowStatement, CsLiteralExpression)

method add*(parent: var CsConditionalExpression; item: CsInterpolatedStringExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsInterpolatedStringExpression)

method add*(parent: var CsConditionalExpression; item: CsTypeOfExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsTypeOfExpression)

method add*(parent: var CsUsingStatement; item: CsCastExpression) =
  echo "in method add*(parent: var CsUsingStatement; item: CsCastExpression)"
  todoimpl # TODO(add: CsUsingStatement, CsCastExpression)

method add*(parent: var CsUsingStatement; item: CsAssignmentExpression) =
  echo "in method add*(parent: var CsUsingStatement; item: CsAssignmentExpression)"
  todoimpl # TODO(add: CsUsingStatement, CsAssignmentExpression)

method add*(parent: var CsUsingStatement; item: CsIfStatement) =
  echo "in method add*(parent: var CsUsingStatement; item: CsIfStatement)"
  todoimpl # TODO(add: CsUsingStatement, CsIfStatement)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsParenthesizedLambdaExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsParenthesizedLambdaExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsParenthesizedLambdaExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsLiteralExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsCastExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsCastExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsCastExpression)

method add*(parent: var CsInterpolation; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsInterpolation; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsInterpolation, CsPrefixUnaryExpression)

method add*(parent: var CsInterpolation; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsInterpolation; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsInterpolation, CsLiteralExpression)

method add*(parent: var CsInterpolation; item: CsBinaryExpression) =
  echo "in method add*(parent: var CsInterpolation; item: CsBinaryExpression)"
  todoimpl # TODO(add: CsInterpolation, CsBinaryExpression)

method add*(parent: var CsPostfixUnaryExpression; item: CsMemberAccessExpression) =
  echo "in method add*(parent: var CsPostfixUnaryExpression; item: CsMemberAccessExpression)"
  todoimpl # TODO(add: CsPostfixUnaryExpression, CsMemberAccessExpression)

method add*(parent: var CsTypeOfExpression; item: CsPredefinedType) =
  echo "in method add*(parent: var CsTypeOfExpression; item: CsPredefinedType)"
  todoimpl # TODO(add: CsTypeOfExpression, CsPredefinedType)

method add*(parent: var CsTypeOfExpression; item: CsGenericName) =
  echo "in method add*(parent: var CsTypeOfExpression; item: CsGenericName)"
  todoimpl # TODO(add: CsTypeOfExpression, CsGenericName)

method add*(parent: var CsTypeOfExpression; item: CsArrayType) =
  echo "in method add*(parent: var CsTypeOfExpression; item: CsArrayType)"
  todoimpl # TODO(add: CsTypeOfExpression, CsArrayType)

method add*(parent: var CsParenthesizedExpression; item: CsSimpleLambdaExpression) =
  echo "in method add*(parent: var CsParenthesizedExpression; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add: CsParenthesizedExpression, CsSimpleLambdaExpression)

method add*(parent: var CsExplicitInterfaceSpecifier; item: CsGenericName) =
  echo "in method add*(parent: var CsExplicitInterfaceSpecifier; item: CsGenericName)"
  todoimpl # TODO(add: CsExplicitInterfaceSpecifier, CsGenericName)

method add*(parent: var CsPredefinedType; item: CsGenericName) =
  echo "in method add*(parent: var CsPredefinedType; item: CsGenericName)"
  todoimpl # TODO(add: CsPredefinedType, CsGenericName)

method add*(parent: var CsInitializerExpression; item: CsSimpleLambdaExpression) =
  echo "in method add*(parent: var CsInitializerExpression; item: CsSimpleLambdaExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsSimpleLambdaExpression)

method add*(parent: var CsIfStatement; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsIfStatement; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsIfStatement, CsElementAccessExpression)

method add*(parent: var CsElementAccessExpression; item: CsParenthesizedExpression) =
  echo "in method add*(parent: var CsElementAccessExpression; item: CsParenthesizedExpression)"
  todoimpl # TODO(add: CsElementAccessExpression, CsParenthesizedExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsTypeOfExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsTypeOfExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsTypeOfExpression)

method add*(parent: var CsPostfixUnaryExpression; item: CsElementAccessExpression) =
  echo "in method add*(parent: var CsPostfixUnaryExpression; item: CsElementAccessExpression)"
  todoimpl # TODO(add: CsPostfixUnaryExpression, CsElementAccessExpression)

method add*(parent: var CsPostfixUnaryExpression; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsPostfixUnaryExpression; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsPostfixUnaryExpression, CsInvocationExpression)

method add*(parent: var CsReturnStatement; item: CsInterpolatedStringExpression) =
  echo "in method add*(parent: var CsReturnStatement; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsReturnStatement, CsInterpolatedStringExpression)

method add*(parent: var CsConstructor; item: CsReturnStatement) =
  echo "in method add*(parent: var CsConstructor; item: CsReturnStatement)"
  todoimpl # TODO(add: CsConstructor, CsReturnStatement)

method add*(parent: var CsExpressionStatement; item: CsLiteralExpression) =
  echo "in method add*(parent: var CsExpressionStatement; item: CsLiteralExpression)"
  todoimpl # TODO(add: CsExpressionStatement, CsLiteralExpression)

method add*(parent: var CsInitializerExpression; item: CsConditionalExpression) =
  echo "in method add*(parent: var CsInitializerExpression; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsInitializerExpression, CsConditionalExpression)

method add*(parent: var CsMemberAccessExpression; item: CsInterpolatedStringExpression) =
  echo "in method add*(parent: var CsMemberAccessExpression; item: CsInterpolatedStringExpression)"
  todoimpl # TODO(add: CsMemberAccessExpression, CsInterpolatedStringExpression)

method add*(parent: var CsArrowExpressionClause; item: CsArrayCreationExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsArrayCreationExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsArrayCreationExpression)

method add*(parent: var CsArrowExpressionClause; item: CsConditionalExpression) =
  echo "in method add*(parent: var CsArrowExpressionClause; item: CsConditionalExpression)"
  todoimpl # TODO(add: CsArrowExpressionClause, CsConditionalExpression)

method add*(parent: var CsWhileStatement; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsWhileStatement; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsWhileStatement, CsPrefixUnaryExpression)

method add*(parent: var CsConditionalExpression; item: CsThisExpression) =
  echo "in method add*(parent: var CsConditionalExpression; item: CsThisExpression)"
  todoimpl # TODO(add: CsConditionalExpression, CsThisExpression)

method add*(parent: var CsUsingStatement; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsUsingStatement; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsUsingStatement, CsInvocationExpression)

method add*(parent: var CsParenthesizedLambdaExpression; item: CsPrefixUnaryExpression) =
  echo "in method add*(parent: var CsParenthesizedLambdaExpression; item: CsPrefixUnaryExpression)"
  todoimpl # TODO(add: CsParenthesizedLambdaExpression, CsPrefixUnaryExpression)

method add*(parent: var CsInterpolation; item: CsInvocationExpression) =
  echo "in method add*(parent: var CsInterpolation; item: CsInvocationExpression)"
  todoimpl # TODO(add: CsInterpolation, CsInvocationExpression)

method add*(parent: var CsNamespace; item: CsDelegate) =
  echo "in method add*(parent: var CsNamespace; item: CsDelegate)"
  todoimpl # TODO(add:CsNamespace, CsDelegate)


include "../missingAdds.nim"
