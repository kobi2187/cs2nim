# construct.nim
import constructs/justtypes, uuids, tables



type ConstructKind* = enum
  # ckRoot # nah, too special.
  ckNamespace,
  ckClass,
  ckField,
  ckMethod,
  ckEnum,
  # to be added.
  ckPredefinedType
  ckArgumentList, ckObjectCreationExpression, ckUsingDirective, ckEnumMember,
      ckIndexer, ckParameterList, ckParameter, ckArgument, ckConstructor,
      ckReturnStatement, ckLiteralExpression, ckSimpleBaseType, ckBaseList,
      ckProperty, ckExplicitInterfaceSpecifier, ckExpressionStatement,
      ckInvocationExpression,
  ckLocalDeclarationStatement, ckVariableDeclarator
  ckBinaryExpression, ckAssignmentExpression, ckEqualsValueClause,
      ckIfStatement, ckThisExpression, ckTypeArgumentList, ckGenericName,
      ckAccessor, ckBracketedArgumentList, ckElementAccessExpression,
      ckAccessorList, ckParenthesizedExpression, ckCastExpression,
      ckArrayRankSpecifier, ckArrayType, ckPrefixUnaryExpression,
      ckOmittedArraySizeExpression,
  ckInitializerExpression, ckNameEquals, ckThrowStatement, ckTypeOfExpression,
      ckElseClause, ckCaseSwitchLabel, ckSwitchSection,
      ckSimpleLambdaExpression, ckPostfixUnaryExpression,
      ckArrayCreationExpression, ckArrowExpressionClause, ckBreakStatement,
      ckAliasQualifiedName, ckTypeParameter, ckAwaitExpression,
      ckConditionalExpression, ckTypeParameterList, ckForEachStatement,
      ckForStatement,
  ckInterpolatedStringText, ckParenthesizedLambdaExpression, ckTryStatement,
      ckNullableType, ckBaseExpression, ckCatchClause, ckConstructorInitializer,
      ckInterpolation, ckCatch, ckNameColon, ckUsingStatement,
      ckTypeParameterConstraintClause, ckTypeConstraint,
      ckSingleVariableDesignation, ckInterpolatedStringExpression,
      ckImplicitArrayCreationExpression, ckWhileStatement,
  ckDeclarationExpression, ckConditionalAccessExpression, ckSwitchStatement,
      ckMemberBindingExpression, ckDefaultExpression, ckPointerType,
      ckInterface, ckContinueStatement, ckFinallyClause, ckDefaultSwitchLabel,
      ckYieldStatement, ckAnonymousObjectMemberDeclarator, ckCheckedExpression,
      ckStruct, ckIsPatternExpression, ckLockStatement, ckDeclarationPattern,
      ckThrowExpression, ckConstantPattern,
  ckRefType, ckRefExpression, ckClassOrStructConstraint, ckOmittedTypeArgument,
      ckTupleElement, ckOperator, ckEventField, ckDelegate,
      ckImplicitElementAccess, ckAnonymousMethodExpression, ckTupleExpression,
      ckAnonymousObjectCreationExpression, ckBracketedParameterList, ckEvent,
      ckGotoStatement, ckDoStatement, ckGlobalStatement, ckIncompleteMember,
      ckLocalFunctionStatement,
  ckConversionOperator, ckTupleType, ckFixedStatement, ckEmptyStatement,
      ckSizeOfExpression, ckQueryBody, ckCheckedStatement, ckQueryExpression,
      ckCasePatternSwitchLabel, ckLabeledStatement, ckConstructorConstraint,
      ckUnsafeStatement, ckParenthesizedVariableDesignation,
      ckInterpolationFormatClause, ckDestructor, ckDiscardDesignation,
      ckStackAllocArrayCreationExpression, ckWhenClause,
  ckForEachVariableStatement, ckLetClause, ckElementBindingExpression,
      ckCatchFilterClause, ckOrdering, ckInterpolationAlignmentClause,
      ckQueryContinuation, ckExternAliasDirective, ckMakeRefExpression,
      ckRefValueExpression, ckRefTypeExpression, ckBlock, ckVariable,
      ckBinaryPattern, ckDiscardPattern, ckFunctionPointerType,
      ckImplicitObjectCreationExpression, ckMemberAccessExpression,
  ckParenthesizedPattern, ckPositionalPatternClause,
      ckPrimaryConstructorBaseType, ckPropertyPatternClause, ckRangeExpression,
      ckRecord, ckRecursivePattern, ckRelationalPattern, ckSubpattern,
      ckSwitchExpression, ckSwitchExpressionArm, ckTypePattern, ckUnaryPattern,
      ckVarPattern, ckWithExpression, ckImplicitStackAllocArrayCreationExpression, ckOrderByClause,
      ckGroupClause, ckJoinClause, ckFromClause, ckSelectClause, ckWhereClause, ckJoinIntoClause

import options
type CNode {.acyclic.} = object
  id*: Option[UUID]
  parentId*: Option[UUID]
  parentRawKind*: int
  rawKind*: int
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
  of ckObjectCreationExpression: objectCreationExpression*
      : CsObjectCreationExpression
  of ckUsingDirective: usingDirective*: CsUsingDirective
  of ckField: field*: CsField
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
  of ckExplicitInterfaceSpecifier: explicitInterfaceSpecifier*
      : CsExplicitInterfaceSpecifier
  of ckExpressionStatement: expressionStatement*: CsExpressionStatement
  of ckInvocationExpression: invocationExpression*: CsInvocationExpression
  of ckLocalDeclarationStatement: localDeclarationStatement*
      : CsLocalDeclarationStatement
  of ckVariableDeclarator: variableDeclarator*: CsVariableDeclarator
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
  of ckOrderByClause:
    orderByClause*: CsOrderByClause
  of ckGroupClause:
    groupClause*: CsGroupClause
  of ckJoinClause:
    joinClause*: CsJoinClause
  of ckFromClause:
    fromClause*: CsFromClause
  of ckSelectClause:
    selectClause*: CsSelectClause
  of ckWhereClause:
    whereClause*: CsWhereClause
  of ckJoinIntoClause:
    joinIntoClause*: CsJoinIntoClause

type Construct* = ref CNode # all the types we support, wrapped in a variant.

# with the help of regex:
# import types
template unwrap*[T](c: Construct): T =
  case c.kind:
  # of ckRoot: c.root
  of ckNamespace: c.namespace
  of ckClass: c.class
  of ckMethod: c.cmethod
  of ckPredefinedType: c.predefinedType
  of ckArgumentList: c.argumentList
  of ckObjectCreationExpression: c.objectCreationExpression
  of ckUsingDirective: c.usingDirective
  of ckField: c.field
  of ckEnum: c.cenum
  of ckEnumMember: c.enumMember
  of ckIndexer: c.indexer
  of ckParameterList: c.parameterList
  of ckParameter: c.parameter
  of ckArgument: c.argument
  of ckConstructor: c.constructor
  of ckReturnStatement: c.returnStatement
  of ckLiteralExpression: c.literalExpression
  of ckSimpleBaseType: c.simpleBaseType
  of ckBaseList: c.baseList
  of ckProperty: c.property
  of ckExplicitInterfaceSpecifier: c.explicitInterfaceSpecifier
  of ckExpressionStatement: c.expressionStatement
  of ckInvocationExpression: c.invocationExpression
  of ckLocalDeclarationStatement: c.localDeclarationStatement
  of ckVariableDeclarator: c.variableDeclarator
  of ckBinaryExpression: c.binaryExpression
  of ckAssignmentExpression: c.assignmentExpression
  of ckEqualsValueClause: c.equalsValueClause
  of ckIfStatement: c.ifStatement
  of ckThisExpression: c.thisExpression
  of ckTypeArgumentList: c.typeArgumentList
  of ckGenericName: c.genericName
  of ckAccessor: c.accessor
  of ckBracketedArgumentList: c.bracketedArgumentList
  of ckElementAccessExpression: c.elementAccessExpression
  of ckAccessorList: c.accessorList
  of ckParenthesizedExpression: c.parenthesizedExpression
  of ckCastExpression: c.castExpression
  of ckArrayRankSpecifier: c.arrayRankSpecifier
  of ckArrayType: c.arrayType
  of ckPrefixUnaryExpression: c.prefixUnaryExpression
  of ckOmittedArraySizeExpression: c.omittedArraySizeExpression
  of ckInitializerExpression: c.initializerExpression
  of ckNameEquals: c.nameEquals
  of ckThrowStatement: c.throwStatement
  of ckTypeOfExpression: c.typeOfExpression
  of ckElseClause: c.elseClause
  of ckCaseSwitchLabel: c.caseSwitchLabel
  of ckSwitchSection: c.switchSection
  of ckSimpleLambdaExpression: c.simpleLambdaExpression
  of ckPostfixUnaryExpression: c.postfixUnaryExpression
  of ckArrayCreationExpression: c.arrayCreationExpression
  of ckArrowExpressionClause: c.arrowExpressionClause
  of ckBreakStatement: c.breakStatement
  of ckAliasQualifiedName: c.aliasQualifiedName
  of ckTypeParameter: c.typeParameter
  of ckAwaitExpression: c.awaitExpression
  of ckConditionalExpression: c.conditionalExpression
  of ckTypeParameterList: c.typeParameterList
  of ckForEachStatement: c.forEachStatement
  of ckForStatement: c.forStatement
  of ckInterpolatedStringText: c.interpolatedStringText
  of ckParenthesizedLambdaExpression: c.parenthesizedLambdaExpression
  of ckTryStatement: c.tryStatement
  of ckNullableType: c.nullableType
  of ckBaseExpression: c.baseExpression
  of ckCatchClause: c.catchClause
  of ckConstructorInitializer: c.constructorInitializer
  of ckInterpolation: c.interpolation
  of ckCatch: c.catch
  of ckNameColon: c.nameColon
  of ckUsingStatement: c.usingStatement
  of ckTypeParameterConstraintClause: c.typeParameterConstraintClause
  of ckTypeConstraint: c.typeConstraint
  of ckSingleVariableDesignation: c.singleVariableDesignation
  of ckInterpolatedStringExpression: c.interpolatedStringExpression
  of ckImplicitArrayCreationExpression: c.implicitArrayCreationExpression
  of ckWhileStatement: c.whileStatement
  of ckDeclarationExpression: c.declarationExpression
  of ckConditionalAccessExpression: c.conditionalAccessExpression
  of ckSwitchStatement: c.switchStatement
  of ckMemberBindingExpression: c.memberBindingExpression
  of ckDefaultExpression: c.defaultExpression
  of ckPointerType: c.pointerType
  of ckInterface: c.cinterface
  of ckContinueStatement: c.continueStatement
  of ckFinallyClause: c.finallyClause
  of ckDefaultSwitchLabel: c.defaultSwitchLabel
  of ckYieldStatement: c.yieldStatement
  of ckAnonymousObjectMemberDeclarator: c.anonymousObjectMemberDeclarator
  of ckCheckedExpression: c.checkedExpression
  of ckStruct: c.struct
  of ckIsPatternExpression: c.isPatternExpression
  of ckLockStatement: c.lockStatement
  of ckDeclarationPattern: c.declarationPattern
  of ckThrowExpression: c.throwExpression
  of ckConstantPattern: c.constantPattern
  of ckRefType: c.refType
  of ckRefExpression: c.refExpression
  of ckClassOrStructConstraint: c.classOrStructConstraint
  of ckOmittedTypeArgument: c.omittedTypeArgument
  of ckTupleElement: c.tupleElement
  of ckOperator: c.operator
  of ckEventField: c.eventField
  of ckDelegate: c.delegate
  of ckImplicitElementAccess: c.implicitElementAccess
  of ckAnonymousMethodExpression: c.anonymousMethodExpression
  of ckTupleExpression: c.tupleExpression
  of ckAnonymousObjectCreationExpression: c.anonymousObjectCreationExpression
  of ckBracketedParameterList: c.bracketedParameterList
  of ckEvent: c.event
  of ckGotoStatement: c.gotoStatement
  of ckDoStatement: c.doStatement
  of ckGlobalStatement: c.globalStatement
  of ckIncompleteMember: c.incompleteMember
  of ckLocalFunctionStatement: c.localFunctionStatement
  of ckConversionOperator: c.conversionOperator
  of ckTupleType: c.tupleType
  of ckFixedStatement: c.fixedStatement
  of ckEmptyStatement: c.emptyStatement
  of ckSizeOfExpression: c.sizeOfExpression
  of ckQueryBody: c.queryBody
  of ckCheckedStatement: c.checkedStatement
  of ckQueryExpression: c.queryExpression
  of ckCasePatternSwitchLabel: c.casePatternSwitchLabel
  of ckLabeledStatement: c.labeledStatement
  of ckConstructorConstraint: c.constructorConstraint
  of ckUnsafeStatement: c.unsafeStatement
  of ckParenthesizedVariableDesignation: c.parenthesizedVariableDesignation
  of ckInterpolationFormatClause: c.interpolationFormatClause
  of ckDestructor: c.destructor
  of ckDiscardDesignation: c.discardDesignation
  of ckStackAllocArrayCreationExpression: c.stackAllocArrayCreationExpression
  of ckWhenClause: c.whenClause
  of ckForEachVariableStatement: c.forEachVariableStatement
  of ckLetClause: c.letClause
  of ckElementBindingExpression: c.elementBindingExpression
  of ckCatchFilterClause: c.catchFilterClause
  of ckOrdering: c.ordering
  of ckInterpolationAlignmentClause: c.interpolationAlignmentClause
  of ckQueryContinuation: c.queryContinuation
  of ckExternAliasDirective: c.externAliasDirective
  of ckMakeRefExpression: c.makeRefExpression
  of ckRefValueExpression: c.refValueExpression
  of ckRefTypeExpression: c.refTypeExpression
  of ckBlock: c.cblock
  of ckVariable: c.variable
  of ckBinaryPattern: c.binaryPattern
  of ckDiscardPattern: c.discardPattern
  of ckFunctionPointerType: c.functionPointerType
  of ckImplicitObjectCreationExpression: c.implicitObjectCreationExpression
  of ckMemberAccessExpression: c.memberAccessExpression
  of ckParenthesizedPattern: c.parenthesizedPattern
  of ckPositionalPatternClause: c.positionalPatternClause
  of ckPrimaryConstructorBaseType: c.primaryConstructorBaseType
  of ckPropertyPatternClause: c.propertyPatternClause
  of ckRangeExpression: c.rangeExpression
  of ckRecord: c.record
  of ckRecursivePattern: c.recursivePattern
  of ckRelationalPattern: c.relationalPattern
  of ckSubpattern: c.subpattern
  of ckSwitchExpression: c.switchExpression
  of ckSwitchExpressionArm: c.switchExpressionArm
  of ckTypePattern: c.typePattern
  of ckUnaryPattern: c.unaryPattern
  of ckVarPattern: c.varPattern
  of ckWithExpression: c.withExpression
  of ckImplicitStackAllocArrayCreationExpression: c.implicitStackAllocArrayCreationExpression
  of ckOrderByClause: c.orderByClause
  of ckGroupClause: c.groupClause
  of ckJoinClause: c.joinClause
  of ckFromClause: c.fromClause
  of ckSelectClause: c.selectClause
  of ckWhereClause: c.whereClause
  of ckJoinIntoClause: c.joinIntoClause



const ckToStr* = {
  ckNamespace: "NamespaceDeclaration", ckClass: "ClassDeclaration", ckField: "FieldDeclaration", ckMethod: "MethodDeclaration", ckEnum: "EnumDeclaration", ckPredefinedType: "PredefinedType",
  ckArgumentList: "ArgumentList", ckObjectCreationExpression: "ObjectCreationExpression", ckUsingDirective: "UsingDirective", ckEnumMember: "EnumMemberDeclaration",
  ckIndexer: "IndexerDeclaration", ckParameterList: "ParameterList", ckParameter: "Parameter", ckArgument: "Argument", ckConstructor: "ConstructorDeclaration",
  ckReturnStatement: "ReturnStatement", ckLiteralExpression: "LiteralExpression", ckSimpleBaseType: "SimpleBaseType", ckBaseList: "BaseList",
  ckProperty: "PropertyDeclaration", ckExplicitInterfaceSpecifier: "ExplicitInterfaceSpecifier", ckExpressionStatement: "ExpressionStatement",
  ckInvocationExpression: "InvocationExpression", ckLocalDeclarationStatement: "LocalDeclarationStatement", ckVariableDeclarator: "_",
  ckBinaryExpression: "BinaryExpression", ckAssignmentExpression: "AssignmentExpression", ckEqualsValueClause: "EqualsValueClause", ckIfStatement: "IfStatement",
  ckThisExpression: "ThisExpression", ckTypeArgumentList: "TypeArgumentList", ckGenericName: "GenericName", ckAccessor: "AccessorDeclaration",
  ckBracketedArgumentList: "BracketedArgumentList", ckElementAccessExpression: "ElementAccessExpression", ckAccessorList: "AccessorList",
  ckParenthesizedExpression: "ParenthesizedExpression", ckCastExpression: "CastExpression", ckArrayRankSpecifier: "ArrayRankSpecifier", ckArrayType: "ArrayType",
  ckPrefixUnaryExpression: "PrefixUnaryExpression", ckOmittedArraySizeExpression: "OmittedArraySizeExpression", ckInitializerExpression: "InitializerExpression",
  ckNameEquals: "NameEquals", ckThrowStatement: "ThrowStatement", ckTypeOfExpression: "TypeOfExpression", ckElseClause: "ElseClause",
  ckCaseSwitchLabel: "CaseSwitchLabel", ckSwitchSection: "SwitchSection", ckSimpleLambdaExpression: "SimpleLambdaExpression", ckPostfixUnaryExpression: "PostfixUnaryExpression",
  ckArrayCreationExpression: "ArrayCreationExpression", ckArrowExpressionClause: "ArrowExpressionClause", ckBreakStatement: "BreakStatement", ckAliasQualifiedName: "AliasQualifiedName",
  ckTypeParameter: "TypeParameter", ckAwaitExpression: "AwaitExpression", ckConditionalExpression: "ConditionalExpression", ckTypeParameterList: "TypeParameterList",
  ckForEachStatement: "ForEachStatement", ckForStatement: "ForStatement", ckInterpolatedStringText: "InterpolatedStringText",
  ckParenthesizedLambdaExpression: "ParenthesizedLambdaExpression", ckTryStatement: "TryStatement", ckNullableType: "NullableType", ckBaseExpression: "BaseExpression",
  ckCatchClause: "CatchClause", ckConstructorInitializer: "ConstructorInitializer", ckInterpolation: "Interpolation", ckCatch: "Catch", ckNameColon: "NameColon",
  ckUsingStatement: "UsingStatement", ckTypeParameterConstraintClause: "TypeParameterConstraintClause", ckTypeConstraint: "TypeConstraint",
  ckSingleVariableDesignation: "SingleVariableDesignation", ckInterpolatedStringExpression: "InterpolatedStringExpression", ckImplicitArrayCreationExpression: "ImplicitArrayCreationExpression",
  ckWhileStatement: "WhileStatement", ckDeclarationExpression: "DeclarationExpression", ckConditionalAccessExpression: "ConditionalAccessExpression", ckSwitchStatement: "SwitchStatement",
  ckMemberBindingExpression: "MemberBindingExpression", ckDefaultExpression: "DefaultExpression", ckPointerType: "PointerType", ckInterface: "InterfaceDeclaration",
  ckContinueStatement: "ContinueStatement", ckFinallyClause: "FinallyClause", ckDefaultSwitchLabel: "DefaultSwitchLabel", ckYieldStatement: "YieldStatement",
  ckAnonymousObjectMemberDeclarator: "AnonymousObjectMemberDeclarator", ckCheckedExpression: "CheckedExpression", ckStruct: "StructDeclaration", ckIsPatternExpression: "IsPatternExpression",
  ckLockStatement: "LockStatement", ckDeclarationPattern: "DeclarationPattern", ckThrowExpression: "ThrowExpression", ckConstantPattern: "ConstantPattern",
  ckRefType: "RefType", ckRefExpression: "RefExpression", ckClassOrStructConstraint: "ClassOrStructConstraint", ckOmittedTypeArgument: "OmittedTypeArgument",
  ckTupleElement: "TupleElement", ckOperator: "OperatorDeclaration", ckEventField: "EventField", ckDelegate: "Delegate",
  ckImplicitElementAccess: "ImplicitElementAccess", ckAnonymousMethodExpression: "AnonymousMethodExpression", ckTupleExpression: "TupleExpression",
  ckAnonymousObjectCreationExpression: "AnonymousObjectCreationExpression", ckBracketedParameterList: "BracketedParameterList", ckEvent: "Event",
  ckGotoStatement: "GotoStatement", ckDoStatement: "DoStatement", ckGlobalStatement: "GlobalStatement", ckIncompleteMember: "IncompleteMember",
  ckLocalFunctionStatement: "LocalFunctionStatement", ckConversionOperator: "ConversionOperatorDeclaration", ckTupleType: "TupleType", ckFixedStatement: "FixedStatement",
  ckEmptyStatement: "EmptyStatement", ckSizeOfExpression: "SizeOfExpression", ckQueryBody: "QueryBody", ckCheckedStatement: "CheckedStatement",
  ckQueryExpression: "QueryExpression", ckCasePatternSwitchLabel: "CasePatternSwitchLabel", ckLabeledStatement: "LabeledStatement", ckConstructorConstraint: "ConstructorConstraint",
  ckUnsafeStatement: "UnsafeStatement", ckParenthesizedVariableDesignation: "ParenthesizedVariableDesignation", ckInterpolationFormatClause: "InterpolationFormatClause",
  ckDestructor: "DestructorDeclaration", ckDiscardDesignation: "DiscardDesignation", ckStackAllocArrayCreationExpression: "StackAllocArrayCreationExpression", ckWhenClause: "WhenClause",
  ckForEachVariableStatement: "ForEachVariableStatement", ckLetClause: "LetClause", ckElementBindingExpression: "ElementBindingExpression",
  ckCatchFilterClause: "CatchFilterClause", ckOrdering: "Ordering", ckInterpolationAlignmentClause: "InterpolationAlignmentClause",
  ckQueryContinuation: "QueryContinuation", ckExternAliasDirective: "ExternAliasDirective", ckMakeRefExpression: "MakeRefExpression",
  ckRefValueExpression: "RefValueExpression", ckRefTypeExpression: "RefTypeExpression", ckBlock: "Block", ckVariable: "VariableDeclaration",
  ckBinaryPattern: "BinaryPattern", ckDiscardPattern: "DiscardPattern", ckFunctionPointerType: "FunctionPointerType",
  ckImplicitObjectCreationExpression: "ImplicitObjectCreationExpression", ckMemberAccessExpression: "MemberAccessExpression",
  ckParenthesizedPattern: "ParenthesizedPattern", ckPositionalPatternClause: "PositionalPatternClause",
  ckPrimaryConstructorBaseType: "PrimaryConstructorBaseType", ckPropertyPatternClause: "PropertyPatternClause", ckRangeExpression: "RangeExpression",
  ckRecord: "Record", ckRecursivePattern: "RecursivePattern", ckRelationalPattern: "RelationalPattern", ckSubpattern: "Subpattern",
  ckSwitchExpression: "SwitchExpression", ckSwitchExpressionArm: "SwitchExpressionArm", ckTypePattern: "TypePattern", ckUnaryPattern: "UnaryPattern",
  ckVarPattern: "VarPattern", ckWithExpression: "WithExpression", ckImplicitStackAllocArrayCreationExpression: "ImplicitStackAllocArrayCreationExpression", ckOrderByClause: "OrderByClause",
  ckGroupClause: "GroupClause", ckJoinClause: "JoinClause", ckFromClause: "FromClause", ckSelectClause: "SelectClause", ckWhereClause: "WhereClause", ckJoinIntoClause: "JoinIntoClause"


  }.toTable()
