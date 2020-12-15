# construct.nim
import constructs/cs_all_constructs, uuids

type ConstructKind* = enum
  # ckRoot # nah, too special.
  ckNamespace,
  ckClass,
  ckMethod,

  # to be added.
  ckPredefinedType
  ckArgumentList, ckObjectCreationExpression, ckUsingDirective, ckEnum, ckEnumMember, ckIndexer, ckParameterList, ckParameter, ckArgument, ckConstructor, ckReturnStatement, ckLiteralExpression, ckSimpleBaseType, ckBaseList, ckProperty, ckExplicitInterfaceSpecifier, ckExpressionStatement, ckInvocationExpression,
  ckLocalDeclarationStatement,ckVariableDeclarator

 # unsupported:
   # ckBinaryExpression, ckAssignmentExpression, ckEqualsValueClause, , ckIfStatement, ckThisExpression, ckTypeArgumentList, ckGenericName, ckAccessor, ckBracketedArgumentList, ckElementAccessExpression, ckAccessorList, ckParenthesizedExpression, ckCastExpression, ckArrayRankSpecifier, ckArrayType, ckPrefixUnaryExpression, ckOmittedArraySizeExpression,
   # ckInitializerExpression, ckNameEquals, ckThrowStatement, ckTypeOfExpression, ckElseClause, ckCaseSwitchLabel, ckSwitchSection, ckSimpleLambdaExpression, ckPostfixUnaryExpression, ckArrayCreationExpression, ckArrowExpressionClause, ckBreakStatement, ckAliasQualifiedName, ckTypeParameter, ckAwaitExpression, ckConditionalExpression, ckTypeParameterList, ckForEachStatement, ckForStatement,
   # ckInterpolatedStringText, ckParenthesizedLambdaExpression, ckTryStatement, ckNullableType, ckBaseExpression, ckCatchClause, ckConstructorInitializer, ckInterpolation, ckCatch, ckNameColon, ckUsingStatement, ckTypeParameterConstraintClause, ckTypeConstraint, ckSingleVariableDesignation, ckInterpolatedStringExpression, ckImplicitArrayCreationExpression, ckWhileStatement,
   # ckDeclarationExpression, ckConditionalAccessExpression, ckSwitchStatement, ckMemberBindingExpression, ckDefaultExpression, ckPointerType, ckInterface, ckContinueStatement, ckFinallyClause, ckDefaultSwitchLabel, ckYieldStatement, ckAnonymousObjectMemberDeclarator, ckCheckedExpression, ckStruct, ckIsPatternExpression, ckLockStatement, ckDeclarationPattern, ckThrowExpression, ckConstantPattern,
   # ckRefType, ckRefExpression, ckClassOrStructConstraint, ckOmittedTypeArgument, ckTupleElement, ckOperator, ckEventField, ckDelegate, ckImplicitElementAccess, ckAnonymousMethodExpression, ckTupleExpression, ckAnonymousObjectCreationExpression, ckBracketedParameterList, ckEvent, ckGotoStatement, ckDoStatement, ckGlobalStatement, ckIncompleteMember, ckLocalFunctionStatement,
   # ckConversionOperator, ckTupleType, ckFixedStatement, ckEmptyStatement, ckSizeOfExpression, ckQueryBody, ckCheckedStatement, ckQueryExpression, ckCasePatternSwitchLabel, ckLabeledStatement, ckConstructorConstraint, ckUnsafeStatement, ckParenthesizedVariableDesignation, ckInterpolationFormatClause, ckDestructor, ckDiscardDesignation, ckStackAllocArrayCreationExpression, ckWhenClause,
   # ckForEachVariableStatement, ckLetClause, ckElementBindingExpression, ckCatchFilterClause, ckOrdering, ckInterpolationAlignmentClause, ckQueryContinuation, ckExternAliasDirective, ckMakeRefExpression, ckRefValueExpression, ckRefTypeExpression, ckBlock, ckVariable, ckBinaryPattern, ckDiscardPattern, ckFunctionPointerType, ckImplicitObjectCreationExpression, ckMemberAccessExpression,
   # ckParenthesizedPattern, ckPositionalPatternClause, ckPrimaryConstructorBaseType, ckPropertyPatternClause, ckRangeExpression, ckRecord, ckRecursivePattern, ckRelationalPattern, ckSubpattern, ckSwitchExpression, ckSwitchExpressionArm, ckTypePattern, ckUnaryPattern, , ckVarPattern, ckWithExpression, ckImplicitStackAllocArrayCreationExpression
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
    `method`*: CsMethod
  of ckPredefinedType:
    predefinedType*: CsPredefinedType
  of ckArgumentList: argumentList*: CsArgumentList
  of ckObjectCreationExpression: objectCreationExpression*: CsObjectCreationExpression
  of ckUsingDirective: usingDirective*: CsUsingDirective
  of ckEnum: `enum`*: CsEnum
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
type Construct* = ref CNode # all the types we support, wrapped in a variant.


proc wrap*[T](obj: ref T, kind: ConstructKind): Construct =
  case kind
  # of ckRoot: construct(kind: ckRoot, root: obj)
  of ckNamespace: result = Construct(kind: ckNamespace, namespace: obj)
  of ckClass: result = Construct(kind: ckClass, class: obj)
  of ckMethod: result = Construct(kind: ckMethod, `method`: obj)
# proc newC*[T](c: constructKind, a: typedesc[T], b: t): construct =
#   case c
#   of ckClass:
#     result = Construct(kind: ckClass, class: b)

# template unwrap*(c: construct): untyped =
#   case c.kind:
#   # of ckRoot: c.root
#   of ckNamespace: c.namespace
#   of ckClass: c.class
#   of ckMethod: c.`method`
