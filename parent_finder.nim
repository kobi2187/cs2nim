# parent_finder.nim
import options, sequtils, all_needed_data
import info_center
import types, construct, constructs/cs_all_constructs
import constructs/cs_root, uuids

proc cfits*(parent, item: Construct; data: AllNeededData): bool = # asks the inner types to implement fits for these type arguments.
  result = case $parent.kind & ", " & $item.kind
  of "ckNamespace, ckClass": true
  of "ckNamespace, ckEnum": true
  of "ckMethod, ckParameterList": true
  of "ckClass, ckMethod": true
  of "ckMethod, ckPredefinedType": true
  of "ckMethod, ckLocalDeclarationStatement": true
  of "ckEnum, ckEnumMember": true
  of "ckEnumMember, ckEqualsValueClause": true
  of "ckEnumMember, ckLiteralExpression": true
  else: raise newException(Exception, "cfits is missing:  of \"" & $parent.kind & ", " & $item.kind & "\": true")

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
import state_utils
proc determineParentId(obj: Construct; data: AllNeededData): Option[UUID] =
  echo "source code was: " & data.sourceCode
  if obj.parentId.isSome:
    echo "obj already has parent id, returning that."
    return obj.parentId

  echo obj.kind
  case obj.kind
  # of ckVariableDeclarator: # TODO
  #   echo "obj is a variable declarator"
  #   # hmm, can be in multiple parts (instance var, or local var). we have to know the last added construct.
      # I think the local declaration is a wrapper for this object.
      # i think this object can also be wrapped in an instance var. don't know yet.
  #   assert false
  of ckLocalDeclarationStatement:
    echo "obj is a local declaration"
    # exists in methods, ctors, properties.
    assert data.classLastAdded in [Methods,Properties, Ctors]
    result = data.idLastClassPart
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
  of ckEqualsValueClause:
    echo "obj is EqualsValueClause"
    # the parent is the previous construct. TODO: some checks needed?
    assert data.previousConstruct.isSome
    echo data.previousConstruct
    result = some(data.previousConstruct.get.id)
    assert data.previousconstruct.get.name in [ "EnumMemberDeclaration" ], data.previousconstruct.get.name
    # currentRoot.previousConstructObj()
  of [ckVariableDeclarator, ckBinaryExpression, ckAssignmentExpression,  ckIfStatement, ckThisExpression, ckTypeArgumentList, ckGenericName, ckAccessor, ckBracketedArgumentList, ckElementAccessExpression, ckAccessorList, ckParenthesizedExpression, ckCastExpression, ckArrayRankSpecifier, ckArrayType, ckPrefixUnaryExpression, ckOmittedArraySizeExpression, ckInitializerExpression, ckNameEquals, ckThrowStatement, ckTypeOfExpression, ckElseClause, ckCaseSwitchLabel, ckSwitchSection, ckSimpleLambdaExpression, ckPostfixUnaryExpression, ckArrayCreationExpression, ckArrowExpressionClause, ckBreakStatement, ckAliasQualifiedName, ckTypeParameter, ckAwaitExpression, ckConditionalExpression, ckTypeParameterList, ckForEachStatement, ckForStatement, ckInterpolatedStringText, ckParenthesizedLambdaExpression, ckTryStatement, ckNullableType, ckBaseExpression, ckCatchClause, ckConstructorInitializer, ckInterpolation, ckCatch, ckNameColon, ckUsingStatement, ckTypeParameterConstraintClause, ckTypeConstraint, ckSingleVariableDesignation, ckInterpolatedStringExpression, ckImplicitArrayCreationExpression, ckWhileStatement, ckDeclarationExpression, ckConditionalAccessExpression, ckSwitchStatement, ckMemberBindingExpression, ckDefaultExpression, ckPointerType, ckInterface, ckContinueStatement, ckFinallyClause, ckDefaultSwitchLabel, ckYieldStatement, ckAnonymousObjectMemberDeclarator, ckCheckedExpression, ckStruct, ckIsPatternExpression, ckLockStatement, ckDeclarationPattern, ckThrowExpression, ckConstantPattern, ckRefType, ckRefExpression, ckClassOrStructConstraint, ckOmittedTypeArgument, ckTupleElement, ckOperator, ckEventField, ckDelegate, ckImplicitElementAccess, ckAnonymousMethodExpression, ckTupleExpression, ckAnonymousObjectCreationExpression, ckBracketedParameterList, ckEvent, ckGotoStatement, ckDoStatement, ckGlobalStatement, ckIncompleteMember, ckLocalFunctionStatement, ckConversionOperator, ckTupleType, ckFixedStatement, ckEmptyStatement, ckSizeOfExpression, ckQueryBody, ckCheckedStatement, ckQueryExpression, ckCasePatternSwitchLabel, ckLabeledStatement, ckConstructorConstraint, ckUnsafeStatement, ckParenthesizedVariableDesignation, ckInterpolationFormatClause, ckDestructor, ckDiscardDesignation, ckStackAllocArrayCreationExpression, ckWhenClause, ckForEachVariableStatement, ckLetClause, ckElementBindingExpression, ckCatchFilterClause, ckOrdering, ckInterpolationAlignmentClause, ckQueryContinuation, ckExternAliasDirective, ckMakeRefExpression, ckRefValueExpression, ckRefTypeExpression, ckBlock, ckVariable, ckBinaryPattern, ckDiscardPattern, ckFunctionPointerType, ckImplicitObjectCreationExpression, ckMemberAccessExpression, ckParenthesizedPattern, ckPositionalPatternClause, ckPrimaryConstructorBaseType, ckPropertyPatternClause, ckRangeExpression, ckRecord, ckRecursivePattern, ckRelationalPattern, ckSubpattern, ckSwitchExpression, ckSwitchExpressionArm, ckTypePattern, ckUnaryPattern, ckVarPattern, ckWithExpression, ckImplicitStackAllocArrayCreationExpression, ckObjectCreationExpression,  ckSimpleBaseType, ckBaseList ]:
    assert false, $obj.kind & " is still unsupported"
    # raise notimplementedException


proc getParent*(root: var CsRoot; newobj: Construct; allData: AllNeededData): Option[Construct] =
  echo "in getParent"
  echo "newobj: ", newobj.kind
  let pid = determineParentId(newobj, allData)
  if pid.isSome():
    assert pid.isSome and not pid.get.isZero
    echo "parent id found: ", $pid
    result = root.infoCenter.fetch(pid.get)
    if result.isNone:
      echo "couldn't find registered object for this id"
      echo root.infoCenter.keys
  else: # can happen if namespace is the object.
    assert newobj.kind == ckNamespace
    return # none

# gets last open block,
# asks last block's last item whether it expects more data, check if last item fits newobj
# if yes, mark it as the chosen parent.
# if not, check if last block fits newobj. if yes, mark last block as the chosen parent.
# else return none(Construct)

