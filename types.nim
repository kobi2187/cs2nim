# types.nim

import tables
import json

type CsObject = object of RootRef
  line: JsonNode
  src: string

type MethodArgument* = object of CsObject
  name*: string
  ttype*: string
  defaultVal*: string

type CsMethodSignature* = object of CsObject
  name*: string
  argList*: seq[MethodArgument]
  returnType*: string

type CsMethodBody* = object of CsObject
  # exprs
  # stmts
  # ret


type CsMethod* = ref object of CsObject
  signature*: CsMethodSignature
  body*: CsMethodBody
  isStatic*: bool

type CsField* = ref object of CsObject
  name*: string
  ttype*: string
  isPublic*: bool

type CsClass* = ref object of CsObject
  name*: string
  fields*: seq[CsField]
  methods*: seq[CsMethod]
  isStatic*: bool

type CsNamespace* = ref object of CsObject
  name*: string
  classes*: seq[CsClass]
  classTable*: TableRef[string, CsClass]

type CsRoot* = object
  global*: CsNamespace
  ns*: seq[CsNamespace]
  nsTables*: TableRef[string, CsNamespace]



type
  CsAccessor* = object of CsObject
  CsAccessorList* = object of CsObject
  CsAliasQualifiedName* = object of CsObject
  CsAnonymousMethodExpression* = object of CsObject
  CsAnonymousObjectCreationExpression* = object of CsObject
  CsAnonymousObjectMemberDeclarator* = object of CsObject
  CsArgument* = object of CsObject
  CsArrayCreationExpression* = object of CsObject
  CsArrayRankSpecifier* = object of CsObject
  CsArrayType* = object of CsObject
  CsArrowExpressionClause* = object of CsObject
  CsAssignmentExpression* = object of CsObject
  CsAttribute* = object of CsObject
  CsAttributeArgument* = object of CsObject
  CsAttributeArgumentList* = object of CsObject
  CsAttributeList* = object of CsObject
  CsAttributeTargetSpecifier* = object of CsObject
  CsAwaitExpression* = object of CsObject
  CsBaseExpression* = object of CsObject
  CsBaseList* = object of CsObject
  CsBinaryExpression* = object of CsObject
  CsBracketedArgumentList* = object of CsObject
  CsBracketedParameterList* = object of CsObject
  CsBreakStatement* = object of CsObject
  CsCasePatternSwitchLabel* = object of CsObject
  CsCaseSwitchLabel* = object of CsObject
  CsCastExpression* = object of CsObject
  CsCatch* = object of CsObject
  CsCatchClause* = object of CsObject
  CsCatchFilterClause* = object of CsObject
  CsCheckedExpression* = object of CsObject
  CsCheckedStatement* = object of CsObject
  CsClassOrStructConstraint* = object of CsObject
  CsConditionalAccessExpression* = object of CsObject
  CsConditionalExpression* = object of CsObject
  CsConstantPattern* = object of CsObject
  CsConstructor* = object of CsObject
  CsConstructorConstraint* = object of CsObject
  CsConstructorInitializer* = object of CsObject
  CsContinueStatement* = object of CsObject
  CsConversionOperator* = object of CsObject
  CsDeclarationExpression* = object of CsObject
  CsDeclarationPattern* = object of CsObject
  CsDefaultExpression* = object of CsObject
  CsDefaultSwitchLabel* = object of CsObject
  CsDelegate* = object of CsObject
  CsDestructor* = object of CsObject
  CsDiscardDesignation* = object of CsObject
  CsDoStatement* = object of CsObject
  CsElementAccessExpression* = object of CsObject
  CsElementBindingExpression* = object of CsObject
  CsElseClause* = object of CsObject
  CsEmptyStatement* = object of CsObject
  CsEnum* = object of CsObject
  CsEnumMember* = object of CsObject
  CsEqualsValueClause* = object of CsObject
  CsEvent* = object of CsObject
  CsEventField* = object of CsObject
  CsExplicitInterfaceSpecifier* = object of CsObject
  CsExpressionStatement* = object of CsObject
  CsExternAliasDirective* = object of CsObject
  # CsField* = object of CsObject
  CsFinallyClause* = object of CsObject
  CsFixedStatement* = object of CsObject
  CsForEachStatement* = object of CsObject
  CsForEachVariableStatement* = object of CsObject
  CsForStatement* = object of CsObject
  CsFromClause* = object of CsObject
  CsGenericName* = object of CsObject
  CsGlobalStatement* = object of CsObject
  CsGotoStatement* = object of CsObject
  CsGroupClause* = object of CsObject
  CsIfStatement* = object of CsObject
  CsImplicitArrayCreationExpression* = object of CsObject
  CsImplicitElementAccess* = object of CsObject
  CsIncompleteMember* = object of CsObject
  CsIndexer* = object of CsObject
  CsInitializerExpression* = object of CsObject
  CsInterface* = object of CsObject
  CsInterpolatedStringExpression* = object of CsObject
  CsInterpolatedStringText* = object of CsObject
  CsInterpolation* = object of CsObject
  CsInterpolationAlignmentClause* = object of CsObject
  CsInterpolationFormatClause* = object of CsObject
  CsIsPatternExpression* = object of CsObject
  CsJoinClause* = object of CsObject
  CsJoinIntoClause* = object of CsObject
  CsLabeledStatement* = object of CsObject
  CsLetClause* = object of CsObject
  CsLocalDeclarationStatement* = object of CsObject
  CsLocalFunctionStatement* = object of CsObject
  CsLockStatement* = object of CsObject
  CsMakeRefExpression* = object of CsObject
  CsMemberBindingExpression* = object of CsObject
  CsNameColon* = object of CsObject
  CsNameEquals* = object of CsObject
  CsNullableType* = object of CsObject
  CsObjectCreationExpression* = object of CsObject
  CsOmittedArraySizeExpression* = object of CsObject
  CsOmittedTypeArgument* = object of CsObject
  CsOperator* = object of CsObject
  CsOrderByClause* = object of CsObject
  CsOrdering* = object of CsObject
  CsParameter* = object of CsObject
  CsParameterList* = object of CsObject
  CsParenthesizedExpression* = object of CsObject
  CsParenthesizedLambdaExpression* = object of CsObject
  CsParenthesizedVariableDesignation* = object of CsObject
  CsPointerType* = object of CsObject
  CsPostfixUnaryExpression* = object of CsObject
  CsPrefixUnaryExpression* = object of CsObject
  CsProperty* = object of CsObject
  CsQueryBody* = object of CsObject
  CsQueryContinuation* = object of CsObject
  CsQueryExpression* = object of CsObject
  CsRefExpression* = object of CsObject
  CsRefType* = object of CsObject
  CsRefTypeExpression* = object of CsObject
  CsRefValueExpression* = object of CsObject
  CsReturnStatement* = object of CsObject
  CsSelectClause* = object of CsObject
  CsSimpleBaseType* = object of CsObject
  CsSimpleLambdaExpression* = object of CsObject
  CsSingleVariableDesignation* = object of CsObject
  CsSizeOfExpression* = object of CsObject
  CsStackAllocArrayCreationExpression* = object of CsObject
  CsStruct* = object of CsObject
  CsSwitchSection* = object of CsObject
  CsSwitchStatement* = object of CsObject
  CsThisExpression* = object of CsObject
  CsThrowExpression* = object of CsObject
  CsThrowStatement* = object of CsObject
  CsTryStatement* = object of CsObject
  CsTupleElement* = object of CsObject
  CsTupleExpression* = object of CsObject
  CsTupleType* = object of CsObject
  CsTypeArgumentList* = object of CsObject
  CsTypeConstraint* = object of CsObject
  CsTypeOfExpression* = object of CsObject
  CsTypeParameter* = object of CsObject
  CsTypeParameterConstraintClause* = object of CsObject
  CsTypeParameterList* = object of CsObject
  CsUnsafeStatement* = object of CsObject
  CsUsingStatement* = object of CsObject
  CsWhenClause* = object of CsObject
  CsWhereClause* = object of CsObject
  CsWhileStatement* = object of CsObject
  CsYieldStatement* = object of CsObject

