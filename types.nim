{.experimental: "codeReordering".}

# types.nim

import tables
import json

type CsObject = object of RootRef
  line: JsonNode
  src: string

# type MethodArgument* = ref object of CsObject
#   name*: string
#   ttype*: string
#   defaultVal*: string

# type CsMethodSignature* = ref object of CsObject
#   name*: string
#   argList*: seq[MethodArgument]
#   returnType*: string

# type CsMethodBody* = ref object of CsObject
  # exprs
  # stmts
  # ret

type CsField* = ref object of CsObject
  name*: string
  ttype*: string
  isPublic*: bool

import options

type
  CsAccessor* = ref object of CsObject
  CsAccessorList* = ref object of CsObject
  CsAliasQualifiedName* = ref object of CsObject
  CsAnonymousMethodExpression* = ref object of CsObject
  CsAnonymousObjectCreationExpression* = ref object of CsObject
  CsAnonymousObjectMemberDeclarator* = ref object of CsObject
  CsArgument* = ref object of CsObject
  CsArrayCreationExpression* = ref object of CsObject
  CsArrayRankSpecifier* = ref object of CsObject
  CsArrayType* = ref object of CsObject
  CsArrowExpressionClause* = ref object of CsObject
  CsAssignmentExpression* = ref object of CsObject
  CsAttribute* = ref object of CsObject
  CsAttributeArgument* = ref object of CsObject
  CsAttributeArgumentList* = ref object of CsObject
  CsAttributeList* = ref object of CsObject
  CsAttributeTargetSpecifier* = ref object of CsObject
  CsAwaitExpression* = ref object of CsObject
  CsBaseExpression* = ref object of CsObject
  CsBaseList* = ref object of CsObject
  CsBinaryExpression* = ref object of CsObject
  CsBracketedArgumentList* = ref object of CsObject
  CsBracketedParameterList* = ref object of CsObject
  CsBreakStatement* = ref object of CsObject
  CsCasePatternSwitchLabel* = ref object of CsObject
  CsCaseSwitchLabel* = ref object of CsObject
  CsCastExpression* = ref object of CsObject
  CsCatch* = ref object of CsObject
  CsCatchClause* = ref object of CsObject
  CsCatchFilterClause* = ref object of CsObject
  CsCheckedExpression* = ref object of CsObject
  CsCheckedStatement* = ref object of CsObject
  CsClassOrStructConstraint* = ref object of CsObject
  CsConditionalAccessExpression* = ref object of CsObject
  CsConditionalExpression* = ref object of CsObject
  CsConstantPattern* = ref object of CsObject
  CsConstructor* = ref object of CsObject
  CsConstructorConstraint* = ref object of CsObject
  CsConstructorInitializer* = ref object of CsObject
  CsContinueStatement* = ref object of CsObject
  CsConversionOperator* = ref object of CsObject
  CsDeclarationExpression* = ref object of CsObject
  CsDeclarationPattern* = ref object of CsObject
  CsDefaultExpression* = ref object of CsObject
  CsDefaultSwitchLabel* = ref object of CsObject
  CsDelegate* = ref object of CsObject
  CsDestructor* = ref object of CsObject
  CsDiscardDesignation* = ref object of CsObject
  CsDoStatement* = ref object of CsObject
  CsElementAccessExpression* = ref object of CsObject
  CsElementBindingExpression* = ref object of CsObject
  CsElseClause* = ref object of CsObject
  CsEmptyStatement* = ref object of CsObject

  CsEqualsValueClause* = ref object of CsObject
  CsEvent* = ref object of CsObject
  CsEventField* = ref object of CsObject
  CsExplicitInterfaceSpecifier* = ref object of CsObject
  CsExpressionStatement* = ref object of CsObject
  CsExternAliasDirective* = ref object of CsObject
  # CsField* = ref object of CsObject
  CsFinallyClause* = ref object of CsObject
  CsFixedStatement* = ref object of CsObject
  CsForEachStatement* = ref object of CsObject
  CsForEachVariableStatement* = ref object of CsObject
  CsForStatement* = ref object of CsObject
  CsFromClause* = ref object of CsObject
  CsGenericName* = ref object of CsObject
  CsGlobalStatement* = ref object of CsObject
  CsGotoStatement* = ref object of CsObject
  CsGroupClause* = ref object of CsObject
  CsIfStatement* = ref object of CsObject
  CsImplicitArrayCreationExpression* = ref object of CsObject
  CsImplicitElementAccess* = ref object of CsObject
  CsIncompleteMember* = ref object of CsObject
  CsIndexer* = ref object of CsObject
  CsInitializerExpression* = ref object of CsObject
  CsInterface* = ref object of CsObject
  CsInterpolatedStringExpression* = ref object of CsObject
  CsInterpolatedStringText* = ref object of CsObject
  CsInterpolation* = ref object of CsObject
  CsInterpolationAlignmentClause* = ref object of CsObject
  CsInterpolationFormatClause* = ref object of CsObject
  CsIsPatternExpression* = ref object of CsObject
  CsJoinClause* = ref object of CsObject
  CsJoinIntoClause* = ref object of CsObject
  CsLabeledStatement* = ref object of CsObject
  CsLetClause* = ref object of CsObject
  CsLocalDeclarationStatement* = ref object of CsObject
  CsLocalFunctionStatement* = ref object of CsObject
  CsLockStatement* = ref object of CsObject
  CsMakeRefExpression* = ref object of CsObject
  CsMemberBindingExpression* = ref object of CsObject
  CsNameColon* = ref object of CsObject
  CsNameEquals* = ref object of CsObject
  CsNullableType* = ref object of CsObject
  CsObjectCreationExpression* = ref object of CsObject
  CsOmittedArraySizeExpression* = ref object of CsObject
  CsOmittedTypeArgument* = ref object of CsObject
  CsOperator* = ref object of CsObject
  CsOrderByClause* = ref object of CsObject
  CsOrdering* = ref object of CsObject
  CsParenthesizedExpression* = ref object of CsObject
  CsParenthesizedLambdaExpression* = ref object of CsObject
  CsParenthesizedVariableDesignation* = ref object of CsObject
  CsPointerType* = ref object of CsObject
  CsPostfixUnaryExpression* = ref object of CsObject
  CsPrefixUnaryExpression* = ref object of CsObject
  CsProperty* = ref object of CsObject
  CsQueryBody* = ref object of CsObject
  CsQueryContinuation* = ref object of CsObject
  CsQueryExpression* = ref object of CsObject
  CsRefExpression* = ref object of CsObject
  CsRefType* = ref object of CsObject
  CsRefTypeExpression* = ref object of CsObject
  CsRefValueExpression* = ref object of CsObject
  CsReturnStatement* = ref object of CsObject
  CsSelectClause* = ref object of CsObject
  CsSimpleBaseType* = ref object of CsObject
  CsSimpleLambdaExpression* = ref object of CsObject
  CsSingleVariableDesignation* = ref object of CsObject
  CsSizeOfExpression* = ref object of CsObject
  CsStackAllocArrayCreationExpression* = ref object of CsObject
  CsStruct* = ref object of CsObject
  CsSwitchSection* = ref object of CsObject
  CsSwitchStatement* = ref object of CsObject
  CsThisExpression* = ref object of CsObject
  CsThrowExpression* = ref object of CsObject
  CsThrowStatement* = ref object of CsObject
  CsTryStatement* = ref object of CsObject
  CsTupleElement* = ref object of CsObject
  CsTupleExpression* = ref object of CsObject
  CsTupleType* = ref object of CsObject
  CsTypeArgumentList* = ref object of CsObject
  CsTypeConstraint* = ref object of CsObject
  CsTypeOfExpression* = ref object of CsObject
  CsTypeParameter* = ref object of CsObject
  CsTypeParameterConstraintClause* = ref object of CsObject
  CsTypeParameterList* = ref object of CsObject
  CsUnsafeStatement* = ref object of CsObject
  CsUsingStatement* = ref object of CsObject
  CsWhenClause* = ref object of CsObject
  CsWhereClause* = ref object of CsObject
  CsWhileStatement* = ref object of CsObject
  CsYieldStatement* = ref object of CsObject

# ===========================

type CsParameter* = ref object of CsObject
  name*: string
  ptype*: string

type CsParameterList* = ref object of CsObject
  parameters*: seq[CsParameter]

type CsPredefinedType* = ref object of CsObject
  name*: string

type CsMethod* = ref object of CsObject
  name*: string
  isStatic*: bool
  parentClass*: string
  parameterList*: CsParameterList # seq[CsParameter]
  returnType*: string
  body*: seq[string]              # TODO: which type, and how to handle. maybe have lastMethod.addToMethodBody(...)
  ## signature*: CsMethodSignature
  ## body*: CsMethodBody

type CsClass* = ref object of CsObject
  name*: string
  nsParent*: string
  fields*: seq[CsField]
  methods*: seq[CsMethod]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]
  isStatic*: bool

type CsEnumMember* = ref object of CsObject
  name*: string
  value*: Option[int]

type CsEnum* = ref object of CsObject
  name*: string
  items*: seq[CsEnumMember]

type CsNamespace* = ref object of CsObject
  name*: string
  parent*: string
  classes*: seq[CsClass]
  classTable*: TableRef[string, CsClass]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]

import sets
type CsRoot* = object
  global*: CsNamespace
  ns*: HashSet[CsNamespace]
  # ns*: seq[CsNamespace]
  nsTables*: TableRef[string, CsNamespace]

import hashes
proc hash*(c: CsNamespace): Hash =
  result = hash(c.name)

