import constructs/[cs_class, cs_root]
import strutils
import constructs/constructs

import state_utils
import state, types
# import tables, json,
import stacks, options

var gotStartBlock = false

import sets

var debugWantSomeWork = true

proc previousBlock(): Option[Block] =
  let prev = blocks.peek(-3) # -2*2+1
  result = prev



proc getLastEnumMember(root: CsRoot): CsEnumMember =
  let (_, ns) = getCurrentNs(root)
  var e = ns.enums.last
  result = e.items.last


proc addToLastMethodOrCtor(root: CsRoot, p: CsParameterList) =
  echo root
  let (a, b) = root.getCurrentNs()
  echo b

  var c = getLastClass(root).get

  assert c.lastAddedTo.issome and c.lastAddedTo.get in [ClassParts.Methods, ClassParts.Ctors]
  case c.lastAddedTo.get
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
  assert c.lastAddedTo.issome and c.lastAddedTo.get in [ClassParts.Methods, ClassParts.Ctors]
  # we assume bodyExpr to only exist within a method or a ctor.
  # todo: probably get/set also, haven't seen yet.

  if c.lastAddedTo.get == ClassParts.Methods:
    let m = c.getLastMethod()
    assert m.isSome
    m.get.body.add item
  elif c.lastAddedTo.get == ClassParts.Ctors:
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

  of "CompilationUnit":
    echo "got CompilationUnit"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CompilationUnit)

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

  of "IndexerDeclaration":
    echo "got IndexerDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: IndexerDeclaration)
    echo info
    assert false, "implement me plz"

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

    let c = getLastClass(root).get
    case c.lastAddedTo.get
    of ClassParts.Methods:
      var m = c.getLastMethod()
      assert m.isSome()
      m.get.parameterList.add p
    of ClassParts.Ctors:
      var ctr = c.getLastCtor()
      assert ctr.isSome
      ctr.get.parameterList.add p
    else: assert false, "not implemented"
  of "Argument":
    echo info
    # assert false
  of "ConstructorDeclaration":
    echo "got ConstructorDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ConstructorDeclaration)
    echo info
    let ctor = extract(CsConstructor, info)
    var c = root.getLastClass().get
    c.add(ctor)

  of "ReturnStatement":
    echo "in return statement!"
    echo info
    let r = extract(typedesc(CsReturnStatement), info)
    addIfBodyExpr(root, r)

  of "LiteralExpression":
    echo "got LiteralExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: LiteralExpression)
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
      case c.lastAddedTo.get
      of ClassParts.Methods:
        var m = c.getLastMethod().get
        var ret = m.body.last
        assert ret.ttype == "CsReturnStatement"
        cast[CsReturnStatement](ret).expr = r

      else: assert false


    else: assert false, prev.name

    # for method/ctor body: addIfBodyExpr(root, r)
  # =============================================================================
  of "QualifiedName":
    echo "got QualifiedName"
    discard
    # if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: QualifiedName)

  of "IdentifierName":
    echo "got IdentifierName"
    discard
    # if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: IdentifierName)

  of "BaseList": # TODO: Can implement this instead of 2nd essential in class. but not really crucial for now.
    echo "got BaseList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: BaseList)

  of "UsingDirective":
    echo "got UsingDirective"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: UsingDirective)
  of "ExpressionStatement":
    echo "got ExpressionStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ExpressionStatement)
  of "InvocationExpression":
    echo "got InvocationExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: InvocationExpression)
  of "ArgumentList":
    echo "got ArgumentList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ArgumentList)
  of "BinaryExpression":
    echo "got BinaryExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: BinaryExpression)
  of "AssignmentExpression":
    echo "got AssignmentExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AssignmentExpression)
  of "EqualsValueClause":
    echo "got EqualsValueClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: EqualsValueClause)
  of "LocalDeclarationStatement":
    echo "got LocalDeclarationStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: LocalDeclarationStatement)
  of "ObjectCreationExpression":
    echo "got ObjectCreationExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ObjectCreationExpression)
  of "IfStatement":
    echo "got IfStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: IfStatement)
  of "Attribute":
    echo "got Attribute"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: Attribute)
  of "AttributeList":
    echo "got AttributeList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AttributeList)
  of "ThisExpression":
    echo "got ThisExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ThisExpression)
  of "TypeArgumentList":
    echo "got TypeArgumentList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TypeArgumentList)
  of "GenericName":
    echo "got GenericName"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: GenericName)
  of "AttributeArgument":
    echo "got AttributeArgument"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AttributeArgument)
  of "AccessorDeclaration":
    echo "got AccessorDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AccessorDeclaration)
  of "FieldDeclaration":
    echo "got FieldDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: FieldDeclaration)
  of "BracketedArgumentList":
    echo "got BracketedArgumentList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: BracketedArgumentList)
  of "ElementAccessExpression":
    echo "got ElementAccessExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ElementAccessExpression)
  of "PropertyDeclaration":
    echo "got PropertyDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: PropertyDeclaration)
  of "AccessorList":
    echo "got AccessorList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AccessorList)
  of "AttributeArgumentList":
    echo "got AttributeArgumentList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AttributeArgumentList)
  of "ParenthesizedExpression":
    echo "got ParenthesizedExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ParenthesizedExpression)
  of "CastExpression":
    echo "got CastExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CastExpression)
  of "ArrayRankSpecifier":
    echo "got ArrayRankSpecifier"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ArrayRankSpecifier)
  of "ArrayType":
    echo "got ArrayType"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ArrayType)
  of "PrefixUnaryExpression":
    echo "got PrefixUnaryExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: PrefixUnaryExpression)
  of "OmittedArraySizeExpression":
    echo "got OmittedArraySizeExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: OmittedArraySizeExpression)
  of "InitializerExpression":
    echo "got InitializerExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: InitializerExpression)
  of "NameEquals":
    echo "got NameEquals"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: NameEquals)
  of "ThrowStatement":
    echo "got ThrowStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ThrowStatement)
  of "TypeOfExpression":
    echo "got TypeOfExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TypeOfExpression)
  of "ElseClause":
    echo "got ElseClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ElseClause)
  of "CaseSwitchLabel":
    echo "got CaseSwitchLabel"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CaseSwitchLabel)
  of "SimpleBaseType":
    echo "got SimpleBaseType"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: SimpleBaseType)

  of "SwitchSection":
    echo "got SwitchSection"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: SwitchSection)
  of "SimpleLambdaExpression":
    echo "got SimpleLambdaExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: SimpleLambdaExpression)
  of "PostfixUnaryExpression":
    echo "got PostfixUnaryExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: PostfixUnaryExpression)
  of "ArrayCreationExpression":
    echo "got ArrayCreationExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ArrayCreationExpression)
  of "ArrowExpressionClause":
    echo "got ArrowExpressionClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ArrowExpressionClause)
  of "BreakStatement":
    echo "got BreakStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: BreakStatement)
  of "AliasQualifiedName":
    echo "got AliasQualifiedName"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AliasQualifiedName)
  of "TypeParameter":
    echo "got TypeParameter"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TypeParameter)
  of "AwaitExpression":
    echo "got AwaitExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AwaitExpression)
  of "ConditionalExpression":
    echo "got ConditionalExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ConditionalExpression)
  of "AttributeTargetSpecifier":
    echo "got AttributeTargetSpecifier"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AttributeTargetSpecifier)
  of "TypeParameterList":
    echo "got TypeParameterList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TypeParameterList)
  of "ForEachStatement":
    echo "got ForEachStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ForEachStatement)
  of "ForStatement":
    echo "got ForStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ForStatement)
  of "InterpolatedStringText":
    echo "got InterpolatedStringText"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: InterpolatedStringText)
  of "ParenthesizedLambdaExpression":
    echo "got ParenthesizedLambdaExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ParenthesizedLambdaExpression)
  of "TryStatement":
    echo "got TryStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TryStatement)
  of "NullableType":
    echo "got NullableType"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: NullableType)
  of "BaseExpression":
    echo "got BaseExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: BaseExpression)
  of "CatchClause":
    echo "got CatchClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CatchClause)
  of "ConstructorInitializer":
    echo "got ConstructorInitializer"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ConstructorInitializer)
  of "Interpolation":
    echo "got Interpolation"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: Interpolation)
  of "CatchDeclaration":
    echo "got CatchDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CatchDeclaration)
  of "NameColon":
    echo "got NameColon"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: NameColon)
  of "UsingStatement":
    echo "got UsingStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: UsingStatement)
  of "TypeParameterConstraintClause":
    echo "got TypeParameterConstraintClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TypeParameterConstraintClause)
  of "TypeConstraint":
    echo "got TypeConstraint"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TypeConstraint)
  of "SingleVariableDesignation":
    echo "got SingleVariableDesignation"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: SingleVariableDesignation)
  of "InterpolatedStringExpression":
    echo "got InterpolatedStringExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: InterpolatedStringExpression)
  of "ImplicitArrayCreationExpression":
    echo "got ImplicitArrayCreationExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ImplicitArrayCreationExpression)
  of "WhileStatement":
    echo "got WhileStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: WhileStatement)
  of "DeclarationExpression":
    echo "got DeclarationExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DeclarationExpression)
  of "ExplicitInterfaceSpecifier":
    echo "got ExplicitInterfaceSpecifier"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ExplicitInterfaceSpecifier)
  of "ConditionalAccessExpression":
    echo "got ConditionalAccessExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ConditionalAccessExpression)
  of "SwitchStatement":
    echo "got SwitchStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: SwitchStatement)
  of "MemberBindingExpression":
    echo "got MemberBindingExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: MemberBindingExpression)
  of "DefaultExpression":
    echo "got DefaultExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DefaultExpression)
  of "PointerType":
    echo "got PointerType"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: PointerType)
  of "InterfaceDeclaration":
    echo "got InterfaceDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: InterfaceDeclaration)
  of "ContinueStatement":
    echo "got ContinueStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ContinueStatement)
  of "FinallyClause":
    echo "got FinallyClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: FinallyClause)
  of "DefaultSwitchLabel":
    echo "got DefaultSwitchLabel"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DefaultSwitchLabel)
  of "YieldStatement":
    echo "got YieldStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: YieldStatement)
  of "AnonymousObjectMemberDeclarator":
    echo "got AnonymousObjectMemberDeclarator"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AnonymousObjectMemberDeclarator)
  of "CheckedExpression":
    echo "got CheckedExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CheckedExpression)
  of "StructDeclaration":
    echo "got StructDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: StructDeclaration)
  of "IsPatternExpression":
    echo "got IsPatternExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: IsPatternExpression)
  of "LockStatement":
    echo "got LockStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: LockStatement)
  of "DeclarationPattern":
    echo "got DeclarationPattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DeclarationPattern)
  of "ThrowExpression":
    echo "got ThrowExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ThrowExpression)
  of "ConstantPattern":
    echo "got ConstantPattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ConstantPattern)
  of "RefType":
    echo "got RefType"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: RefType)
  of "RefExpression":
    echo "got RefExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: RefExpression)
  of "ClassOrStructConstraint":
    echo "got ClassOrStructConstraint"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ClassOrStructConstraint)
  of "OmittedTypeArgument":
    echo "got OmittedTypeArgument"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: OmittedTypeArgument)
  of "TupleElement":
    echo "got TupleElement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TupleElement)
  of "OperatorDeclaration":
    echo "got OperatorDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: OperatorDeclaration)
  of "EventFieldDeclaration":
    echo "got EventFieldDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: EventFieldDeclaration)
  of "DelegateDeclaration":
    echo "got DelegateDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DelegateDeclaration)
  of "ImplicitElementAccess":
    echo "got ImplicitElementAccess"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ImplicitElementAccess)
  of "AnonymousMethodExpression":
    echo "got AnonymousMethodExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AnonymousMethodExpression)
  of "TupleExpression":
    echo "got TupleExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TupleExpression)
  of "AnonymousObjectCreationExpression":
    echo "got AnonymousObjectCreationExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: AnonymousObjectCreationExpression)
  of "BracketedParameterList":
    echo "got BracketedParameterList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: BracketedParameterList)
  of "EventDeclaration":
    echo "got EventDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: EventDeclaration)
  of "GotoStatement":
    echo "got GotoStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: GotoStatement)
  of "DoStatement":
    echo "got DoStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DoStatement)
  of "GlobalStatement":
    echo "got GlobalStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: GlobalStatement)
  of "IncompleteMember":
    echo "got IncompleteMember"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: IncompleteMember)
  of "LocalFunctionStatement":
    echo "got LocalFunctionStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: LocalFunctionStatement)
  of "ConversionOperatorDeclaration":
    echo "got ConversionOperatorDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ConversionOperatorDeclaration)
  of "TupleType":
    echo "got TupleType"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TupleType)
  of "FixedStatement":
    echo "got FixedStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: FixedStatement)
  of "EmptyStatement":
    echo "got EmptyStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: EmptyStatement)
  of "FromClause":
    echo "got FromClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: FromClause)
  of "SizeOfExpression":
    echo "got SizeOfExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: SizeOfExpression)
  of "QueryBody":
    echo "got QueryBody"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: QueryBody)
  of "CheckedStatement":
    echo "got CheckedStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CheckedStatement)
  of "QueryExpression":
    echo "got QueryExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: QueryExpression)
  of "SelectClause":
    echo "got SelectClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: SelectClause)
  of "CasePatternSwitchLabel":
    echo "got CasePatternSwitchLabel"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CasePatternSwitchLabel)
  of "LabeledStatement":
    echo "got LabeledStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: LabeledStatement)
  of "WhereClause":
    echo "got WhereClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: WhereClause)
  of "ConstructorConstraint":
    echo "got ConstructorConstraint"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ConstructorConstraint)
  of "UnsafeStatement":
    echo "got UnsafeStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: UnsafeStatement)
  of "ParenthesizedVariableDesignation":
    echo "got ParenthesizedVariableDesignation"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ParenthesizedVariableDesignation)
  of "InterpolationFormatClause":
    echo "got InterpolationFormatClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: InterpolationFormatClause)
  of "DestructorDeclaration":
    echo "got DestructorDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DestructorDeclaration)
  of "DiscardDesignation":
    echo "got DiscardDesignation"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DiscardDesignation)
  of "StackAllocArrayCreationExpression":
    echo "got StackAllocArrayCreationExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: StackAllocArrayCreationExpression)
  of "WhenClause":
    echo "got WhenClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: WhenClause)
  of "ForEachVariableStatement":
    echo "got ForEachVariableStatement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ForEachVariableStatement)
  of "LetClause":
    echo "got LetClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: LetClause)
  of "ElementBindingExpression":
    echo "got ElementBindingExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ElementBindingExpression)
  of "CatchFilterClause":
    echo "got CatchFilterClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CatchFilterClause)
  of "Ordering":
    echo "got Ordering"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: Ordering)
  of "OrderByClause":
    echo "got OrderByClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: OrderByClause)
  of "JoinClause":
    echo "got JoinClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: JoinClause)
  of "GroupClause":
    echo "got GroupClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: GroupClause)
  of "InterpolationAlignmentClause":
    echo "got InterpolationAlignmentClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: InterpolationAlignmentClause)
  of "QueryContinuation":
    echo "got QueryContinuation"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: QueryContinuation)
  of "ExternAliasDirective":
    echo "got ExternAliasDirective"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ExternAliasDirective)
  of "MakeRefExpression":
    echo "got MakeRefExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: MakeRefExpression)
  of "JoinIntoClause":
    echo "got JoinIntoClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: JoinIntoClause)
  of "RefValueExpression":
    echo "got RefValueExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: RefValueExpression)
  of "RefTypeExpression":
    echo "got RefTypeExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: RefTypeExpression)
  of "Block":
    echo "got Block"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: Block)
  of "VariableDeclaration":
    echo "got VariableDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: VariableDeclaration)
  of "BadDirectiveTrivia":
    echo "got BadDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: BadDirectiveTrivia)
  of "BinaryPattern":
    echo "got BinaryPattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: BinaryPattern)
  of "ConversionOperatorMemberCref":
    echo "got ConversionOperatorMemberCref"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ConversionOperatorMemberCref)
  of "CrefBracketedParameterList":
    echo "got CrefBracketedParameterList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CrefBracketedParameterList)
  of "CrefParameter":
    echo "got CrefParameter"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CrefParameter)
  of "CrefParameterList":
    echo "got CrefParameterList"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: CrefParameterList)
  of "DefineDirectiveTrivia":
    echo "got DefineDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DefineDirectiveTrivia)
  of "DiscardPattern":
    echo "got DiscardPattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DiscardPattern)
  of "DocumentationCommentTrivia":
    echo "got DocumentationCommentTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: DocumentationCommentTrivia)
  of "ElifDirectiveTrivia":
    echo "got ElifDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ElifDirectiveTrivia)
  of "ElseDirectiveTrivia":
    echo "got ElseDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ElseDirectiveTrivia)
  of "EndIfDirectiveTrivia":
    echo "got EndIfDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: EndIfDirectiveTrivia)
  of "EndRegionDirectiveTrivia":
    echo "got EndRegionDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: EndRegionDirectiveTrivia)
  of "ErrorDirectiveTrivia":
    echo "got ErrorDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ErrorDirectiveTrivia)
  of "FunctionPointerType":
    echo "got FunctionPointerType"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: FunctionPointerType)

  of "ImplicitObjectCreationExpression":
    echo "got ImplicitObjectCreationExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ImplicitObjectCreationExpression)
  of "MemberAccessExpression":
    echo "got MemberAccessExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: MemberAccessExpression)
  of "NullableDirectiveTrivia":
    echo "got NullableDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: NullableDirectiveTrivia)
  of "ParenthesizedPattern":
    echo "got ParenthesizedPattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ParenthesizedPattern)
  of "PositionalPatternClause":
    echo "got PositionalPatternClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: PositionalPatternClause)
  of "PrimaryConstructorBaseType":
    echo "got PrimaryConstructorBaseType"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: PrimaryConstructorBaseType)
  of "PropertyPatternClause":
    echo "got PropertyPatternClause"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: PropertyPatternClause)
  of "RangeExpression":
    echo "got RangeExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: RangeExpression)
  of "RecordDeclaration":
    echo "got RecordDeclaration"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: RecordDeclaration)
  of "RecursivePattern":
    echo "got RecursivePattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: RecursivePattern)
  of "RegionDirectiveTrivia":
    echo "got RegionDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: RegionDirectiveTrivia)
  of "RelationalPattern":
    echo "got RelationalPattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: RelationalPattern)
  of "Subpattern":
    echo "got Subpattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: Subpattern)
  of "SwitchExpression":
    echo "got SwitchExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: SwitchExpression)
  of "SwitchExpressionArm":
    echo "got SwitchExpressionArm"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: SwitchExpressionArm)
  of "TypePattern":
    echo "got TypePattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TypePattern)
  of "UnaryPattern":
    echo "got UnaryPattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: UnaryPattern)
  of "VariableDeclarator":
    echo "got VariableDeclarator"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: VariableDeclarator)
  of "VarPattern":
    echo "got VarPattern"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: VarPattern)
  of "WithExpression":
    echo "got WithExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: WithExpression)
  of "XmlCDataSection":
    echo "got XmlCDataSection"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlCDataSection)
  of "XmlComment":
    echo "got XmlComment"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlComment)
  of "XmlCrefAttribute":
    echo "got XmlCrefAttribute"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlCrefAttribute)
  of "XmlElement":
    echo "got XmlElement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlElement)
  of "XmlElementEndTag":
    echo "got XmlElementEndTag"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlElementEndTag)
  of "XmlElementStartTag":
    echo "got XmlElementStartTag"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlElementStartTag)
  of "XmlEmptyElement":
    echo "got XmlEmptyElement"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlEmptyElement)
  of "XmlName":
    echo "got XmlName"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlName)
  of "XmlNameAttribute":
    echo "got XmlNameAttribute"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlNameAttribute)
  of "XmlPrefix":
    echo "got XmlPrefix"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlPrefix)
  of "XmlProcessingInstruction":
    echo "got XmlProcessingInstruction"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlProcessingInstruction)
  of "XmlText":
    echo "got XmlText"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlText)
  of "XmlTextAttribute":
    echo "got XmlTextAttribute"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: XmlTextAttribute)
  of "IfDirectiveTrivia":
    echo "got IfDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: IfDirectiveTrivia)
  of "ImplicitStackAllocArrayCreationExpression":
    echo "got ImplicitStackAllocArrayCreationExpression"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ImplicitStackAllocArrayCreationExpression)
  of "IndexerMemberCref":
    echo "got IndexerMemberCref"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: IndexerMemberCref)
  of "LineDirectiveTrivia":
    echo "got LineDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: LineDirectiveTrivia)
  of "LoadDirectiveTrivia":
    echo "got LoadDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: LoadDirectiveTrivia)
  of "NameMemberCref":
    echo "got NameMemberCref"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: NameMemberCref)
  of "OperatorMemberCref":
    echo "got OperatorMemberCref"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: OperatorMemberCref)
  of "PragmaChecksumDirectiveTrivia":
    echo "got PragmaChecksumDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: PragmaChecksumDirectiveTrivia)
  of "PragmaWarningDirectiveTrivia":
    echo "got PragmaWarningDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: PragmaWarningDirectiveTrivia)
  of "QualifiedCref":
    echo "got QualifiedCref"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: QualifiedCref)
  of "ReferenceDirectiveTrivia":
    echo "got ReferenceDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ReferenceDirectiveTrivia)
  of "ShebangDirectiveTrivia":
    echo "got ShebangDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: ShebangDirectiveTrivia)
  of "SkippedTokensTrivia":
    echo "got SkippedTokensTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: SkippedTokensTrivia)
  of "TypeCref":
    echo "got TypeCref"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: TypeCref)
  of "UndefDirectiveTrivia":
    echo "got UndefDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: UndefDirectiveTrivia)
  of "WarningDirectiveTrivia":
    echo "got WarningDirectiveTrivia"
    if debugWantSomeWork: assert false, "implement me plz" #TODO(handle: WarningDirectiveTrivia)



  else:
    raise newException(Exception, "unsupported! Please add to the switch case above: `" &
        info.declName & "`")

