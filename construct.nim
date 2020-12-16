# construct.nim
import constructs/cs_all_constructs, uuids

type ConstructKind* = enum
  # ckRoot # nah, too special.
  ckNamespace,
  ckClass,
  ckMethod,
  ckEnum,
  # to be added.
  ckPredefinedType
  ckArgumentList, ckObjectCreationExpression, ckUsingDirective, ckEnumMember, ckIndexer, ckParameterList, ckParameter, ckArgument, ckConstructor, ckReturnStatement, ckLiteralExpression, ckSimpleBaseType, ckBaseList, ckProperty, ckExplicitInterfaceSpecifier, ckExpressionStatement, ckInvocationExpression,
  ckLocalDeclarationStatement,ckVariableDeclarator

 # unsupported:
   ckBinaryExpression, ckAssignmentExpression, ckEqualsValueClause, ckIfStatement, ckThisExpression, ckTypeArgumentList, ckGenericName, ckAccessor, ckBracketedArgumentList, ckElementAccessExpression, ckAccessorList, ckParenthesizedExpression, ckCastExpression, ckArrayRankSpecifier, ckArrayType, ckPrefixUnaryExpression, ckOmittedArraySizeExpression,
   ckInitializerExpression, ckNameEquals, ckThrowStatement, ckTypeOfExpression, ckElseClause, ckCaseSwitchLabel, ckSwitchSection, ckSimpleLambdaExpression, ckPostfixUnaryExpression, ckArrayCreationExpression, ckArrowExpressionClause, ckBreakStatement, ckAliasQualifiedName, ckTypeParameter, ckAwaitExpression, ckConditionalExpression, ckTypeParameterList, ckForEachStatement, ckForStatement,
   ckInterpolatedStringText, ckParenthesizedLambdaExpression, ckTryStatement, ckNullableType, ckBaseExpression, ckCatchClause, ckConstructorInitializer, ckInterpolation, ckCatch, ckNameColon, ckUsingStatement, ckTypeParameterConstraintClause, ckTypeConstraint, ckSingleVariableDesignation, ckInterpolatedStringExpression, ckImplicitArrayCreationExpression, ckWhileStatement,
   ckDeclarationExpression, ckConditionalAccessExpression, ckSwitchStatement, ckMemberBindingExpression, ckDefaultExpression, ckPointerType, ckInterface, ckContinueStatement, ckFinallyClause, ckDefaultSwitchLabel, ckYieldStatement, ckAnonymousObjectMemberDeclarator, ckCheckedExpression, ckStruct, ckIsPatternExpression, ckLockStatement, ckDeclarationPattern, ckThrowExpression, ckConstantPattern,
   ckRefType, ckRefExpression, ckClassOrStructConstraint, ckOmittedTypeArgument, ckTupleElement, ckOperator, ckEventField, ckDelegate, ckImplicitElementAccess, ckAnonymousMethodExpression, ckTupleExpression, ckAnonymousObjectCreationExpression, ckBracketedParameterList, ckEvent, ckGotoStatement, ckDoStatement, ckGlobalStatement, ckIncompleteMember, ckLocalFunctionStatement,
   ckConversionOperator, ckTupleType, ckFixedStatement, ckEmptyStatement, ckSizeOfExpression, ckQueryBody, ckCheckedStatement, ckQueryExpression, ckCasePatternSwitchLabel, ckLabeledStatement, ckConstructorConstraint, ckUnsafeStatement, ckParenthesizedVariableDesignation, ckInterpolationFormatClause, ckDestructor, ckDiscardDesignation, ckStackAllocArrayCreationExpression, ckWhenClause,
   ckForEachVariableStatement, ckLetClause, ckElementBindingExpression, ckCatchFilterClause, ckOrdering, ckInterpolationAlignmentClause, ckQueryContinuation, ckExternAliasDirective, ckMakeRefExpression, ckRefValueExpression, ckRefTypeExpression, ckBlock, ckVariable, ckBinaryPattern, ckDiscardPattern, ckFunctionPointerType, ckImplicitObjectCreationExpression, ckMemberAccessExpression,
   ckParenthesizedPattern, ckPositionalPatternClause, ckPrimaryConstructorBaseType, ckPropertyPatternClause, ckRangeExpression, ckRecord, ckRecursivePattern, ckRelationalPattern, ckSubpattern, ckSwitchExpression, ckSwitchExpressionArm, ckTypePattern, ckUnaryPattern, ckVarPattern, ckWithExpression, ckImplicitStackAllocArrayCreationExpression
import options
type CNode {.acyclic.} = object
  id*: Option[UUID]
  parentId*: Option[UUID]
  case kind*: ConstructKind
  # add types here:
  # of ckRoot: root: csRoot
  of ckNamespace:
    namespace*: CsNamespace
  of ckClass:
    class*: CsClass
  of ckMethod:
    cmethod*: CsMethod
  of ckPredefinedType:
    predefinedType*: CsPredefinedType
  of ckArgumentList: argumentList*: CsArgumentList
  of ckObjectCreationExpression: objectCreationExpression*: CsObjectCreationExpression
  of ckUsingDirective: usingDirective*: CsUsingDirective
  of ckEnum: cenum*: CsEnum
  of ckEnumMember: enumMember*: CsEnumMember
  of ckIndexer: indexer*: CsIndexer
  of ckParameterList: parameterList*: CsParameterList
  of ckParameter: parameter*: CsParameter
  of ckArgument: argument*: CsArgument
  of ckConstructor: constructor*: CsConstructor
  of ckReturnStatement: returnStatement*: CsReturnStatement
  of ckLiteralExpression: literalExpression*: CsLiteralExpression
  of ckSimpleBaseType: simpleBaseType*: CsSimpleBaseType
  of ckBaseList: baseList*: CsBaseList
  of ckProperty: property*: CsProperty
  of ckExplicitInterfaceSpecifier: explicitInterfaceSpecifier*: CsExplicitInterfaceSpecifier
  of ckExpressionStatement: expressionStatement*: CsExpressionStatement
  of ckInvocationExpression: invocationExpression*: CsInvocationExpression
  of ckLocalDeclarationStatement: localDeclarationStatement*: CsLocalDeclarationStatement
  of ckVariableDeclarator: variableDeclarator*:CsVariableDeclarator
  of ckBinaryExpression:
    binaryExpression*: CsBinaryExpression
  of ckAssignmentExpression:
    assignmentExpression*: CsAssignmentExpression
  of ckEqualsValueClause:
    equalsValueClause*: CsEqualsValueClause
  of ckIfStatement:
    ifStatement*: CsIfStatement
  of ckThisExpression:
    thisExpression*: CsThisExpression
  of ckTypeArgumentList:
    typeArgumentList*: CsTypeArgumentList
  of ckGenericName:
    genericName*: CsGenericName
  of ckAccessor:
    accessor*: CsAccessor
  of ckBracketedArgumentList:
    bracketedArgumentList*: CsBracketedArgumentList
  of ckElementAccessExpression:
    elementAccessExpression*: CsElementAccessExpression
  of ckAccessorList:
    accessorList*: CsAccessorList
  of ckParenthesizedExpression:
    parenthesizedExpression*: CsParenthesizedExpression
  of ckCastExpression:
    castExpression*: CsCastExpression
  of ckArrayRankSpecifier:
    arrayRankSpecifier*: CsArrayRankSpecifier
  of ckArrayType:
    arrayType*: CsArrayType
  of ckPrefixUnaryExpression:
    prefixUnaryExpression*: CsPrefixUnaryExpression
  of ckOmittedArraySizeExpression:
    omittedArraySizeExpression*: CsOmittedArraySizeExpression
  of ckInitializerExpression:
    initializerExpression*: CsInitializerExpression
  of ckNameEquals:
    nameEquals*: CsNameEquals
  of ckThrowStatement:
    throwStatement*: CsThrowStatement
  of ckTypeOfExpression:
    typeOfExpression*: CsTypeOfExpression
  of ckElseClause:
    elseClause*: CsElseClause
  of ckCaseSwitchLabel:
    caseSwitchLabel*: CsCaseSwitchLabel
  of ckSwitchSection:
    switchSection*: CsSwitchSection
  of ckSimpleLambdaExpression:
    simpleLambdaExpression*: CsSimpleLambdaExpression
  of ckPostfixUnaryExpression:
    postfixUnaryExpression*: CsPostfixUnaryExpression
  of ckArrayCreationExpression:
    arrayCreationExpression*: CsArrayCreationExpression
  of ckArrowExpressionClause:
    arrowExpressionClause*: CsArrowExpressionClause
  of ckBreakStatement:
    breakStatement*: CsBreakStatement
  of ckAliasQualifiedName:
    aliasQualifiedName*: CsAliasQualifiedName
  of ckTypeParameter:
    typeParameter*: CsTypeParameter
  of ckAwaitExpression:
    awaitExpression*: CsAwaitExpression
  of ckConditionalExpression:
    conditionalExpression*: CsConditionalExpression
  of ckTypeParameterList:
    typeParameterList*: CsTypeParameterList
  of ckForEachStatement:
    forEachStatement*: CsForEachStatement
  of ckForStatement:
    forStatement*: CsForStatement
  of ckInterpolatedStringText:
    interpolatedStringText*: CsInterpolatedStringText
  of ckParenthesizedLambdaExpression:
    parenthesizedLambdaExpression*: CsParenthesizedLambdaExpression
  of ckTryStatement:
    tryStatement*: CsTryStatement
  of ckNullableType:
    nullableType*: CsNullableType
  of ckBaseExpression:
    baseExpression*: CsBaseExpression
  of ckCatchClause:
    catchClause*: CsCatchClause
  of ckConstructorInitializer:
    constructorInitializer*: CsConstructorInitializer
  of ckInterpolation:
    interpolation*: CsInterpolation
  of ckCatch:
    catch*: CsCatch
  of ckNameColon:
    nameColon*: CsNameColon
  of ckUsingStatement:
    usingStatement*: CsUsingStatement
  of ckTypeParameterConstraintClause:
    typeParameterConstraintClause*: CsTypeParameterConstraintClause
  of ckTypeConstraint:
    typeConstraint*: CsTypeConstraint
  of ckSingleVariableDesignation:
    singleVariableDesignation*: CsSingleVariableDesignation
  of ckInterpolatedStringExpression:
    interpolatedStringExpression*: CsInterpolatedStringExpression
  of ckImplicitArrayCreationExpression:
    implicitArrayCreationExpression*: CsImplicitArrayCreationExpression
  of ckWhileStatement:
    whileStatement*: CsWhileStatement
  of ckDeclarationExpression:
    declarationExpression*: CsDeclarationExpression
  of ckConditionalAccessExpression:
    conditionalAccessExpression*: CsConditionalAccessExpression
  of ckSwitchStatement:
    switchStatement*: CsSwitchStatement
  of ckMemberBindingExpression:
    memberBindingExpression*: CsMemberBindingExpression
  of ckDefaultExpression:
    defaultExpression*: CsDefaultExpression
  of ckPointerType:
    pointerType*: CsPointerType
  of ckInterface:
    cinterface*: CsInterface
  of ckContinueStatement:
    continueStatement*: CsContinueStatement
  of ckFinallyClause:
    finallyClause*: CsFinallyClause
  of ckDefaultSwitchLabel:
    defaultSwitchLabel*: CsDefaultSwitchLabel
  of ckYieldStatement:
    yieldStatement*: CsYieldStatement
  of ckAnonymousObjectMemberDeclarator:
    anonymousObjectMemberDeclarator*: CsAnonymousObjectMemberDeclarator
  of ckCheckedExpression:
    checkedExpression*: CsCheckedExpression
  of ckStruct:
    struct*: CsStruct
  of ckIsPatternExpression:
    isPatternExpression*: CsIsPatternExpression
  of ckLockStatement:
    lockStatement*: CsLockStatement
  of ckDeclarationPattern:
    declarationPattern*: CsDeclarationPattern
  of ckThrowExpression:
    throwExpression*: CsThrowExpression
  of ckConstantPattern:
    constantPattern*: CsConstantPattern
  of ckRefType:
    refType*: CsRefType
  of ckRefExpression:
    refExpression*: CsRefExpression
  of ckClassOrStructConstraint:
    classOrStructConstraint*: CsClassOrStructConstraint
  of ckOmittedTypeArgument:
    omittedTypeArgument*: CsOmittedTypeArgument
  of ckTupleElement:
    tupleElement*: CsTupleElement
  of ckOperator:
    operator*: CsOperator
  of ckEventField:
    eventField*: CsEventField
  of ckDelegate:
    delegate*: CsDelegate
  of ckImplicitElementAccess:
    implicitElementAccess*: CsImplicitElementAccess
  of ckAnonymousMethodExpression:
    anonymousMethodExpression*: CsAnonymousMethodExpression
  of ckTupleExpression:
    tupleExpression*: CsTupleExpression
  of ckAnonymousObjectCreationExpression:
    anonymousObjectCreationExpression*: CsAnonymousObjectCreationExpression
  of ckBracketedParameterList:
    bracketedParameterList*: CsBracketedParameterList
  of ckEvent:
    event*: CsEvent
  of ckGotoStatement:
    gotoStatement*: CsGotoStatement
  of ckDoStatement:
    doStatement*: CsDoStatement
  of ckGlobalStatement:
    globalStatement*: CsGlobalStatement
  of ckIncompleteMember:
    incompleteMember*: CsIncompleteMember
  of ckLocalFunctionStatement:
    localFunctionStatement*: CsLocalFunctionStatement
  of ckConversionOperator:
    conversionOperator*: CsConversionOperator
  of ckTupleType:
    tupleType*: CsTupleType
  of ckFixedStatement:
    fixedStatement*: CsFixedStatement
  of ckEmptyStatement:
    emptyStatement*: CsEmptyStatement
  of ckSizeOfExpression:
    sizeOfExpression*: CsSizeOfExpression
  of ckQueryBody:
    queryBody*: CsQueryBody
  of ckCheckedStatement:
    checkedStatement*: CsCheckedStatement
  of ckQueryExpression:
      queryExpression*: CsQueryExpression
  of ckCasePatternSwitchLabel:
      casePatternSwitchLabel*: CsCasePatternSwitchLabel
  of ckLabeledStatement:
      labeledStatement*: CsLabeledStatement
  of ckConstructorConstraint:
      constructorConstraint*: CsConstructorConstraint
  of ckUnsafeStatement:
      unsafeStatement*: CsUnsafeStatement
  of ckParenthesizedVariableDesignation:
      parenthesizedVariableDesignation*: CsParenthesizedVariableDesignation
  of ckInterpolationFormatClause:
      interpolationFormatClause*: CsInterpolationFormatClause
  of ckDestructor:
      destructor*: CsDestructor
  of ckDiscardDesignation:
      discardDesignation*: CsDiscardDesignation
  of ckStackAllocArrayCreationExpression:
      stackAllocArrayCreationExpression*: CsStackAllocArrayCreationExpression
  of ckWhenClause:
      whenClause*: CsWhenClause
  of ckForEachVariableStatement:
      forEachVariableStatement*: CsForEachVariableStatement
  of ckLetClause:
      letClause*: CsLetClause
  of ckElementBindingExpression:
      elementBindingExpression*: CsElementBindingExpression
  of ckCatchFilterClause:
      catchFilterClause*: CsCatchFilterClause
  of ckOrdering:
      ordering*: CsOrdering
  of ckInterpolationAlignmentClause:
      interpolationAlignmentClause*: CsInterpolationAlignmentClause
  of ckQueryContinuation:
      queryContinuation*: CsQueryContinuation
  of ckExternAliasDirective:
      externAliasDirective*: CsExternAliasDirective
  of ckMakeRefExpression:
      makeRefExpression*: CsMakeRefExpression
  of ckRefValueExpression:
      refValueExpression*: CsRefValueExpression
  of ckRefTypeExpression:
      refTypeExpression*: CsRefTypeExpression
  of ckBlock:
    cblock*: CsBlock
  of ckVariable:
    variable*: CsVariable
  of ckBinaryPattern:
    binaryPattern*: CsBinaryPattern
  of ckDiscardPattern:
    discardPattern*: CsDiscardPattern
  of ckFunctionPointerType:
    functionPointerType*: CsFunctionPointerType
  of ckImplicitObjectCreationExpression:
    implicitObjectCreationExpression*: CsImplicitObjectCreationExpression
  of ckMemberAccessExpression:
    memberAccessExpression*: CsMemberAccessExpression
  of ckParenthesizedPattern:
    parenthesizedPattern*: CsParenthesizedPattern
  of ckPositionalPatternClause:
    positionalPatternClause*: CsPositionalPatternClause
  of ckPrimaryConstructorBaseType:
    primaryConstructorBaseType*: CsPrimaryConstructorBaseType
  of ckPropertyPatternClause:
    propertyPatternClause*: CsPropertyPatternClause
  of ckRangeExpression:
    rangeExpression*: CsRangeExpression
  of ckRecord:
      record*: CsRecord
  of ckRecursivePattern:
      recursivePattern*: CsRecursivePattern
  of ckRelationalPattern:
      relationalPattern*: CsRelationalPattern
  of ckSubpattern:
      subpattern*: CsSubpattern
  of ckSwitchExpression:
      switchExpression*: CsSwitchExpression
  of ckSwitchExpressionArm:
      switchExpressionArm*: CsSwitchExpressionArm
  of ckTypePattern:
      typePattern*: CsTypePattern
  of ckUnaryPattern:
      unaryPattern*: CsUnaryPattern
  of ckVarPattern:
      varPattern*: CsVarPattern
  of ckWithExpression:
      withExpression*: CsWithExpression
  of ckImplicitStackAllocArrayCreationExpression:
      implicitStackAllocArrayCreationExpression*: CsImplicitStackAllocArrayCreationExpression
      # ]#
type Construct* = ref CNode # all the types we support, wrapped in a variant.


# proc wrap[T](obj: ref T, kind: ConstructKind): Construct =
#   case kind
#   # of ckRoot: construct(kind: ckRoot, root: obj)
#   of ckNamespace: result = Construct(kind: ckNamespace, namespace: obj)
#   of ckClass: result = Construct(kind: ckClass, class: obj)
#   of ckMethod: result = Construct(kind: ckMethod, cmethod: obj)
# proc newC*[T](c: constructKind, a: typedesc[T], b: t): construct =
#   case c
#   of ckClass:
#     result = Construct(kind: ckClass, class: b)

# template unwrap*(c: construct): untyped =
#   case c.kind:
#   # of ckRoot: c.root
#   of ckNamespace: c.namespace
#   of ckClass: c.class
#   of ckMethod: c.method
