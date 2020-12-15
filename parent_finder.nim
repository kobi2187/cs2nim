# parent_finder.nim
import options, sequtils, all_needed_data
import info_center
import types, construct, constructs/cs_all_constructs
import constructs/cs_root, uuids

proc cfits*(parent, item: Construct; data: AllNeededData): bool = # asks the inner types to implement fits for these type arguments.
  result = case $parent.kind & ", " & $item.kind
  of "ckNamespace, ckClass": true
  of "ckClass, ckMethod": true
  else: raise newException(Exception, "cfits is missing " & $parent.kind & ", " & $item.kind)

proc  handleLiteralExpression(data:AllNeededData) : Option[UUID] =
  echo "obj is LiteralExpression"
  let prevName = data.previousConstruct.get.name
  case prevName
  of "EqualsValueClause":
    # we'll need to get prevprev construct and assign the value to it.
    let prevprevName = data.previousPreviousConstruct.get.name
    case prevprevName
      of "EnumMemberDeclaration":
        result = data.lastEnumMember.id
      else: assert false, prevprevName

  of "Argument": discard # TODO?
  of "ReturnStatement":
    assert data.classLastAdded in [ ClassParts.Methods, ClassParts.Properties, ClassParts.Ctors]
    result = data.lastBodyExprId

  else: assert false, prevName


# get parent checks that the types fit each other, and decides whether parent is a block type or one of its last added items, that expects to store that object. if cannot decide, we'll need to add more information from the C# side.
# figures out path from blocks. blocks now contain id as well.
# the bulk of the work shifts to here.
# this happens before we add to the parent.
proc determineParentId(obj: Construct; data: AllNeededData): Option[UUID] =
  
  echo "source code was: " & data.sourceCode
  if obj.parentId.isSome:
    echo "obj already has parent id, returning that."
    return obj.parentId

  echo obj.kind
  case obj.kind
  of ckClass:
    echo "obj is a class, returning the current namespace id"
    result = data.currentNamespace.id
    assert result.isSome and not result.get.isZero
  of ckNamespace:
    echo "obj is a namespace, returning None"
    result = none(UUID) # namespaces don't have a parentID, since we have just one root.
  of ckMethod:
    echo "object is a method"
    echo "last added in namespace: ", data.nsLastAdded
    assert data.nsLastAdded != NamespaceParts.Unset
    assert data.nsLastAdded == NamespaceParts.Classes # methods are in classes.
    assert data.lastClass != nil
    echo "last class has id:", data.lastClass.id
    return data.lastClass.id

  of ckPredefinedType:
    echo "object is a predefined type"
    echo data.previousConstruct.get.name
    
    case data.previousConstruct.get.name
    of "MethodDeclaration":
      echo data.lastClass.name
      echo data.lastClass.methods.mapIt(it.name)
      assert not data.lastMethod.isNil
      result = data.lastMethod.id
    of "PropertyDeclaration":
      result = data.lastProp.id
    of "IndexerDeclaration":
      assert data.lastClass.hasIndexer
      result = data.lastClass.indexer.id
    of "Parameter": discard
    of "IdentifierName": discard

  of ckParameter:
    echo "object is Parameter"
    case data.classLastAdded:
    of ClassParts.Methods:
      result = data.lastMethod.parameterList.id
    of ClassParts.Ctors:
      result = data.lastCtor.parameterList.id
    of ClassParts.Indexer:
      assert data.lastClass.hasIndexer
      result = data.lastClass.indexer.id
    else: assert false, "not implemented " & $data.classLastAdded

  of ckUsingDirective:
    echo "object is UsingDirective"
    result = data.currentNamespace.id

  of ckEnum:
    echo "object is EnumDeclaration"
    result = data.currentNamespace.id
  of ckEnumMember:
    echo "object is EnumMemberDeclaration"
    result = data.lastEnum.id
    # data.currentNamespace

  of ckReturnStatement:
    echo "obj is ReturnStatement"
    echo "we should be inside ctor, method, indexer, or property"
    result = data.idLastClassPart()
  
  of ckArgumentList:
    echo "object is ArgumentList"
    echo "we assume we're in method, but if there are more options change that."
    assert data.classLastAdded in [ ClassParts.Methods,  ClassParts.Properties,  ClassParts.Ctors ]
    assert data.lastMethod.body.len > 0
    result = lastBodyExprId(data.lastMethod)

  of ckExpressionStatement:
    echo "obj is ExpressionStatement"
    echo "we assume we're in method, but if there are more options change that."
    assert data.classLastAdded in [ ClassParts.Methods ]
    assert data.lastMethod.body.len > 0
    result = data.lastMethodBodyExpr.id

  of ckIndexer:
    echo "obj is IndexerDeclaration"
    assert data.lastClass.hasIndexer
    result = data.lastClass.indexer.id

  of ckParameterList:
    echo "obj is ParameterList"
    # last method or ctor
    assert data.classLastAdded in [ ClassParts.Ctors, ClassParts.Methods]
    result = data.idLastClassPart

  of ckConstructor:
    echo "obj is Constructor"
    result = data.lastClass.id

  of ckProperty:
    echo "obj is property"
    # can be interfaces or classes
    assert data.nsLastAdded in [ NamespaceParts.Interfaces, NamespaceParts.Classes]
    result = data.idLastNsPart()

  of ckInvocationExpression:
    echo "obj is InvocationExpression"
    result = data.lastMethodBodyExpr.id

  of ckArgument: 
    echo "obj is Argument, older code was discarding -- TODO?"
    discard #TODO?
  of ckLiteralExpression:
    result = handleLiteralExpression(data)

  of ckExplicitInterfaceSpecifier:
    echo "obj is ExplicitInterfaceSpecifier"
    if data.previousPreviousConstruct.get.name == "IndexerDeclaration":
      if data.lastClass.hasIndexer:
        result = data.lastClass.indexer.id
      else : result = none(UUID)

  of [ ckObjectCreationExpression,  ckSimpleBaseType, ckBaseList ]:
    assert false
    # raise notimplementedException


proc getParent*(root: var CsRoot; newobj: Construct; allData: AllNeededData): Option[Construct] =
  echo "in getParent"
  echo "newobj: ", newobj.kind
  let pid = determineParentId(newobj, allData)
  assert pid.isSome and not pid.get.isZero
  echo "parent id found: ", $pid
  result = root.infoCenter.fetch(pid.get)
  if result.isNone:
    echo "couldn't find registered object for this id"
    echo root.infoCenter.keys

# gets last open block,
# asks last block's last item whether it expects more data, check if last item fits newobj
# if yes, mark it as the chosen parent.
# if not, check if last block fits newobj. if yes, mark last block as the chosen parent.
# else return none(Construct)

