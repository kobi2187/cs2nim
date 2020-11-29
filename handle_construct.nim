import constructs/[cs_class, cs_root]
import strutils
import constructs/constructs

import state_utils
import state, types
# import tables, json,
import stacks, options

var gotStartBlock = false

import sets

proc previousBlock(): Option[Block] =
  let prev = blocks.peek(-3) # -2*2+1
  result = prev



proc getLastEnumMember(root: CsRoot): CsEnumMember =
  let (_, ns) = getCurrentNs(root)
  var e = ns.enums.last
  result = e.items.last


proc addToLastMethodOrCtor(root: CsRoot, p: CsParameterList) =
  var c = getLastClass(root).get
  assert c.lastAddedTo in [ClassParts.Methods, ClassParts.Ctors]
  case c.lastAddedTo
  of ClassParts.Methods:
    var m = getLastMethod(c)
    assert m.isSome()
    add(m.get, p)
  of ClassParts.Ctors:
    var ctr = getLastCtor(c)
    assert ctr.isSome()
    add(ctr.get, p)
  else: assert false, "not implemented!"

proc addIfBodyExpr(root: CsRoot; item: BodyExpr) =
  var c = root.getLastClass().get
  assert c.lastAddedTo in [ClassParts.Methods, ClassParts.Ctors]
  # we assume bodyExpr to only exist within a method or a ctor.
  # todo: probably get/set also, haven't seen yet.
  if c.lastAddedTo == ClassParts.Methods:
    let m = c.getLastMethod()
    assert m.isSome
    m.get.body.add item
  elif c.lastAddedTo == ClassParts.Ctors:
    let m = c.getLastCtor()
    assert m.isSome
    m.get.body.add item
  else: assert false, "Unforeseen! or not yet implemented"


  # proc handle*(t: typedesc[T]; root: var CsRoot; info: Info)
proc addToRoot*(root: var CsRoot; src: string; info: Info) =
  when false:
    echo "blocks info:"
    echo "============"
    echo "last construct: " & $currentConstruct.last
    echo "previous construct: " & $previousConstruct()
    echo $currentPath()

  if src.strip().len > 0: echo "C# source code was: " & src
  if gotStartBlock:
    if not (info.declName in state.blockTypesTxt):
      echo "!!! `" & info.declName & "` should be in `state.blockTypesTxt`"
    gotStartBlock = false
  ## here, we take the path from `blocks`, if there are consecutive namespaces, we combine them. (ns decl will already create new ns in root if they are nested)
  ## (update block types if we find more)

  # lots of impl details here. two parts:1) get the path, 2) create object and extract details from Info.
  ## we go deep, according to path, get the reference, and add the new info as the correct object (from types).
  ## probably we discover we need to extract info better, or the types are not well defined, so fix them when we find such a discrepancy
  ## that's it for this proc.
  case info.declName
  # declaration names:

  of "CompilationUnit": echo "got CompilationUnit" #TODO(handle: CompilationUnit)

  of "BlockStarts":
    echo "START OF NEW BLOCK: " & $currentConstruct.last
    gotStartBlock = true
    # note: the construct that comes immediately after, should be added to blocks (in proc modifyPosition), but has to be explicitly enabled on CsDisplay side.
    # sometimes it is an empty block {}, for example an empty method body. which means we don't yet support method body.
    # in that case, we may get an assertion because blocks stack len will be odd.
    # iow: if blocks stack is odd when it receives EndBlock, it means we miss support for some construct.

  of "NamespaceDeclaration":
    let newns = extract(CsNamespace, info)
    # try handle nested.
    let prev = blocks.peek(-3) # -2*2+1
    if prev.isSome and prev.get.name == "NamespaceDeclaration":
      echo "PREV: " & $prev
      let prevNsName = extract(CsNamespace, prev.get.info).name
      if prevNsName != newns.name:
        newns.name = prevNsName & "." & newns.name

    root.add(newns)

  of "ClassDeclaration":
    let c = extract(CsClass, info)
    var (p, ns) = getcurrentNs(root)
    # echo "nsPath is: " & p
    c.nsParent = p
    ns.add(c)

  of "EnumDeclaration":
    # extract name:
    let e = extract(typedesc(CsEnum), info)
    # add enum declaration to namespace.
    var (name, ns) = getCurrentNs(root)
    echo name
    add(ns, e)
    # note: enums can also appear in classes, but we belong them to namespaces anyway. (does it matter?)

  of "EnumMemberDeclaration":
    let em = extract(typedesc(CsEnumMember), info)
    var (_, ns) = getCurrentNs(root)
    # echo name
    var lastEnum = ns.enums.last
    # var lastEnum = ns.enumTable[p]
    lastEnum.items.add(em)

  of "MethodDeclaration":
    # echo info
    var cls = getLastClass(root)
    assert cls.isSome
    let m1: CsMethod = extract(typedesc(CsMethod), info)
    m1.parentClass = cls.get.name
    add(cls.get, m1)

  of "PredefinedType":
    echo "in PredefinedType!!"
    let t = extract(typedesc(CsPredefinedType), info)
    var prev = previousConstruct().name
    case prev
    of "MethodDeclaration":
      var m = getLastClass(root).get.getLastMethod()
      assert m.isSome
      add(m.get, t)

  of "ParameterList":
    echo "! in parameter list!"
    let p = extract(typedesc(CsParameterList), info)
    addToLastMethodOrCtor(root, p)



    # var prev = previousConstruct()

  of "Parameter": #TODO unfinished :)
    echo "! in parameter!"
    echo info
    let p = extract(typedesc(CsParameter), info)

    var m = root.getLastClass().get.getLastMethod()
    assert m.isSome()
    m.get.parameterList.add p


  of "ReturnStatement": #TODO
    echo "in return statement!"
    echo info
    let r = extract(typedesc(CsReturnStatement), info)
    addIfBodyExpr(root, r)

  of "LiteralExpression":
    echo "got LiteralExpression" #TODO(handle: LiteralExpression)
    # just extract and add to last construct seen.
    let r = extract(typedesc(CsLiteralExpression), info)
    var prev = previousConstruct()
    # literal can be seen in many places.
    let whichType = prev.name
    # let probablyName = prev.info.essentials[0]
    case whichType:
    of "EqualsValueClause":
    # we'll need to get prevprev construct and assign the value to it.
      let prevprev = prevprevConstruct()
      let prevprevType = prevprev.name
      case prevprevType:
        of "EnumMemberDeclaration": getLastEnumMember(root).add(r.value)
        else: assert false, prevprevType

    # of "CsNamespace...": assert false
    # of "CsClass...": assert false
    # of "CsParameter...": assert false
    of "ReturnStatement":
      # assume return only exists within method bodies
      let c = getLastClass(root).get
      case c.lastAddedTo
      of ClassParts.Methods:
        var m = c.getLastMethod().get
        var ret = m.body.last
        assert ret.ttype == "CsReturnStatement"
        cast[CsReturnStatement](ret).expr = r

      else: assert false

    else: assert false, prev.name

    # for method/ctor body: addIfBodyExpr(root, r)




  of "UsingDirective": echo "got UsingDirective" #TODO(handle: UsingDirective)
  of "QualifiedName": echo "got QualifiedName" #TODO(handle: QualifiedName)
  of "ExpressionStatement": echo "got ExpressionStatement" #TODO(handle: ExpressionStatement)
  of "InvocationExpression": echo "got InvocationExpression" #TODO(handle: InvocationExpression)
  of "ArgumentList": echo "got ArgumentList" #TODO(handle: ArgumentList)
  of "Argument": echo "got Argument" #TODO(handle: Argument)
  of "BinaryExpression": echo "got BinaryExpression" #TODO(handle: BinaryExpression)
  of "AssignmentExpression": echo "got AssignmentExpression" #TODO(handle: AssignmentExpression)
  of "EqualsValueClause": echo "got EqualsValueClause" #TODO(handle: EqualsValueClause)
  of "LocalDeclarationStatement": echo "got LocalDeclarationStatement" #TODO(handle: LocalDeclarationStatement)
  of "ObjectCreationExpression": echo "got ObjectCreationExpression" #TODO(handle: ObjectCreationExpression)
  of "IfStatement": echo "got IfStatement" #TODO(handle: IfStatement)
  of "Attribute": echo "got Attribute" #TODO(handle: Attribute)
  of "AttributeList": echo "got AttributeList" #TODO(handle: AttributeList)
  of "ThisExpression": echo "got ThisExpression" #TODO(handle: ThisExpression)
  of "TypeArgumentList": echo "got TypeArgumentList" #TODO(handle: TypeArgumentList)
  of "GenericName": echo "got GenericName" #TODO(handle: GenericName)
  of "AttributeArgument": echo "got AttributeArgument" #TODO(handle: AttributeArgument)
  of "AccessorDeclaration": echo "got AccessorDeclaration" #TODO(handle: AccessorDeclaration)
  of "FieldDeclaration": echo "got FieldDeclaration" #TODO(handle: FieldDeclaration)
  of "BracketedArgumentList": echo "got BracketedArgumentList" #TODO(handle: BracketedArgumentList)
  of "ElementAccessExpression": echo "got ElementAccessExpression" #TODO(handle: ElementAccessExpression)
  of "PropertyDeclaration": echo "got PropertyDeclaration" #TODO(handle: PropertyDeclaration)
  of "AccessorList": echo "got AccessorList" #TODO(handle: AccessorList)
  of "AttributeArgumentList": echo "got AttributeArgumentList" #TODO(handle: AttributeArgumentList)
  of "ParenthesizedExpression": echo "got ParenthesizedExpression" #TODO(handle: ParenthesizedExpression)
  of "CastExpression": echo "got CastExpression" #TODO(handle: CastExpression)
  of "ArrayRankSpecifier": echo "got ArrayRankSpecifier" #TODO(handle: ArrayRankSpecifier)
  of "ArrayType": echo "got ArrayType" #TODO(handle: ArrayType)
  of "PrefixUnaryExpression": echo "got PrefixUnaryExpression" #TODO(handle: PrefixUnaryExpression)
  of "OmittedArraySizeExpression": echo "got OmittedArraySizeExpression" #TODO(handle: OmittedArraySizeExpression)
  of "InitializerExpression": echo "got InitializerExpression" #TODO(handle: InitializerExpression)
  of "NameEquals": echo "got NameEquals" #TODO(handle: NameEquals)
  of "ThrowStatement": echo "got ThrowStatement" #TODO(handle: ThrowStatement)
  of "TypeOfExpression": echo "got TypeOfExpression" #TODO(handle: TypeOfExpression)
  of "ElseClause": echo "got ElseClause" #TODO(handle: ElseClause)
  of "CaseSwitchLabel": echo "got CaseSwitchLabel" #TODO(handle: CaseSwitchLabel)
  of "SimpleBaseType": echo "got SimpleBaseType" #TODO(handle: SimpleBaseType)
  of "ConstructorDeclaration": echo "got ConstructorDeclaration" #TODO(handle: ConstructorDeclaration)
  of "BaseList": echo "got BaseList" #TODO(handle: BaseList)
  of "SwitchSection": echo "got SwitchSection" #TODO(handle: SwitchSection)
  of "SimpleLambdaExpression": echo "got SimpleLambdaExpression" #TODO(handle: SimpleLambdaExpression)
  of "PostfixUnaryExpression": echo "got PostfixUnaryExpression" #TODO(handle: PostfixUnaryExpression)
  of "ArrayCreationExpression": echo "got ArrayCreationExpression" #TODO(handle: ArrayCreationExpression)
  of "ArrowExpressionClause": echo "got ArrowExpressionClause" #TODO(handle: ArrowExpressionClause)
  of "BreakStatement": echo "got BreakStatement" #TODO(handle: BreakStatement)
  of "AliasQualifiedName": echo "got AliasQualifiedName" #TODO(handle: AliasQualifiedName)
  of "TypeParameter": echo "got TypeParameter" #TODO(handle: TypeParameter)
  of "AwaitExpression": echo "got AwaitExpression" #TODO(handle: AwaitExpression)
  of "ConditionalExpression": echo "got ConditionalExpression" #TODO(handle: ConditionalExpression)
  of "AttributeTargetSpecifier": echo "got AttributeTargetSpecifier" #TODO(handle: AttributeTargetSpecifier)
  of "TypeParameterList": echo "got TypeParameterList" #TODO(handle: TypeParameterList)
  of "ForEachStatement": echo "got ForEachStatement" #TODO(handle: ForEachStatement)
  of "ForStatement": echo "got ForStatement" #TODO(handle: ForStatement)
  of "InterpolatedStringText": echo "got InterpolatedStringText" #TODO(handle: InterpolatedStringText)
  of "ParenthesizedLambdaExpression": echo "got ParenthesizedLambdaExpression" #TODO(handle: ParenthesizedLambdaExpression)
  of "TryStatement": echo "got TryStatement" #TODO(handle: TryStatement)
  of "NullableType": echo "got NullableType" #TODO(handle: NullableType)
  of "BaseExpression": echo "got BaseExpression" #TODO(handle: BaseExpression)
  of "CatchClause": echo "got CatchClause" #TODO(handle: CatchClause)
  of "ConstructorInitializer": echo "got ConstructorInitializer" #TODO(handle: ConstructorInitializer)
  of "Interpolation": echo "got Interpolation" #TODO(handle: Interpolation)
  of "CatchDeclaration": echo "got CatchDeclaration" #TODO(handle: CatchDeclaration)
  of "NameColon": echo "got NameColon" #TODO(handle: NameColon)
  of "UsingStatement": echo "got UsingStatement" #TODO(handle: UsingStatement)
  of "TypeParameterConstraintClause": echo "got TypeParameterConstraintClause" #TODO(handle: TypeParameterConstraintClause)
  of "TypeConstraint": echo "got TypeConstraint" #TODO(handle: TypeConstraint)
  of "SingleVariableDesignation": echo "got SingleVariableDesignation" #TODO(handle: SingleVariableDesignation)
  of "InterpolatedStringExpression": echo "got InterpolatedStringExpression" #TODO(handle: InterpolatedStringExpression)
  of "ImplicitArrayCreationExpression": echo "got ImplicitArrayCreationExpression" #TODO(handle: ImplicitArrayCreationExpression)
  of "WhileStatement": echo "got WhileStatement" #TODO(handle: WhileStatement)
  of "DeclarationExpression": echo "got DeclarationExpression" #TODO(handle: DeclarationExpression)
  of "ExplicitInterfaceSpecifier": echo "got ExplicitInterfaceSpecifier" #TODO(handle: ExplicitInterfaceSpecifier)
  of "ConditionalAccessExpression": echo "got ConditionalAccessExpression" #TODO(handle: ConditionalAccessExpression)
  of "SwitchStatement": echo "got SwitchStatement" #TODO(handle: SwitchStatement)
  of "MemberBindingExpression": echo "got MemberBindingExpression" #TODO(handle: MemberBindingExpression)
  of "DefaultExpression": echo "got DefaultExpression" #TODO(handle: DefaultExpression)
  of "PointerType": echo "got PointerType" #TODO(handle: PointerType)
  of "InterfaceDeclaration": echo "got InterfaceDeclaration" #TODO(handle: InterfaceDeclaration)
  of "ContinueStatement": echo "got ContinueStatement" #TODO(handle: ContinueStatement)
  of "FinallyClause": echo "got FinallyClause" #TODO(handle: FinallyClause)
  of "DefaultSwitchLabel": echo "got DefaultSwitchLabel" #TODO(handle: DefaultSwitchLabel)
  of "YieldStatement": echo "got YieldStatement" #TODO(handle: YieldStatement)
  of "AnonymousObjectMemberDeclarator": echo "got AnonymousObjectMemberDeclarator" #TODO(handle: AnonymousObjectMemberDeclarator)
  of "CheckedExpression": echo "got CheckedExpression" #TODO(handle: CheckedExpression)
  of "StructDeclaration": echo "got StructDeclaration" #TODO(handle: StructDeclaration)
  of "IsPatternExpression": echo "got IsPatternExpression" #TODO(handle: IsPatternExpression)
  of "LockStatement": echo "got LockStatement" #TODO(handle: LockStatement)
  of "DeclarationPattern": echo "got DeclarationPattern" #TODO(handle: DeclarationPattern)
  of "ThrowExpression": echo "got ThrowExpression" #TODO(handle: ThrowExpression)
  of "ConstantPattern": echo "got ConstantPattern" #TODO(handle: ConstantPattern)
  of "RefType": echo "got RefType" #TODO(handle: RefType)
  of "RefExpression": echo "got RefExpression" #TODO(handle: RefExpression)
  of "ClassOrStructConstraint": echo "got ClassOrStructConstraint" #TODO(handle: ClassOrStructConstraint)
  of "OmittedTypeArgument": echo "got OmittedTypeArgument" #TODO(handle: OmittedTypeArgument)
  of "TupleElement": echo "got TupleElement" #TODO(handle: TupleElement)
  of "OperatorDeclaration": echo "got OperatorDeclaration" #TODO(handle: OperatorDeclaration)
  of "EventFieldDeclaration": echo "got EventFieldDeclaration" #TODO(handle: EventFieldDeclaration)
  of "DelegateDeclaration": echo "got DelegateDeclaration" #TODO(handle: DelegateDeclaration)
  of "ImplicitElementAccess": echo "got ImplicitElementAccess" #TODO(handle: ImplicitElementAccess)
  of "AnonymousMethodExpression": echo "got AnonymousMethodExpression" #TODO(handle: AnonymousMethodExpression)
  of "TupleExpression": echo "got TupleExpression" #TODO(handle: TupleExpression)
  of "AnonymousObjectCreationExpression": echo "got AnonymousObjectCreationExpression" #TODO(handle: AnonymousObjectCreationExpression)
  of "IndexerDeclaration": echo "got IndexerDeclaration" #TODO(handle: IndexerDeclaration)
  of "BracketedParameterList": echo "got BracketedParameterList" #TODO(handle: BracketedParameterList)
  of "EventDeclaration": echo "got EventDeclaration" #TODO(handle: EventDeclaration)
  of "GotoStatement": echo "got GotoStatement" #TODO(handle: GotoStatement)
  of "DoStatement": echo "got DoStatement" #TODO(handle: DoStatement)
  of "GlobalStatement": echo "got GlobalStatement" #TODO(handle: GlobalStatement)
  of "IncompleteMember": echo "got IncompleteMember" #TODO(handle: IncompleteMember)
  of "LocalFunctionStatement": echo "got LocalFunctionStatement" #TODO(handle: LocalFunctionStatement)
  of "ConversionOperatorDeclaration": echo "got ConversionOperatorDeclaration" #TODO(handle: ConversionOperatorDeclaration)
  of "TupleType": echo "got TupleType" #TODO(handle: TupleType)
  of "FixedStatement": echo "got FixedStatement" #TODO(handle: FixedStatement)
  of "EmptyStatement": echo "got EmptyStatement" #TODO(handle: EmptyStatement)
  of "FromClause": echo "got FromClause" #TODO(handle: FromClause)
  of "SizeOfExpression": echo "got SizeOfExpression" #TODO(handle: SizeOfExpression)
  of "QueryBody": echo "got QueryBody" #TODO(handle: QueryBody)
  of "CheckedStatement": echo "got CheckedStatement" #TODO(handle: CheckedStatement)
  of "QueryExpression": echo "got QueryExpression" #TODO(handle: QueryExpression)
  of "SelectClause": echo "got SelectClause" #TODO(handle: SelectClause)
  of "CasePatternSwitchLabel": echo "got CasePatternSwitchLabel" #TODO(handle: CasePatternSwitchLabel)
  of "LabeledStatement": echo "got LabeledStatement" #TODO(handle: LabeledStatement)
  of "WhereClause": echo "got WhereClause" #TODO(handle: WhereClause)
  of "ConstructorConstraint": echo "got ConstructorConstraint" #TODO(handle: ConstructorConstraint)
  of "UnsafeStatement": echo "got UnsafeStatement" #TODO(handle: UnsafeStatement)
  of "ParenthesizedVariableDesignation": echo "got ParenthesizedVariableDesignation" #TODO(handle: ParenthesizedVariableDesignation)
  of "InterpolationFormatClause": echo "got InterpolationFormatClause" #TODO(handle: InterpolationFormatClause)
  of "DestructorDeclaration": echo "got DestructorDeclaration" #TODO(handle: DestructorDeclaration)
  of "DiscardDesignation": echo "got DiscardDesignation" #TODO(handle: DiscardDesignation)
  of "StackAllocArrayCreationExpression": echo "got StackAllocArrayCreationExpression" #TODO(handle: StackAllocArrayCreationExpression)
  of "WhenClause": echo "got WhenClause" #TODO(handle: WhenClause)
  of "ForEachVariableStatement": echo "got ForEachVariableStatement" #TODO(handle: ForEachVariableStatement)
  of "LetClause": echo "got LetClause" #TODO(handle: LetClause)
  of "ElementBindingExpression": echo "got ElementBindingExpression" #TODO(handle: ElementBindingExpression)
  of "CatchFilterClause": echo "got CatchFilterClause" #TODO(handle: CatchFilterClause)
  of "Ordering": echo "got Ordering" #TODO(handle: Ordering)
  of "OrderByClause": echo "got OrderByClause" #TODO(handle: OrderByClause)
  of "JoinClause": echo "got JoinClause" #TODO(handle: JoinClause)
  of "GroupClause": echo "got GroupClause" #TODO(handle: GroupClause)
  of "InterpolationAlignmentClause": echo "got InterpolationAlignmentClause" #TODO(handle: InterpolationAlignmentClause)
  of "QueryContinuation": echo "got QueryContinuation" #TODO(handle: QueryContinuation)
  of "ExternAliasDirective": echo "got ExternAliasDirective" #TODO(handle: ExternAliasDirective)
  of "MakeRefExpression": echo "got MakeRefExpression" #TODO(handle: MakeRefExpression)
  of "JoinIntoClause": echo "got JoinIntoClause" #TODO(handle: JoinIntoClause)
  of "RefValueExpression": echo "got RefValueExpression" #TODO(handle: RefValueExpression)
  of "RefTypeExpression": echo "got RefTypeExpression" #TODO(handle: RefTypeExpression)
  of "Block": echo "got Block" #TODO(handle: Block)
  of "VariableDeclaration": echo "got VariableDeclaration" #TODO(handle: VariableDeclaration)
  of "BadDirectiveTrivia": echo "got BadDirectiveTrivia" #TODO(handle: BadDirectiveTrivia)
  of "BinaryPattern": echo "got BinaryPattern" #TODO(handle: BinaryPattern)
  of "ConversionOperatorMemberCref": echo "got ConversionOperatorMemberCref" #TODO(handle: ConversionOperatorMemberCref)
  of "CrefBracketedParameterList": echo "got CrefBracketedParameterList" #TODO(handle: CrefBracketedParameterList)
  of "CrefParameter": echo "got CrefParameter" #TODO(handle: CrefParameter)
  of "CrefParameterList": echo "got CrefParameterList" #TODO(handle: CrefParameterList)
  of "DefineDirectiveTrivia": echo "got DefineDirectiveTrivia" #TODO(handle: DefineDirectiveTrivia)
  of "DiscardPattern": echo "got DiscardPattern" #TODO(handle: DiscardPattern)
  of "DocumentationCommentTrivia": echo "got DocumentationCommentTrivia" #TODO(handle: DocumentationCommentTrivia)
  of "ElifDirectiveTrivia": echo "got ElifDirectiveTrivia" #TODO(handle: ElifDirectiveTrivia)
  of "ElseDirectiveTrivia": echo "got ElseDirectiveTrivia" #TODO(handle: ElseDirectiveTrivia)
  of "EndIfDirectiveTrivia": echo "got EndIfDirectiveTrivia" #TODO(handle: EndIfDirectiveTrivia)
  of "EndRegionDirectiveTrivia": echo "got EndRegionDirectiveTrivia" #TODO(handle: EndRegionDirectiveTrivia)
  of "ErrorDirectiveTrivia": echo "got ErrorDirectiveTrivia" #TODO(handle: ErrorDirectiveTrivia)
  of "FunctionPointerType": echo "got FunctionPointerType" #TODO(handle: FunctionPointerType)
  of "IdentifierName": echo "got IdentifierName" #TODO(handle: IdentifierName)
  of "ImplicitObjectCreationExpression": echo "got ImplicitObjectCreationExpression" #TODO(handle: ImplicitObjectCreationExpression)
  of "MemberAccessExpression": echo "got MemberAccessExpression" #TODO(handle: MemberAccessExpression)
  of "NullableDirectiveTrivia": echo "got NullableDirectiveTrivia" #TODO(handle: NullableDirectiveTrivia)
  of "ParenthesizedPattern": echo "got ParenthesizedPattern" #TODO(handle: ParenthesizedPattern)
  of "PositionalPatternClause": echo "got PositionalPatternClause" #TODO(handle: PositionalPatternClause)
  of "PrimaryConstructorBaseType": echo "got PrimaryConstructorBaseType" #TODO(handle: PrimaryConstructorBaseType)
  of "PropertyPatternClause": echo "got PropertyPatternClause" #TODO(handle: PropertyPatternClause)
  of "RangeExpression": echo "got RangeExpression" #TODO(handle: RangeExpression)
  of "RecordDeclaration": echo "got RecordDeclaration" #TODO(handle: RecordDeclaration)
  of "RecursivePattern": echo "got RecursivePattern" #TODO(handle: RecursivePattern)
  of "RegionDirectiveTrivia": echo "got RegionDirectiveTrivia" #TODO(handle: RegionDirectiveTrivia)
  of "RelationalPattern": echo "got RelationalPattern" #TODO(handle: RelationalPattern)
  of "Subpattern": echo "got Subpattern" #TODO(handle: Subpattern)
  of "SwitchExpression": echo "got SwitchExpression" #TODO(handle: SwitchExpression)
  of "SwitchExpressionArm": echo "got SwitchExpressionArm" #TODO(handle: SwitchExpressionArm)
  of "TypePattern": echo "got TypePattern" #TODO(handle: TypePattern)
  of "UnaryPattern": echo "got UnaryPattern" #TODO(handle: UnaryPattern)
  of "VariableDeclarator": echo "got VariableDeclarator" #TODO(handle: VariableDeclarator)
  of "VarPattern": echo "got VarPattern" #TODO(handle: VarPattern)
  of "WithExpression": echo "got WithExpression" #TODO(handle: WithExpression)
  of "XmlCDataSection": echo "got XmlCDataSection" #TODO(handle: XmlCDataSection)
  of "XmlComment": echo "got XmlComment" #TODO(handle: XmlComment)
  of "XmlCrefAttribute": echo "got XmlCrefAttribute" #TODO(handle: XmlCrefAttribute)
  of "XmlElement": echo "got XmlElement" #TODO(handle: XmlElement)
  of "XmlElementEndTag": echo "got XmlElementEndTag" #TODO(handle: XmlElementEndTag)
  of "XmlElementStartTag": echo "got XmlElementStartTag" #TODO(handle: XmlElementStartTag)
  of "XmlEmptyElement": echo "got XmlEmptyElement" #TODO(handle: XmlEmptyElement)
  of "XmlName": echo "got XmlName" #TODO(handle: XmlName)
  of "XmlNameAttribute": echo "got XmlNameAttribute" #TODO(handle: XmlNameAttribute)
  of "XmlPrefix": echo "got XmlPrefix" #TODO(handle: XmlPrefix)
  of "XmlProcessingInstruction": echo "got XmlProcessingInstruction" #TODO(handle: XmlProcessingInstruction)
  of "XmlText": echo "got XmlText" #TODO(handle: XmlText)
  of "XmlTextAttribute": echo "got XmlTextAttribute" #TODO(handle: XmlTextAttribute)
  of "IfDirectiveTrivia": echo "got IfDirectiveTrivia" #TODO(handle: IfDirectiveTrivia)
  of "ImplicitStackAllocArrayCreationExpression": echo "got ImplicitStackAllocArrayCreationExpression" #TODO(handle: ImplicitStackAllocArrayCreationExpression)
  of "IndexerMemberCref": echo "got IndexerMemberCref" #TODO(handle: IndexerMemberCref)
  of "LineDirectiveTrivia": echo "got LineDirectiveTrivia" #TODO(handle: LineDirectiveTrivia)
  of "LoadDirectiveTrivia": echo "got LoadDirectiveTrivia" #TODO(handle: LoadDirectiveTrivia)
  of "NameMemberCref": echo "got NameMemberCref" #TODO(handle: NameMemberCref)
  of "OperatorMemberCref": echo "got OperatorMemberCref" #TODO(handle: OperatorMemberCref)
  of "PragmaChecksumDirectiveTrivia": echo "got PragmaChecksumDirectiveTrivia" #TODO(handle: PragmaChecksumDirectiveTrivia)
  of "PragmaWarningDirectiveTrivia": echo "got PragmaWarningDirectiveTrivia" #TODO(handle: PragmaWarningDirectiveTrivia)
  of "QualifiedCref": echo "got QualifiedCref" #TODO(handle: QualifiedCref)
  of "ReferenceDirectiveTrivia": echo "got ReferenceDirectiveTrivia" #TODO(handle: ReferenceDirectiveTrivia)
  of "ShebangDirectiveTrivia": echo "got ShebangDirectiveTrivia" #TODO(handle: ShebangDirectiveTrivia)
  of "SkippedTokensTrivia": echo "got SkippedTokensTrivia" #TODO(handle: SkippedTokensTrivia)
  of "TypeCref": echo "got TypeCref" #TODO(handle: TypeCref)
  of "UndefDirectiveTrivia": echo "got UndefDirectiveTrivia" #TODO(handle: UndefDirectiveTrivia)
  of "WarningDirectiveTrivia": echo "got WarningDirectiveTrivia" #TODO(handle: WarningDirectiveTrivia)



  else:
    raise newException(Exception, "unsupported! Please add to the switch case above: `" &
        info.declName & "`")

