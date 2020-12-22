# parent_finder.nim
import options, sequtils, all_needed_data, block_utils
import info_center
import types, construct, constructs/cs_all_constructs
import constructs/cs_root, uuids

proc cfits*(parent, item: Construct; data: AllNeededData): bool = # asks the inner types to implement fits for these type arguments.
  result = case $parent.kind & ", " & $item.kind
  of "ckNamespace, ckClass": true
  of "ckNamespace, ckEnum": true
  of "ckEnum, ckEnumMember": true
  of "ckClass, ckMethod": true
  of "ckMethod, ckParameterList": true
  of "ckMethod, ckPredefinedType": true
  of "ckMethod, ckLocalDeclarationStatement": true
  of "ckMethod, ckReturnStatement": true
  of "ckEnumMember, ckEqualsValueClause": true
  of "ckEnumMember, ckLiteralExpression": true
  of "ckReturnStatement, ckLiteralExpression": true 
  of "ckParameterList, ckParameter": true
  of "ckClass, ckBaseList": true
  of "ckClass, ckSimpleBaseType": true
  of "ckConstructor, ckParameterList": true
  of "ckClass, ckConstructor": true
  of "ckClass, ckIndexer": true 
  of "ckIndexer, ckPredefinedType": true
  of "ckIndexer, ckExplicitInterfaceSpecifier": true
  of "ckIndexer, ckBracketedParameterList": true
  of "ckIndexer, ckParameter": true
  of "ckIndexer, ckAccessorList": true 
  of "ckAccessorList, ckAccessor": true
  of "ckClass, ckProperty": true 
  of "ckProperty, ckPredefinedType": true
  of "ckProperty, ckAccessorList": true
  of "ckNamespace, ckUsingDirective": true
  of "ckMethod, ckExpressionStatement": true
  of "ckMethod, ckInvocationExpression": true 
  of "ckExpressionStatement, ckInvocationExpression": true
  of "ckExpressionStatement, ckArgumentList": true
  of "ckExpressionStatement, ckArgument": true
  of "ckConstructor, ckExpressionStatement": true
  of "ckConstructor, ckAssignmentExpression": true 
  of "ckConstructor, ckConstructorInitializer": true 
  of "ckConstructor, ckArgumentList": true # likely for initializer
  of "ckLocalDeclarationStatement, ckVariable": true
  of "ckLocalDeclarationStatement, ckGenericName": true
  of "ckLocalDeclarationStatement, ckTypeArgumentList": true 
  of "ckLocalDeclarationStatement, ckVariableDeclarator": true
  of "ckVariableDeclarator, ckEqualsValueClause": true
  of "ckVariableDeclarator, ckObjectCreationExpression": true 
  of "ckLocalDeclarationStatement, ckArgumentList": true
  of "ckMethod, ckAssignmentExpression": true 
  of "ckAssignmentExpression, ckObjectCreationExpression": true 
  of "ckReturnStatement, ckObjectCreationExpression": true 
  of "ckReturnStatement, ckArgumentList": true
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

  of ["IdentifierName","Argument"]: discard # TODO?
  of "ReturnStatement":
    assert data.classLastAdded in [ ClassParts.Methods, ClassParts.Properties, ClassParts.Ctors]
    result = data.lastBodyExprId

  else: assert false, prevName


# get parent checks that the types fit each other, and decides whether parent is a block type or one of its last added items, that expects to store that object. if cannot decide, we'll need to add more information from the C# side.
# figures out path from blocks. blocks now contain id as well.
# the bulk of the work shifts to here.
# this happens before we add to the parent.
import state_utils, state
proc determineParentId(obj: Construct; data: AllNeededData): (bool,Option[UUID]) =
  var discarded = false
  var res:Option[UUID]
  echo "source code was: " & data.sourceCode
  if obj.parentId.isSome:
    echo "obj already has parent id, returning that."
    return (discarded,obj.parentId)

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
    res = data.idLastClassPart
  of ckClass:
    echo "obj is a class, returning the current namespace id"
    res = data.currentNamespace.id
    assert res.isSome and not res.get.isZero
  of ckNamespace:
    echo "obj is a namespace, returning None"
    res = none(UUID) # namespaces don't have a parentID, since we have just one root.
  of ckMethod:
    echo "object is a method"
    echo "last added in namespace: ", data.nsLastAdded
    assert data.nsLastAdded != NamespaceParts.Unset
    assert data.nsLastAdded == NamespaceParts.Classes # methods are in classes.
    assert data.lastClass != nil
    echo "last class has id:", data.lastClass.id
    return (discarded,data.lastClass.id)

  of ckPredefinedType:
    echo "object is a predefined type"
    
    echo data.previousConstruct.get.name
    
    case data.previousConstruct.get.name
    of "MethodDeclaration":
      echo data.lastClass.name
      echo data.lastClass.methods.mapIt(it.name)
      assert not data.lastMethod.isNil
      assert data.lastMethod.id.isSome
      res = data.lastMethod.id
    of "PropertyDeclaration":
      res = data.lastProp.id
    of "IndexerDeclaration":
      assert data.lastClass.hasIndexer
      res = data.lastClass.indexer.id
    of ["Parameter" , "IdentifierName", "TypeArgumentList"]: discarded = true

    else: 
      echo "in ckPredefinedType: not all cases were matched"
      return (discarded,none(UUID))
  of ckParameter:
    echo "object is Parameter"
    case data.classLastAdded:
    of ClassParts.Methods:
      res = data.lastMethod.parameterList.id
    of ClassParts.Ctors:
      res = data.lastCtor.parameterList.id
    of ClassParts.Indexer:
      assert data.lastClass.hasIndexer
      res = data.lastClass.indexer.id
    else: assert false, "not implemented " & $data.classLastAdded

  of ckUsingDirective:
    echo "object is UsingDirective"
    res = data.currentNamespace.id

  of ckEnum:
    echo "object is EnumDeclaration"
    res = data.currentNamespace.id
  of ckEnumMember:
    echo "object is EnumMemberDeclaration"
    res = data.lastEnum.id
    # data.currentNamespace

  of ckReturnStatement:
    echo "obj is ReturnStatement"
    echo "we should be inside ctor, method, indexer, or property"
    res = data.idLastClassPart()
  
  of ckArgumentList:
    echo "object is ArgumentList"
    echo "we assume we're in method or ctor, or property, but if there are more options change that."
    assert data.classLastAdded in [ ClassParts.Methods,  ClassParts.Properties,  ClassParts.Ctors ]
    # assert data.lastMethod.body.len > 0
    # res = lastBodyExprId(data.lastMethod)
    # echo data.classLastAdded
    # echo data.lastCtor.name
    # echo data.lastCtor.body.mapIt(it.ttype)
    echo data.classLastAdded
    if data.classLastAdded == Ctors and data.lastCtor.body.isEmpty and data.lastCtor.initializer != nil:
      # then it could belong to initializer -- hmmm... we depend here on order (first ctor, then ctor init). a little fishy.
      res = data.lastCtor.id
    else:    
      res = data.lastBodyExprId

  of ckExpressionStatement:
    echo "obj is ExpressionStatement"
    # echo "we assume we're in method or ctor, but if there are more options change that."
    assert data.classLastAdded in [ ClassParts.Methods, ClassParts.Ctors ], $data.classLastAdded 
    res = data.idLastClassPart
  
  of ckAssignmentExpression:
    echo "obj is AssignmentExpression"
    assert data.classLastAdded in [ ClassParts.Methods, ClassParts.Ctors ], $data.classLastAdded 
    res = data.idLastClassPart

  of ckIndexer:
    echo "obj is IndexerDeclaration"
    res = data.lastClass.id

  of ckParameterList:
    echo "obj is ParameterList"
    # last method or ctor
    assert data.classLastAdded in [ ClassParts.Ctors, ClassParts.Methods]
    res = data.idLastClassPart

  of ckConstructor:
    echo "obj is Constructor"
    res = data.lastClass.id

  of ckProperty:
    echo "obj is property"
    # can be interfaces or classes
    assert data.nsLastAdded in [ NamespaceParts.Interfaces, NamespaceParts.Classes]
    res = data.idLastNsPart()

  of ckInvocationExpression:
    echo "obj is InvocationExpression"
    # res = data.lastMethod.id 
    if data.lastMethod.body.len == 0:
      res = data.lastMethod.id
    else:
      res = data.lastMethod.lastBodyExprId

  of ckArgument: 
    echo "obj is Argument, older code was discarding -- TODO?"
    # here we add to possibly many types. first: expression
    case data.classLastAdded
    of Methods:
      res = data.lastBodyExprId
    else: assert false, $data.classLastAdded
  of ckLiteralExpression:
    res = handleLiteralExpression(data)
    if res.isNone: discarded = true


  of ckExplicitInterfaceSpecifier:
    echo "obj is ExplicitInterfaceSpecifier"
    if data.previousPreviousConstruct.get.name == "IndexerDeclaration":
      if data.lastClass.hasIndexer:
        res = data.lastClass.indexer.id
      else : res = none(UUID)
  of ckEqualsValueClause:
    echo "obj is EqualsValueClause"
    # the parent is the previous construct. TODO: some checks needed?
    assert data.previousConstruct.isSome
    echo data.previousConstruct
    res = some(data.previousConstruct.get.id)
    assert data.previousconstruct.get.name in [ "EnumMemberDeclaration" , "VariableDeclarator"], data.previousconstruct.get.name
    # currentRoot.previousConstructObj()
  of ckBaseList, ckSimpleBaseType:  # interfaces, classes or structs can have a baselist to extend
    assert data.nsLastAdded in [ Classes, Interfaces]#, Structs ] 
    res = data.idLastNsPart
  of ckBracketedParameterList: # for now, I assume only for indexer.
    assert data.classLastAdded == ClassParts.Indexer
    res = data.idLastClassPart

  of ckAccessorList: # for properties and indexer, others? both are in class.
    assert data.classLastAdded in [ ClassParts.Properties, ClassParts.Indexer]
    res = data.idLastClassPart
  of ckAccessor: # find its parent:AccessorList
    assert data.classLastAdded in [ ClassParts.Properties, ClassParts.Indexer]
    case data.classLastAdded
    of Properties: 
      res=data.lastProp.acclist.id
    of Indexer: 
      assert data.lastClass.hasIndexer
      assert data.lastClass.indexer.aclist != nil
      res = data.lastClass.indexer.aclist.id
    else: assert false, " where else? " & $data.classLastAdded
  of ckMemberAccessExpression: discarded = true
  of ckConstructorInitializer: 
    # parent is ckConstructor.
    assert data.classLastAdded == ClassParts.Ctors
    res = data.lastCtor.id
  of ckVariable:
    # can be in a method, can be in a class (as instance var)
    # if it is a variable declaration, add the actual declaration to this wrapper.
    # echo data.inBlock
    # echo data.prevBlock
    # echo data.currentConstruct
    case  data.previousConstruct.get.name
    of "LocalDeclarationStatement":
      # we're in a method, get the last body id.
      assert data.classLastAdded == Methods, $data.classLastAdded
      res = data.lastBodyExprId # "hopefully" this is the local declaration.
      
    else: assert false, "please add more: " &   data.previousConstruct.get.name
       

  of ckGenericName: # NOTE:don't know how it should be structured. probably part of csvariable.
    case data.previousConstruct.get.name
    of ["VariableDeclaration", "ObjectCreationExpression"]:
      assert data.classLastAdded == Methods, $data.classLastAdded
      res = data.lastBodyExprId
    else: assert false, data.previousConstruct.get.name
  
  
  of ckTypeArgumentList:
    case data.previousConstruct.get.name
    of "GenericName":
      assert data.classLastAdded == Methods, $data.classLastAdded
      res = data.lastBodyExprId
    else: assert false, data.previousConstruct.get.name
  
  of ckVariableDeclarator: # for now assume we're in method, add more later.
    assert data.classLastAdded == Methods, $data.classLastAdded
    res = data.lastBodyExprId # this will create a few chained adds but we don't care.
    
  of ckObjectCreationExpression: # store in assignment expression # not variable declarator.
    case data.previousPreviousConstruct.get.name & ", " & data.previousConstruct.get.name
    of "VariableDeclarator, EqualsValueClause":
      # based on last 2 constructs: variableDeclarator equalsvalueclause ...
      res = data.previousPreviousConstruct.get.id.some
    of "AssignmentExpression, IdentifierName":
      res = data.previousPreviousConstruct.get.id.some
    of "ParameterList, ReturnStatement":
      res = data.previousConstruct.get.id.some

    else: assert false, data.previousPreviousConstruct.get.name & ", " & data.previousConstruct.get.name
    
    # HAVE TO FIGURE THIS OUT, can i just put them all one after another in a body seq?
  # of [ckInvocationExpression, ckAnonymousMethodExpression, ckAnonymousObjectCreationExpression, ckArrayCreationExpression, ckArrowExpressionClause, ckAssignmentExpression, ckAwaitExpression, ckBaseExpression, ckBinaryExpression, ckBreakStatement, ckCastExpression, ckCheckedExpression, ckCheckedStatement, ckConditionalAccessExpression, ckConditionalExpression, ckContinueStatement, ckDeclarationExpression, ckDefaultExpression, ckDoStatement, ckElementAccessExpression, ckElementBindingExpression, ckEmptyStatement, ckExpressionStatement, ckFixedStatement, ckForEachStatement, ckForEachVariableStatement, ckForStatement, ckGlobalStatement, ckGotoStatement, ckIfStatement, ckImplicitArrayCreationExpression, ckImplicitObjectCreationExpression, ckImplicitStackAllocArrayCreationExpression, ckInitializerExpression, ckInterpolatedStringExpression, ckIsPatternExpression, ckLabeledStatement, ckLiteralExpression, ckLocalDeclarationStatement, ckLocalFunctionStatement, ckLockStatement, ckMakeRefExpression, ckMemberAccessExpression, ckMemberBindingExpression, ckObjectCreationExpression, ckOmittedArraySizeExpression, ckParenthesizedExpression, ckParenthesizedLambdaExpression, ckPostfixUnaryExpression, ckPrefixUnaryExpression, ckQueryExpression, ckRangeExpression, ckRefExpression, ckRefTypeExpression, ckRefValueExpression, ckReturnStatement, ckSimpleLambdaExpression, ckSizeOfExpression, ckStackAllocArrayCreationExpression, ckSwitchExpression, ckSwitchExpressionArm, ckSwitchStatement, ckThisExpression, ckThrowExpression, ckThrowStatement, ckTryStatement, ckTupleExpression, ckTypeOfExpression, ckUnsafeStatement, ckUsingStatement, ckWhileStatement, ckWithExpression, ckYieldStatement]:
  #   res = data.idLastClassPart

  of [ckField, ckBinaryExpression,   ckIfStatement, ckThisExpression,  ckBracketedArgumentList, ckElementAccessExpression,  ckParenthesizedExpression, ckCastExpression, ckArrayRankSpecifier, ckArrayType, ckPrefixUnaryExpression, ckOmittedArraySizeExpression, ckInitializerExpression, ckNameEquals, ckThrowStatement, ckTypeOfExpression, ckElseClause, ckCaseSwitchLabel, ckSwitchSection, ckSimpleLambdaExpression, ckPostfixUnaryExpression, ckArrayCreationExpression, ckArrowExpressionClause, ckBreakStatement, ckAliasQualifiedName, ckTypeParameter, ckAwaitExpression, ckConditionalExpression, ckTypeParameterList, ckForEachStatement, ckForStatement, ckInterpolatedStringText, ckParenthesizedLambdaExpression, ckTryStatement, ckNullableType, ckBaseExpression, ckCatchClause,  ckInterpolation, ckCatch, ckNameColon, ckUsingStatement, ckTypeParameterConstraintClause, ckTypeConstraint, ckSingleVariableDesignation, ckInterpolatedStringExpression, ckImplicitArrayCreationExpression, ckWhileStatement, ckDeclarationExpression, ckConditionalAccessExpression, ckSwitchStatement, ckMemberBindingExpression, ckDefaultExpression, ckPointerType, ckInterface, ckContinueStatement, ckFinallyClause, ckDefaultSwitchLabel, ckYieldStatement, ckAnonymousObjectMemberDeclarator, ckCheckedExpression, ckStruct, ckIsPatternExpression, ckLockStatement, ckDeclarationPattern, ckThrowExpression, ckConstantPattern, ckRefType, ckRefExpression, ckClassOrStructConstraint, ckOmittedTypeArgument, ckTupleElement, ckOperator, ckEventField, ckDelegate, ckImplicitElementAccess, ckAnonymousMethodExpression, ckTupleExpression, ckAnonymousObjectCreationExpression,  ckEvent, ckGotoStatement, ckDoStatement, ckGlobalStatement, ckIncompleteMember, ckLocalFunctionStatement, ckConversionOperator, ckTupleType, ckFixedStatement, ckEmptyStatement, ckSizeOfExpression, ckQueryBody, ckCheckedStatement, ckQueryExpression, ckCasePatternSwitchLabel, ckLabeledStatement, ckConstructorConstraint, ckUnsafeStatement, ckParenthesizedVariableDesignation, ckInterpolationFormatClause, ckDestructor, ckDiscardDesignation, ckStackAllocArrayCreationExpression, ckWhenClause, ckForEachVariableStatement, ckLetClause, ckElementBindingExpression, ckCatchFilterClause, ckOrdering, ckInterpolationAlignmentClause, ckQueryContinuation, ckExternAliasDirective, ckMakeRefExpression, ckRefValueExpression, ckRefTypeExpression, ckBlock,  ckBinaryPattern, ckDiscardPattern, ckFunctionPointerType, ckImplicitObjectCreationExpression,  ckParenthesizedPattern, ckPositionalPatternClause, ckPrimaryConstructorBaseType, ckPropertyPatternClause, ckRangeExpression, ckRecord, ckRecursivePattern, ckRelationalPattern, ckSubpattern, ckSwitchExpression, ckSwitchExpressionArm, ckTypePattern, ckUnaryPattern, ckVarPattern, ckWithExpression, ckImplicitStackAllocArrayCreationExpression ]:
    assert false, $obj.kind & " is still unsupported"
    # raise notimplementedException
  result = (discarded,res)

proc getParent*(root: var CsRoot; newobj: Construct; allData: AllNeededData): (bool,Option[Construct]) =
  var res:Option[Construct]
  echo "in getParent"
  echo "newobj: ", newobj.kind
  let (dis,pid) = determineParentId(newobj, allData)
  if newobj.kind != ckNamespace and pid.isSome():
    assert pid.isSome and not pid.get.isZero
    echo "parent id found: ", $pid
    res = root.infoCenter.fetch(pid.get)
    if res.isNone:
      echo "couldn't find registered object for this id"
      echo root.infoCenter.keys
  result = (dis,res)