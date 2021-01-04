import ../types
import ../state

import uuids, options, sets, tables

type ClassParts* {.pure.} = enum
  Methods, Ctors, Properties, Indexer

type PropertyParts* = enum Getter, Setter

type NamespaceParts* {.pure.} = enum
  Unset, Interfaces, Enums, Classes, Using

type IAssignable = ref object of BodyExpr
type CsAccessor* = ref object of CsObject
  kind*: string # get or set
  statementsTxt*: string
type CsAccessorList* = ref object of CsObject
  hasDefaultGet*: bool
  hasGetBody*: bool
  hasDefaultSet*: bool
  hasSetBody*: bool
  getPart*: CsAccessor
  setPart*: CsAccessor
type CsAliasQualifiedName* = ref object of CsObject #TODO(type:CsAliasQualifiedName)
type CsField* = ref object of CsObject
  thetype*: string
  isPublic*: bool
  isStatic*: bool
type CsAnonymousMethodExpression* = ref object of CsObject #TODO(type:CsAnonymousMethodExpression)
type CsAnonymousObjectCreationExpression *
  = ref object of CsObject #TODO(type:CsAnonymousObjectCreationExpression)
type CsAnonymousObjectMemberDeclarator *
  = ref object of CsObject #TODO(type:CsAnonymousObjectMemberDeclarator)
type CsArgumentList* = ref object of CsObject
  args*: seq[string]
  # args*: seq[CsArgument] # TODO: probably needed, when arguments are more complex. need to see the flow.
type CsArgument* = ref object of CsObject
  value*: string
type CsArrayCreationExpression* = ref object of CsObject #TODO(type:CsArrayCreationExpression)
type CsArrayRankSpecifier* = ref object of CsObject #TODO(type:CsArrayRankSpecifier)
type CsArrayType* = ref object of CsObject #TODO(type:CsArrayType)
type CsArrowExpressionClause* = ref object of CsObject #TODO(type:CsArrowExpressionClause)
type CsAssignmentExpression* = ref object of BodyExpr
  left*: string # TODO: should be some variable
  right*: IAssignable
type CsAttributeArgumentList* = ref object of CsObject #TODO(type:CsAttributeArgumentList)
type CsAttributeArgument* = ref object of CsObject #TODO(type:CsAttributeArgument)
type CsAttributeList* = ref object of CsObject #TODO(type:CsAttributeList)
type CsAttribute* = ref object of CsObject #TODO(type:CsAttribute)
type CsAttributeTargetSpecifier* = ref object of CsObject #TODO(type:CsAttributeTargetSpecifier)
type CsAwaitExpression* = ref object of CsObject #TODO(type:CsAwaitExpression)
type CsBaseExpression* = ref object of CsObject #TODO(type:CsBaseExpression)
type CsBaseList* = ref object of CsObject
  baseList*: seq[string]
type CsBinaryExpression* = ref object of IAssignable
  left*: string
  op*: string
  right*: string
type CsBracketedArgumentList* = ref object of CsObject #TODO(type:CsBracketedArgumentList)
type CsBracketedParameterList* = ref object of CsObject #TODO(type:CsBracketedParameterList)
  plist*: string
type CsBreakStatement* = ref object of CsObject #TODO(type:CsBreakStatement)
type CsCasePatternSwitchLabel* = ref object of CsObject #TODO(type:CsCasePatternSwitchLabel)
type CsCaseSwitchLabel* = ref object of CsObject #TODO(type:CsCaseSwitchLabel)
type CsCastExpression* = ref object of CsObject #TODO(type:CsCastExpression)
type CsCatchClause* = ref object of CsObject #TODO(type:CsCatchClause)
type CsCatchFilterClause* = ref object of CsObject #TODO(type:CsCatchFilterClause)
type CsCatch* = ref object of CsObject #TODO(type:CsCatch)
type CsCheckedExpression* = ref object of CsObject #TODO(type:CsCheckedExpression)
type CsCheckedStatement* = ref object of CsObject #TODO(type:CsCheckedStatement)
type CsProperty* = ref object of CsObject
  lastAddedTo*: PropertyParts
  retType*: string
  hasGet*: bool
  hasSet*: bool
  parentClass*: string
  acclist*: CsAccessorList
  bodySet*: seq[BodyExpr] # dunno. TODO: this should be strongly connected to acclist (maybe extracted from it?). but lastBodyExpr wants to have constructs readily available like in this seq.
  bodyGet*: seq[BodyExpr] # NOTE: don't know yet what type to* put here. maybe something like a method body or a list of expr ?

type CsTypeArgumentList* = ref object of CsObject #TODO(type:CsTypeArgumentList)
  types*: seq[string]
type CsGenericName* = ref object of CsObject
  typearglist*: CsTypeArgumentList

type CsParameter* = ref object of CsObject
  ptype*: string
  genericType*: CsGenericName
  isRef*: bool
  isOut*: bool
type CsParameterList* = ref object of CsObject
  parameters*: seq[CsParameter]
type CsMethod* = ref object of CsObject
  isStatic*: bool
  parentClass*: string
  parameterList*: CsParameterList # seq[CsParameter]
  returnType*: string
  # TODO: method body can change to Construct, but limited only to the constructs applicable. (type constraints* with distinct or runtime asserts)
  # TODO: or we check with case ttype string, as before. runtime dispatch etc.
  body*: seq[BodyExpr] # use here inheritance and methods (runtime dispatch). # seq[Expr] expressions, and each should know how to generate their line. ref objects, and methods.

type CsConstructorInitializer* = ref object of CsObject #TODO(type:CsConstructorInitializer)

type CsConstructor* = ref object of CsObject
  parentClass*: string
  parameterList*: CsParameterList # seq[CsParameter]
  body*: seq[BodyExpr]
  initializer*: CsConstructorInitializer # for example, when C# ctor passes args to base ctor # don't yet know how to generate in Nim.
  initializerArgList*: CsArgumentList
type CsEnumMember* = ref object of CsObject
  value*: string #Option[int]
type CsEnum* = ref object of CsObject
  items*: seq[CsEnumMember]
type CsIndexer* = ref object of CsObject
  retType*: string
  varName*: string
  varType*: string
  firstVarType*: string
  aclist*: CsAccessorList
  hasDefaultGet*: bool
  hasDefaultSet*: bool
  hasBody*: bool
  # name*: string  # no, there is no name, but there is an AccessorList, or Accessor, that provide the function body.
type CsClass* = ref object of CsObject
  nsParent*: string
  extends*: string
  implements*: seq[string]
  fields*: seq[CsField]
  properties*: seq[CsProperty]
  methods*: seq[CsMethod]
  ctors*: seq[CsConstructor]
  lastAddedTo*: Option[ClassParts]
  isStatic*: bool
  mods*: HashSet[string]
  indexer*: CsIndexer

type CsClassOrStructConstraint* = ref object of CsObject #TODO(type:CsClassOrStructConstraint)
type CsConditionalAccessExpression* = ref object of CsObject #TODO(type:CsConditionalAccessExpression)
type CsConditionalExpression* = ref object of CsObject #TODO(type:CsConditionalExpression)
type CsConstantPattern* = ref object of CsObject #TODO(type:CsConstantPattern)
type CsConstructorConstraint* = ref object of CsObject #TODO(type:CsConstructorConstraint)
type CsContinueStatement* = ref object of CsObject #TODO(type:CsContinueStatement)
type CsConversionOperator* = ref object of CsObject #TODO(type:CsConversionOperator)
type CsDeclarationExpression* = ref object of CsObject #TODO(type:CsDeclarationExpression)
type CsDeclarationPattern* = ref object of CsObject #TODO(type:CsDeclarationPattern)
type CsDefaultExpression* = ref object of CsObject #TODO(type:CsDefaultExpression)
type CsDefaultSwitchLabel* = ref object of CsObject #TODO(type:CsDefaultSwitchLabel)
type CsDelegate* = ref object of CsObject #TODO(type:CsDelegate)
type CsDestructor* = ref object of CsObject #TODO(type:CsDestructor)
type CsDiscardDesignation* = ref object of CsObject #TODO(type:CsDiscardDesignation)
type CsDoStatement* = ref object of CsObject #TODO(type:CsDoStatement)
type CsElementAccessExpression* = ref object of CsObject #TODO(type:CsElementAccessExpression)
type CsElementBindingExpression* = ref object of CsObject #TODO(type:CsElementBindingExpression)
type CsElseClause* = ref object of CsObject #TODO(type:CsElseClause)
type CsEmptyStatement* = ref object of CsObject #TODO(type:CsEmptyStatement)
type CsEqualsValueClause* = ref object of CsObject
  value*: string
  rhsValue*: BodyExpr
type CsEventField* = ref object of CsObject #TODO(type:CsEventField)
type CsEvent* = ref object of CsObject #TODO(type:CsEvent)
type CsExplicitInterfaceSpecifier* = ref object of CsObject #TODO(type:CsExplicitInterfaceSpecifier)
type CsInvocationExpression* = ref object of BodyExpr
  callName*: string
type CsExpressionStatement* = ref object of BodyExpr
  call*: CsInvocationExpression
  args*: CsArgumentList
type CsExternAliasDirective* = ref object of CsObject #TODO(type:CsExternAliasDirective)
type CsFinallyClause* = ref object of CsObject #TODO(type:CsFinallyClause)
type CsFixedStatement* = ref object of CsObject #TODO(type:CsFixedStatement)
type CsForEachStatement* = ref object of CsObject #TODO(type:CsForEachStatement)
type CsForEachVariableStatement* = ref object of CsObject #TODO(type:CsForEachVariableStatement)
type CsForStatement* = ref object of CsObject #TODO(type:CsForStatement)
type CsFromClause* = ref object of CsObject #TODO(type:CsFromClause)



type CsGlobalStatement* = ref object of CsObject #TODO(type:CsGlobalStatement)
type CsGotoStatement* = ref object of CsObject #TODO(type:CsGotoStatement)
type CsGroupClause* = ref object of CsObject #TODO(type:CsGroupClause)
type CsIfStatement* = ref object of CsObject #TODO(type:CsIfStatement)
type CsImplicitArrayCreationExpression *
  = ref object of CsObject #TODO(type:CsImplicitArrayCreationExpression)
type CsImplicitElementAccess* = ref object of CsObject #TODO(type:CsImplicitElementAccess)
type CsIncompleteMember* = ref object of CsObject #TODO(type:CsIncompleteMember)
type CsPredefinedType* = ref object of CsObject
type CsPrefixUnaryExpression* = ref object of CsObject
  prefix*: string # don't handle it in any special way, prepend it, without space if literal, and with - otherwise.
  actingOn*: string
type CsLiteralExpression* = ref object of IAssignable
  value*: string
type CsInitializerExpression* = ref object of CsObject #TODO(type:CsInitializerExpression)
  valueReceived*: string
  bexprs*: seq[BodyExpr]
  somePrefixOp*: CsPrefixUnaryExpression
type CsInterface* = ref object of CsObject #TODO(type:CsInterface)
type CsInterpolatedStringExpression* = ref object of CsObject #TODO(type:CsInterpolatedStringExpression)
type CsInterpolatedStringText* = ref object of CsObject #TODO(type:CsInterpolatedStringText)
type CsInterpolationAlignmentClause* = ref object of CsObject #TODO(type:CsInterpolationAlignmentClause)
type CsInterpolationFormatClause* = ref object of CsObject #TODO(type:CsInterpolationFormatClause)
type CsInterpolation* = ref object of CsObject #TODO(type:CsInterpolation)
type CsIsPatternExpression* = ref object of CsObject #TODO(type:CsIsPatternExpression)
type CsJoinClause* = ref object of CsObject #TODO(type:CsJoinClause)
type CsJoinIntoClause* = ref object of CsObject #TODO(type:CsJoinIntoClause)
type CsLabeledStatement* = ref object of CsObject #TODO(type:CsLabeledStatement)
type CsLetClause* = ref object of CsObject #TODO(type:CsLetClause)
type CsLocalFunctionStatement* = ref object of CsObject #TODO(type:CsLocalFunctionStatement)
type CsLockStatement* = ref object of CsObject #TODO(type:CsLockStatement)
type CsMakeRefExpression* = ref object of CsObject #TODO(type:CsMakeRefExpression)
type CsMemberBindingExpression* = ref object of CsObject #TODO(type:CsMemberBindingExpression)

type CsObjectCreationExpression* = ref object of IAssignable
  typeName*: string           # args*: CsParameterList
  genericName*: CsGenericName # replaces typeName perhaps.
  args*: CsArgumentList
  initExpr*: CsInitializerExpression

type CsVariableDeclarator* = ref object of BodyExpr # I assume this is the right hand side, what the variable is stored with.
  ev*: CsEqualsValueClause # so i can get (with its parentid) the expression statement which is the right hand side, afterwards.
  rhs*: IAssignable
  # bexpr*:BodyExpr # either expressionStatement or objectcreationexpression
  # expr*: CsObjectCreationExpression | CsExpressionStatement
  # exprType*:string
  arglist*: CsArgumentList

type CsReturnStatement* = ref object of BodyExpr # type:CsReturnStatement
  args*: CsArgumentList
  expr*: BodyExpr                                # can have one expr that can be nil
  value*: string
type CsNameColon* = ref object of CsObject #TODO(type:CsNameColon)
type CsNameEquals* = ref object of CsObject #TODO(type:CsNameEquals)
  genericName*: CsGenericName
type CsUsingDirective* = ref object of CsObject
  shorthand*: CsNameEquals
type CsNamespace* = ref object of CsObject
  # id*: UUID
  parent*: string
  classes*: seq[CsClass]
  classTable*: TableRef[string, CsClass]
  enums*: seq[CsEnum]
  enumTable*: TableRef[string, CsEnum]
  interfaces*: seq[CsInterface]
  interfaceTable*: TableRef[string, CsInterface]
  lastAddedTo*: Option[NamespaceParts] # TODO: !!! we actually want here an object variant, so we can simply ask for the object.
 # lastAdded: Construct
  imports*: seq[CsUsingDirective]

type AllNeededData* = object
  sourceCode*: string
  upcoming*: seq[string]
  constructDeclName*: string
  simplified*: seq[(string, UUID)]
  currentNamespace*: CsNamespace
  nsLastAdded*: NamespaceParts
  classLastAdded*: ClassParts
  lastUsing*: CsUsingDirective
  lastEnum*: CsEnum
  lastEnumMember*: CsEnumMember
  lastInterface*: CsInterface
  lastClass*: CsClass
  lastMethod*: CsMethod
  lastProp*: CsProperty
  lastCtor*: CsConstructor
  lastMethodBodyExpr*: BodyExpr
  lastBodyExprId*: Option[UUID]
  lastBodyExpr*: Option[BodyExpr]
  inBlock*: Block
  prevBlock*: Block
  currentConstruct*: Option[Block]
  previousConstruct*: Option[Block]
  previousPreviousConstruct*: Option[Block]
type CsNullableType* = ref object of CsObject #TODO(type:CsNullableType)
type CsOmittedArraySizeExpression* = ref object of CsObject #TODO(type:CsOmittedArraySizeExpression)
type CsOmittedTypeArgument* = ref object of CsObject #TODO(type:CsOmittedTypeArgument)
type CsOperator* = ref object of CsObject #TODO(type:CsOperator)
type CsOrderByClause* = ref object of CsObject #TODO(type:CsOrderByClause)
type CsOrdering* = ref object of CsObject #TODO(type:CsOrdering)
type CsParenthesizedExpression* = ref object of CsObject #TODO(type:CsParenthesizedExpression)
type CsParenthesizedLambdaExpression* = ref object of CsObject #TODO(type:CsParenthesizedLambdaExpression)
type CsParenthesizedVariableDesignation *
  = ref object of CsObject #TODO(type:CsParenthesizedVariableDesignation)
type CsPointerType* = ref object of CsObject #TODO(type:CsPointerType)
type CsPostfixUnaryExpression* = ref object of CsObject #TODO(type:CsPostfixUnaryExpression)
type CsQueryBody* = ref object of CsObject #TODO(type:CsQueryBody)
type CsQueryContinuation* = ref object of CsObject #TODO(type:CsQueryContinuation)
type CsQueryExpression* = ref object of CsObject #TODO(type:CsQueryExpression)
type CsRefExpression* = ref object of CsObject #TODO(type:CsRefExpression)
type CsRefTypeExpression* = ref object of CsObject #TODO(type:CsRefTypeExpression)
type CsRefType* = ref object of CsObject #TODO(type:CsRefType)
type CsRefValueExpression* = ref object of CsObject #TODO(type:CsRefValueExpression)
type CsSelectClause* = ref object of CsObject #TODO(type:CsSelectClause)
type CsSimpleBaseType* = ref object of CsObject #TODO(type:CsSimpleBaseType)
type CsSimpleLambdaExpression* = ref object of CsObject #TODO(type:CsSimpleLambdaExpression)
type CsSingleVariableDesignation* = ref object of CsObject #TODO(type:CsSingleVariableDesignation)
type CsSizeOfExpression* = ref object of CsObject #TODO(type:CsSizeOfExpression)
type CsStackAllocArrayCreationExpression *
  = ref object of CsObject #TODO(type:CsStackAllocArrayCreationExpression)
type CsStruct* = ref object of CsObject #TODO(type:CsStruct)
type CsSwitchSection* = ref object of CsObject #TODO(type:CsSwitchSection)
type CsSwitchStatement* = ref object of CsObject #TODO(type:CsSwitchStatement)
type CsThisExpression* = ref object of CsObject #TODO(type:CsThisExpression)
type CsThrowExpression* = ref object of CsObject #TODO(type:CsThrowExpression)
type CsThrowStatement* = ref object of CsObject #TODO(type:CsThrowStatement)
type CsTryStatement* = ref object of CsObject #TODO(type:CsTryStatement)
type CsTupleElement* = ref object of CsObject #TODO(type:CsTupleElement)
type CsTupleExpression* = ref object of CsObject #TODO(type:CsTupleExpression)
type CsTupleType* = ref object of CsObject #TODO(type:CsTupleType)
type CsTypeConstraint* = ref object of CsObject #TODO(type:CsTypeConstraint)
type CsTypeOfExpression* = ref object of CsObject #TODO(type:CsTypeOfExpression)
type CsTypeParameterConstraintClause* = ref object of CsObject #TODO(type:CsTypeParameterConstraintClause)
type CsTypeParameterList* = ref object of CsObject #TODO(type:CsTypeParameterList)
type CsTypeParameter* = ref object of CsObject #TODO(type:CsTypeParameter)
type CsUnsafeStatement* = ref object of CsObject #TODO(type:CsUnsafeStatement)
type CsUsingStatement* = ref object of CsObject #TODO(type:CsUsingStatement)
type CsWhenClause* = ref object of CsObject #TODO(type:CsWhenClause)
type CsWhereClause* = ref object of CsObject #TODO(type:CsWhereClause)
type CsWhileStatement* = ref object of CsObject #TODO(type:CsWhileStatement)
type CsYieldStatement* = ref object of CsObject #TODO(type:CsYieldStatement)
type CsBlock* = ref object of CsObject
type CsVariable* = ref object of BodyExpr
  # name*:string
  thetype*: string
  genericName*: CsGenericName

type CsLocalDeclarationStatement* = ref object of BodyExpr
  names*: seq[string]
  vartype*: string
  lhs*: CsVariable           # lhs = left hand side, rhs = right hand side.
  rhs*: CsVariableDeclarator # which has what's after the equals-value-clause.



type CsBinaryPattern* = ref object of CsObject
type CsDiscardPattern* = ref object of CsObject
type CsFunctionPointerType* = ref object of CsObject
type CsImplicitObjectCreationExpression * = ref object of CsObject
type CsMemberAccessExpression* = ref object of IAssignable
  fromPart*: string
  member*: string
type CsParenthesizedPattern* = ref object of CsObject
type CsPositionalPatternClause* = ref object of CsObject
type CsPrimaryConstructorBaseType* = ref object of CsObject
type CsPropertyPatternClause* = ref object of CsObject
type CsRangeExpression* = ref object of CsObject
type CsRecord* = ref object of CsObject
type CsRecursivePattern* = ref object of CsObject
type CsRelationalPattern* = ref object of CsObject
type CsSubpattern* = ref object of CsObject
type CsSwitchExpression* = ref object of CsObject
type CsSwitchExpressionArm* = ref object of CsObject
type CsTypePattern* = ref object of CsObject
type CsUnaryPattern* = ref object of CsObject
type CsVarPattern* = ref object of CsObject
type CsWithExpression* = ref object of CsObject
type CsImplicitStackAllocArrayCreationExpression * = ref object of CsObject
