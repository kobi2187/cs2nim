import constructs/cs_all_constructs
import state_utils, state, types
import strutils, stacks, options, sets, uuids
const urgent = true

var gotStartBlock = false

var debugWantSomeWork = true
# var debugWantSomeWork = true

import constructs/cs_root
proc getLastEnumMember(root: CsRoot): CsEnumMember =
  let (_, ns) = getCurrentNs(root)
  var e = ns.enums.last
  result = e.items.last



proc addToLastMethodOrCtor(root: CsRoot, p: CsParameterList) =
  echo root
  let (_, b) = root.getCurrentNs()
  echo b

  var c = getLastClass(root).get

  assert c.lastAddedTo.issome and c.lastAddedTo.get in [ClassParts.Methods,
      ClassParts.Ctors]
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
  assert c.lastAddedTo.issome and c.lastAddedTo.get in [ClassParts.Methods,
      ClassParts.Ctors]
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


proc addToRoot*(root: var CsRoot; src: string; info: Info, id: UUID) =
  when false:
    echo "blocks info:"
    echo "============"
    echo "last construct: " & $currentConstruct.last
    echo "previous construct: " & $previousConstruct()
    echo $currentPath()
  when true:
    if src.strip().len > 0: echo "C# source code was: " & src
  when true:
    if root.ns.len > 0:
      let lb = currentPath().last.name
      echo "last block was " & lb
      echo root.lastAddedInfo


  if gotStartBlock and info.declName != "VisitBlock": # previous was a start block, but could it belong to VisitBlock?
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
    discard

  of "BlockStarts":
    if not info.isVisitBlock:
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
      else: echo "here1"
    else: echo "here2"
    root.add(newns)

  of "ClassDeclaration":
    let c = extract(CsClass, info)
    var (p, ns) = getcurrentNs(root)
    # echo "nsPath is: " & p
    c.nsParent = p
    ns.add(c)

  of "ArgumentList":
    echo "got ArgumentList"
    let arglist = extract(CsArgumentList, info)
    # now add to last method.
    let c = root.getLastClass().get
    let m = c.getLastMethod().get
    var es = m.body.last
    echo es.ttype
    case es.ttype
    of "CsExpressionStatement":
      CsExpressionStatement(es).args = arglist
    of "CsObjectCreationExpression":
      CsObjectCreationExpression(es).args = arglist
    else:
      assert false, "got " & es.ttype



  of "FieldDeclaration": #BLOCKS
    echo "got FieldDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: FieldDeclaration" #TODO

  of "ObjectCreationExpression":
    echo "got ObjectCreationExpression"
    echo info
    let obj = extract(CsObjectCreationExpression, info)
    # root.add obj # maybe this way will be easier to fathom, root passes those down, to where it belongs. !! a way of refactoring this file's mess.
    # are we in class or method? ask blocks
    let lb = previousConstruct().name
    echo currentPath()
    echo lb
    case lb
    # of "MethodDeclaration":
    #   # get last method
    #   var m = root.getLastClass.get.getLastMethod()
    #   assert m.isSome
    #   m.get.add(obj)
    of "ReturnStatement": assert false
      # get last return. where did it come from?
      # ideally:
      # let r = root.returnlist.last
      # r.add(obj)
      # let whobefore = prevprevConstruct().name
      # case whobefore
      # of "MethodDeclaration":
      #   # get last method
      #   var m = root.getLastClass.get.getLastMethod()
      #   assert m.isSome
      #   m.get.add(obj)
      # else: assert false, whobefore
    else:
      assert false, "last block was " & lb

  of "UsingDirective":
    echo "got UsingDirective"
    var (p, ns) = getcurrentNs(root)
    let use = extract(CsUsingDirective, info)
    ns.add(use)

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
    echo info
    let indexer = extract(CsIndexer, info)
    var (name, ns) = root.getCurrentNs()
    assert ns.lastAddedTo.isSome
    case ns.lastAddedTo.get
    of NamespaceParts.Classes:
      var cls = root.getLastClass()
      assert cls.isSome
      cls.get.add(indexer)
    else: assert false, "Not yet implemented"

  of "PredefinedType":
    echo "in PredefinedType!!"
    let t = extract(typedesc(CsPredefinedType), info)
    var prev = previousConstruct().name
    echo "previous construct was: " & prev
    case prev
    of "MethodDeclaration":
      var m = getLastClass(root).get.getLastMethod()
      assert m.isSome
      add(m.get, t)
    of "PropertyDeclaration":
      var prop = root.getLastProperty()
      assert prop.issome()
      add(prop.get, t)

    of "IndexerDeclaration":
      echo info
      var indexer = root.getLastIndexer()
      assert indexer.isSome
      add(indexer.get, t)

    of "Parameter": discard
    of "IdentifierName": discard
    else:
      assert false, prev
  of "ParameterList":
    echo "! in parameter list!"
    let p = extract(typedesc(CsParameterList), info)
    addToLastMethodOrCtor(root, p)



    # var prev = previousConstruct()

  of "Parameter":
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
    of ClassParts.Indexer:
      var idxr = c.indexer
      add(idxr, p)


    else: assert false, "not implemented " & $c.lastAddedTo.get
  of "Argument":
    echo info
    # assert false
  of "ConstructorDeclaration":
    echo "got ConstructorDeclaration"
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
    of "Argument": discard # assert false
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
    discard

  of "IdentifierName":
    discard

  of "SimpleBaseType":
    when not urgent:
      echo "got SimpleBaseType"
      if debugWantSomeWork:
        assert false, "Unimplemented: SimpleBaseType" #TODO
    discard

  of "BaseList": # TODO: Can implement this instead of 2nd essential in class. but not really crucial for now.
    when not urgent:
      echo "got BaseList"
      if debugWantSomeWork:
        assert false, "Unimplemented: BaseList" #TODO
    discard

  of "PropertyDeclaration":
    echo "got PropertyDeclaration"
    # TODO FOR NOW
    echo info
    let csp = extract(CsProperty, info)
    var (_, ns) = getCurrentNs(root)
    case ns.lastAddedTo.get
      of Interfaces:
        discard # TODO
        # let iface = ns.getLastInterface()
        # iface.add(csp)
      of Classes:
        var cls = ns.getLastClass().get
        cls.add(csp)
      of [NamespaceParts.Enums]: discard

  # ######## NOW IMPLEMENTING: #########
  of "ExplicitInterfaceSpecifier":
    echo "got ExplicitInterfaceSpecifier"
    echo info
    let exp = extract(CsExplicitInterfaceSpecifier, info)

    let a = prevprevConstruct().name
    case a
    of "IndexerDeclaration":
      var idxr = root.getLastIndexer().get
      idxr.add(exp)

  of "ExpressionStatement":
    echo "got ExpressionStatement"
    let es = extract(CsExpressionStatement, info)
    root.addIfBodyExpr(es)
    # add empty MethodBodyLine : BodyExpr to last method.
    # then fill it with invocationExpression and ArgumentList
    # gen is a method then.
  of "InvocationExpression":
    echo "got InvocationExpression"
    # when we get this, extract and
    let ie = extract(CsInvocationExpression, info)
    # now add to last method.
    let c = root.getLastClass()
    assert c.isSome

    let m = c.get.getLastMethod()
    assert m.isSome

    var es = m.get.body.last
    assert es.ttype == "CsExpressionStatement"
    cast[CsExpressionStatement](es).call = ie

  of "BinaryExpression":
    echo "got BinaryExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: BinaryExpression" #TODO
  of "AssignmentExpression":
    echo "got AssignmentExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: AssignmentExpression" #TODO
  of "EqualsValueClause":
    echo "got EqualsValueClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: EqualsValueClause" #TODO
  of "LocalDeclarationStatement":
    echo "got LocalDeclarationStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: LocalDeclarationStatement" #TODO

  of "IfStatement":
    echo "got IfStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: IfStatement" #TODO


  of "ThisExpression":
    echo "got ThisExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ThisExpression" #TODO
  of "TypeArgumentList":
    echo "got TypeArgumentList"
    if debugWantSomeWork:
      assert false, "Unimplemented: TypeArgumentList" #TODO
  of "GenericName":
    echo "got GenericName"
    if debugWantSomeWork:
      assert false, "Unimplemented: GenericName" #TODO
  of "AccessorDeclaration":
    echo "got AccessorDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: AccessorDeclaration" #TODO

  of "BracketedArgumentList":
    echo "got BracketedArgumentList"
    if debugWantSomeWork:
      assert false, "Unimplemented: BracketedArgumentList" #TODO
  of "ElementAccessExpression":
    echo "got ElementAccessExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ElementAccessExpression" #TODO

  of "AccessorList":
    echo "got AccessorList"
    if debugWantSomeWork:
      assert false, "Unimplemented: AccessorList" #TODO


  of "ParenthesizedExpression":
    echo "got ParenthesizedExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ParenthesizedExpression" #TODO
  of "CastExpression":
    echo "got CastExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: CastExpression" #TODO
  of "ArrayRankSpecifier":
    echo "got ArrayRankSpecifier"
    if debugWantSomeWork:
      assert false, "Unimplemented: ArrayRankSpecifier" #TODO
  of "ArrayType":
    echo "got ArrayType"
    if debugWantSomeWork:
      assert false, "Unimplemented: ArrayType" #TODO
  of "PrefixUnaryExpression":
    echo "got PrefixUnaryExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: PrefixUnaryExpression" #TODO
  of "OmittedArraySizeExpression":
    echo "got OmittedArraySizeExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: OmittedArraySizeExpression" #TODO
  of "InitializerExpression":
    echo "got InitializerExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: InitializerExpression" #TODO
  of "NameEquals":
    echo "got NameEquals"
    if debugWantSomeWork:
      assert false, "Unimplemented: NameEquals" #TODO
  of "ThrowStatement":
    echo "got ThrowStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: ThrowStatement" #TODO
  of "TypeOfExpression":
    echo "got TypeOfExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: TypeOfExpression" #TODO
  of "ElseClause":
    echo "got ElseClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: ElseClause" #TODO
  of "CaseSwitchLabel":
    echo "got CaseSwitchLabel"
    if debugWantSomeWork:
      assert false, "Unimplemented: CaseSwitchLabel" #TODO

  of "SwitchSection":
    echo "got SwitchSection"
    if debugWantSomeWork:
      assert false, "Unimplemented: SwitchSection" #TODO
  of "SimpleLambdaExpression":
    echo "got SimpleLambdaExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: SimpleLambdaExpression" #TODO
  of "PostfixUnaryExpression":
    echo "got PostfixUnaryExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: PostfixUnaryExpression" #TODO
  of "ArrayCreationExpression":
    echo "got ArrayCreationExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ArrayCreationExpression" #TODO
  of "ArrowExpressionClause":
    echo "got ArrowExpressionClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: ArrowExpressionClause" #TODO
  of "BreakStatement":
    echo "got BreakStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: BreakStatement" #TODO
  of "AliasQualifiedName":
    echo "got AliasQualifiedName"
    if debugWantSomeWork:
      assert false, "Unimplemented: AliasQualifiedName" #TODO
  of "TypeParameter":
    echo "got TypeParameter"
    if debugWantSomeWork:
      assert false, "Unimplemented: TypeParameter" #TODO
  of "AwaitExpression":
    echo "got AwaitExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: AwaitExpression" #TODO
  of "ConditionalExpression":
    echo "got ConditionalExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ConditionalExpression" #TODO

  of "TypeParameterList":
    echo "got TypeParameterList"
    if debugWantSomeWork:
      assert false, "Unimplemented: TypeParameterList" #TODO
  of "ForEachStatement":
    echo "got ForEachStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: ForEachStatement" #TODO
  of "ForStatement":
    echo "got ForStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: ForStatement" #TODO
  of "InterpolatedStringText":
    echo "got InterpolatedStringText"
    if debugWantSomeWork:
      assert false, "Unimplemented: InterpolatedStringText" #TODO
  of "ParenthesizedLambdaExpression":
    echo "got ParenthesizedLambdaExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ParenthesizedLambdaExpression" #TODO
  of "TryStatement":
    echo "got TryStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: TryStatement" #TODO
  of "NullableType":
    echo "got NullableType"
    if debugWantSomeWork:
      assert false, "Unimplemented: NullableType" #TODO
  of "BaseExpression":
    echo "got BaseExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: BaseExpression" #TODO
  of "CatchClause":
    echo "got CatchClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: CatchClause" #TODO
  of "ConstructorInitializer":
    echo "got ConstructorInitializer"
    if debugWantSomeWork:
      assert false, "Unimplemented: ConstructorInitializer" #TODO
  of "Interpolation":
    echo "got Interpolation"
    if debugWantSomeWork:
      assert false, "Unimplemented: Interpolation" #TODO
  of "CatchDeclaration":
    echo "got CatchDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: CatchDeclaration" #TODO
  of "NameColon":
    echo "got NameColon"
    if debugWantSomeWork:
      assert false, "Unimplemented: NameColon" #TODO
  of "UsingStatement":
    echo "got UsingStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: UsingStatement" #TODO
  of "TypeParameterConstraintClause":
    echo "got TypeParameterConstraintClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: TypeParameterConstraintClause" #TODO
  of "TypeConstraint":
    echo "got TypeConstraint"
    if debugWantSomeWork:
      assert false, "Unimplemented: TypeConstraint" #TODO
  of "SingleVariableDesignation":
    echo "got SingleVariableDesignation"
    if debugWantSomeWork:
      assert false, "Unimplemented: SingleVariableDesignation" #TODO
  of "InterpolatedStringExpression":
    echo "got InterpolatedStringExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: InterpolatedStringExpression" #TODO
  of "ImplicitArrayCreationExpression":
    echo "got ImplicitArrayCreationExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ImplicitArrayCreationExpression" #TODO
  of "WhileStatement":
    echo "got WhileStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: WhileStatement" #TODO
  of "DeclarationExpression":
    echo "got DeclarationExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: DeclarationExpression" #TODO

  of "ConditionalAccessExpression":
    echo "got ConditionalAccessExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ConditionalAccessExpression" #TODO
  of "SwitchStatement":
    echo "got SwitchStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: SwitchStatement" #TODO
  of "MemberBindingExpression":
    echo "got MemberBindingExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: MemberBindingExpression" #TODO
  of "DefaultExpression":
    echo "got DefaultExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: DefaultExpression" #TODO
  of "PointerType":
    echo "got PointerType"
    if debugWantSomeWork:
      assert false, "Unimplemented: PointerType" #TODO
  of "InterfaceDeclaration":
    echo "got InterfaceDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: InterfaceDeclaration" #TODO
  of "ContinueStatement":
    echo "got ContinueStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: ContinueStatement" #TODO
  of "FinallyClause":
    echo "got FinallyClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: FinallyClause" #TODO
  of "DefaultSwitchLabel":
    echo "got DefaultSwitchLabel"
    if debugWantSomeWork:
      assert false, "Unimplemented: DefaultSwitchLabel" #TODO
  of "YieldStatement":
    echo "got YieldStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: YieldStatement" #TODO
  of "AnonymousObjectMemberDeclarator":
    echo "got AnonymousObjectMemberDeclarator"
    if debugWantSomeWork:
      assert false, "Unimplemented: AnonymousObjectMemberDeclarator" #TODO
  of "CheckedExpression":
    echo "got CheckedExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: CheckedExpression" #TODO
  of "StructDeclaration":
    echo "got StructDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: StructDeclaration" #TODO
  of "IsPatternExpression":
    echo "got IsPatternExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: IsPatternExpression" #TODO
  of "LockStatement":
    echo "got LockStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: LockStatement" #TODO
  of "DeclarationPattern":
    echo "got DeclarationPattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: DeclarationPattern" #TODO
  of "ThrowExpression":
    echo "got ThrowExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ThrowExpression" #TODO
  of "ConstantPattern":
    echo "got ConstantPattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: ConstantPattern" #TODO
  of "RefType":
    echo "got RefType"
    if debugWantSomeWork:
      assert false, "Unimplemented: RefType" #TODO
  of "RefExpression":
    echo "got RefExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: RefExpression" #TODO
  of "ClassOrStructConstraint":
    echo "got ClassOrStructConstraint"
    if debugWantSomeWork:
      assert false, "Unimplemented: ClassOrStructConstraint" #TODO
  of "OmittedTypeArgument":
    echo "got OmittedTypeArgument"
    if debugWantSomeWork:
      assert false, "Unimplemented: OmittedTypeArgument" #TODO
  of "TupleElement":
    echo "got TupleElement"
    if debugWantSomeWork:
      assert false, "Unimplemented: TupleElement" #TODO
  of "OperatorDeclaration":
    echo "got OperatorDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: OperatorDeclaration" #TODO
  of "EventFieldDeclaration":
    echo "got EventFieldDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: EventFieldDeclaration" #TODO
  of "DelegateDeclaration":
    echo "got DelegateDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: DelegateDeclaration" #TODO
  of "ImplicitElementAccess":
    echo "got ImplicitElementAccess"
    if debugWantSomeWork:
      assert false, "Unimplemented: ImplicitElementAccess" #TODO
  of "AnonymousMethodExpression":
    echo "got AnonymousMethodExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: AnonymousMethodExpression" #TODO
  of "TupleExpression":
    echo "got TupleExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: TupleExpression" #TODO
  of "AnonymousObjectCreationExpression":
    echo "got AnonymousObjectCreationExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: AnonymousObjectCreationExpression" #TODO
  of "BracketedParameterList":
    echo "got BracketedParameterList"
    if debugWantSomeWork:
      assert false, "Unimplemented: BracketedParameterList" #TODO
  of "EventDeclaration":
    echo "got EventDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: EventDeclaration" #TODO
  of "GotoStatement":
    echo "got GotoStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: GotoStatement" #TODO
  of "DoStatement":
    echo "got DoStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: DoStatement" #TODO
  of "GlobalStatement":
    echo "got GlobalStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: GlobalStatement" #TODO
  of "IncompleteMember":
    echo "got IncompleteMember"
    if debugWantSomeWork:
      assert false, "Unimplemented: IncompleteMember" #TODO
  of "LocalFunctionStatement":
    echo "got LocalFunctionStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: LocalFunctionStatement" #TODO
  of "ConversionOperatorDeclaration":
    echo "got ConversionOperatorDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: ConversionOperatorDeclaration" #TODO
  of "TupleType":
    echo "got TupleType"
    if debugWantSomeWork:
      assert false, "Unimplemented: TupleType" #TODO
  of "FixedStatement":
    echo "got FixedStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: FixedStatement" #TODO
  of "EmptyStatement":
    echo "got EmptyStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: EmptyStatement" #TODO


  of "SizeOfExpression":
    echo "got SizeOfExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: SizeOfExpression" #TODO
  of "QueryBody":
    echo "got QueryBody"
    if debugWantSomeWork:
      assert false, "Unimplemented: QueryBody" #TODO
  of "CheckedStatement":
    echo "got CheckedStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: CheckedStatement" #TODO
  of "QueryExpression":
    echo "got QueryExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: QueryExpression" #TODO

  of "CasePatternSwitchLabel":
    echo "got CasePatternSwitchLabel"
    if debugWantSomeWork:
      assert false, "Unimplemented: CasePatternSwitchLabel" #TODO
  of "LabeledStatement":
    echo "got LabeledStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: LabeledStatement" #TODO

  of "ConstructorConstraint":
    echo "got ConstructorConstraint"
    if debugWantSomeWork:
      assert false, "Unimplemented: ConstructorConstraint" #TODO
  of "UnsafeStatement":
    echo "got UnsafeStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: UnsafeStatement" #TODO
  of "ParenthesizedVariableDesignation":
    echo "got ParenthesizedVariableDesignation"
    if debugWantSomeWork:
      assert false, "Unimplemented: ParenthesizedVariableDesignation" #TODO
  of "InterpolationFormatClause":
    echo "got InterpolationFormatClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: InterpolationFormatClause" #TODO
  of "DestructorDeclaration":
    echo "got DestructorDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: DestructorDeclaration" #TODO
  of "DiscardDesignation":
    echo "got DiscardDesignation"
    if debugWantSomeWork:
      assert false, "Unimplemented: DiscardDesignation" #TODO
  of "StackAllocArrayCreationExpression":
    echo "got StackAllocArrayCreationExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: StackAllocArrayCreationExpression" #TODO
  of "WhenClause":
    echo "got WhenClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: WhenClause" #TODO
  of "ForEachVariableStatement":
    echo "got ForEachVariableStatement"
    if debugWantSomeWork:
      assert false, "Unimplemented: ForEachVariableStatement" #TODO
  of "LetClause":
    echo "got LetClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: LetClause" #TODO
  of "ElementBindingExpression":
    echo "got ElementBindingExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ElementBindingExpression" #TODO
  of "CatchFilterClause":
    echo "got CatchFilterClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: CatchFilterClause" #TODO
  of "Ordering":
    echo "got Ordering"
    if debugWantSomeWork:
      assert false, "Unimplemented: Ordering" #TODO

  of "InterpolationAlignmentClause":
    echo "got InterpolationAlignmentClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: InterpolationAlignmentClause" #TODO
  of "QueryContinuation":
    echo "got QueryContinuation"
    if debugWantSomeWork:
      assert false, "Unimplemented: QueryContinuation" #TODO
  of "ExternAliasDirective":
    echo "got ExternAliasDirective"
    if debugWantSomeWork:
      assert false, "Unimplemented: ExternAliasDirective" #TODO
  of "MakeRefExpression":
    echo "got MakeRefExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: MakeRefExpression" #TODO

  of "RefValueExpression":
    echo "got RefValueExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: RefValueExpression" #TODO
  of "RefTypeExpression":
    echo "got RefTypeExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: RefTypeExpression" #TODO
  of "Block":
    echo "got Block"
    if debugWantSomeWork:
      assert false, "Unimplemented: Block" #TODO
  of "VariableDeclaration":
    echo "got VariableDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: VariableDeclaration" #TODO
  of "BinaryPattern":
    echo "got BinaryPattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: BinaryPattern" #TODO
  of "DiscardPattern":
    echo "got DiscardPattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: DiscardPattern" #TODO
  of "FunctionPointerType":
    echo "got FunctionPointerType"
    if debugWantSomeWork:
      assert false, "Unimplemented: FunctionPointerType" #TODO

  of "ImplicitObjectCreationExpression":
    echo "got ImplicitObjectCreationExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ImplicitObjectCreationExpression" #TODO
  of "MemberAccessExpression":
    echo "got MemberAccessExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: MemberAccessExpression" #TODO
  of "ParenthesizedPattern":
    echo "got ParenthesizedPattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: ParenthesizedPattern" #TODO
  of "PositionalPatternClause":
    echo "got PositionalPatternClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: PositionalPatternClause" #TODO
  of "PrimaryConstructorBaseType":
    echo "got PrimaryConstructorBaseType"
    if debugWantSomeWork:
      assert false, "Unimplemented: PrimaryConstructorBaseType" #TODO
  of "PropertyPatternClause":
    echo "got PropertyPatternClause"
    if debugWantSomeWork:
      assert false, "Unimplemented: PropertyPatternClause" #TODO
  of "RangeExpression":
    echo "got RangeExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: RangeExpression" #TODO
  of "RecordDeclaration":
    echo "got RecordDeclaration"
    if debugWantSomeWork:
      assert false, "Unimplemented: RecordDeclaration" #TODO
  of "RecursivePattern":
    echo "got RecursivePattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: RecursivePattern" #TODO
  of "RelationalPattern":
    echo "got RelationalPattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: RelationalPattern" #TODO
  of "Subpattern":
    echo "got Subpattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: Subpattern" #TODO
  of "SwitchExpression":
    echo "got SwitchExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: SwitchExpression" #TODO
  of "SwitchExpressionArm":
    echo "got SwitchExpressionArm"
    if debugWantSomeWork:
      assert false, "Unimplemented: SwitchExpressionArm" #TODO
  of "TypePattern":
    echo "got TypePattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: TypePattern" #TODO
  of "UnaryPattern":
    echo "got UnaryPattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: UnaryPattern" #TODO
  of "VariableDeclarator":
    echo "got VariableDeclarator"
    if debugWantSomeWork:
      assert false, "Unimplemented: VariableDeclarator" #TODO
  of "VarPattern":
    echo "got VarPattern"
    if debugWantSomeWork:
      assert false, "Unimplemented: VarPattern" #TODO
  of "WithExpression":
    echo "got WithExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: WithExpression" #TODO

  of "ImplicitStackAllocArrayCreationExpression":
    echo "got ImplicitStackAllocArrayCreationExpression"
    if debugWantSomeWork:
      assert false, "Unimplemented: ImplicitStackAllocArrayCreationExpression" #TODO


  
  # ## unsupported by choice, or implement last.  
  # not interested in supporting attributes
  of["AttributeTargetSpecifier", "Attribute", "AttributeList",
      "AttributeArgument", "AttributeArgumentList"]:
    discard
  # not interested in supporting xml attributes comments etc.
  of ["XmlCDataSection", "XmlComment", "XmlCrefAttribute", "XmlElement",
      "XmlElementEndTag", "XmlElementStartTag", "XmlEmptyElement", "XmlName",
      "XmlNameAttribute", "XmlPrefix", "XmlProcessingInstruction", "XmlText",
      "XmlTextAttribute"]:
    discard
  # not interested in supporting Trivia at the moment, some have nim equivalents though.
  of ["BadDirectiveTrivia", "DefineDirectiveTrivia",
      "DocumentationCommentTrivia", "ElifDirectiveTrivia",
      "ElseDirectiveTrivia", "EndIfDirectiveTrivia", "EndRegionDirectiveTrivia",
      "ErrorDirectiveTrivia", "NullableDirectiveTrivia",
      "RegionDirectiveTrivia", "IfDirectiveTrivia", "LineDirectiveTrivia",
      "LoadDirectiveTrivia", "PragmaChecksumDirectiveTrivia",
      "PragmaWarningDirectiveTrivia",

"ReferenceDirectiveTrivia", "ShebangDirectiveTrivia", "SkippedTokensTrivia",
          "UndefDirectiveTrivia", "WarningDirectiveTrivia"]:
    discard
  # hmmm, what is Cref ?
  of ["ConversionOperatorMemberCref", "CrefBracketedParameterList",
      "CrefParameter", "CrefParameterList", "IndexerMemberCref",
      "NameMemberCref", "OperatorMemberCref", "QualifiedCref", "TypeCref"]:
    discard
  # linq stuff, we should support it, but perhaps there are shortcuts. (program that replaces linq with normal c#) or we'll make equivalent nim procs to handle it.
  of ["OrderByClause", "GroupClause", "JoinClause", "FromClause",
      "SelectClause", "WhereClause", "JoinIntoClause"]:
    discard #linq
  else:
    raise newException(Exception, "unsupported! Please add to the switch case above: `" &
        info.declName & "`")

