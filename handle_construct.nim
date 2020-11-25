import extract, state_utils
import state, types, create, addinroot
import tables, json, stacks, options

var gotStartBlock = false

import sets

proc previousBlock(): Option[Block] =
  let prev = blocks.peek(-3) # -2*2+1
  result = prev


proc addToRoot*(root: var CsRoot; src: string; info: Info) =
  when false:
    echo "blocks info:"
    echo "============"
    echo "last construct: " & $currentConstruct.last
    echo "previous construct: " & $previousConstruct()
    echo $currentPath()

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

  of "CompilationUnit": discard # for real.

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

    root.addNamespace(newns)

  of "ClassDeclaration":
    let c = extract(CsClass, info)
    var (p, ns) = getcurrentNs(root)
    # echo "nsPath is: " & p
    c.nsParent = p
    ns.addClass(c)

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
    var (name, ns) = getCurrentNs(root)
    echo name
    let p = currentPath().last.itemName
    echo p
    var lastEnum = ns.enumTable[p]
    lastEnum.items.add(em)
      # enumTable[p

  of "MethodDeclaration":
    # echo info
    var cls = getLastClass(root)
    assert cls.isSome
    let m1: CsMethod = extract(typedesc(CsMethod), info)
    m1.parentClass = cls.get.name
    add(cls.get, m1)


  of "ReturnStatement": discard #TODO
  of "UsingDirective": discard #TODO
  of "QualifiedName": discard #TODO
  of "PredefinedType": discard #TODO
  of "ExpressionStatement": discard #TODO
  of "InvocationExpression": discard #TODO
  of "ArgumentList": discard #TODO
  of "Argument": discard #TODO
  of "LiteralExpression": discard #TODO
  of "Parameter": discard #TODO
  of "BinaryExpression": discard #TODO
  of "AssignmentExpression": discard #TODO
  of "EqualsValueClause": discard #TODO
  of "ParameterList": discard #TODO
  of "LocalDeclarationStatement": discard #TODO
  of "ObjectCreationExpression": discard #TODO
  of "IfStatement": discard #TODO
  of "Attribute": discard #TODO
  of "AttributeList": discard #TODO
  of "ThisExpression": discard #TODO
  of "TypeArgumentList": discard #TODO
  of "GenericName": discard #TODO
  of "AttributeArgument": discard #TODO
  of "AccessorDeclaration": discard #TODO
  of "FieldDeclaration": discard #TODO
  of "BracketedArgumentList": discard #TODO
  of "ElementAccessExpression": discard #TODO
  of "PropertyDeclaration": discard #TODO
  of "AccessorList": discard #TODO
  of "AttributeArgumentList": discard #TODO
  of "ParenthesizedExpression": discard #TODO
  of "CastExpression": discard #TODO
  of "ArrayRankSpecifier": discard #TODO
  of "ArrayType": discard #TODO
  of "PrefixUnaryExpression": discard #TODO
  of "OmittedArraySizeExpression": discard #TODO
  of "InitializerExpression": discard #TODO
  of "NameEquals": discard #TODO
  of "ThrowStatement": discard #TODO
  of "TypeOfExpression": discard #TODO
  of "ElseClause": discard #TODO
  of "CaseSwitchLabel": discard #TODO
  of "SimpleBaseType": discard #TODO
  of "ConstructorDeclaration": discard #TODO
  of "BaseList": discard #TODO
  of "SwitchSection": discard #TODO
  of "SimpleLambdaExpression": discard #TODO
  of "PostfixUnaryExpression": discard #TODO
  of "ArrayCreationExpression": discard #TODO
  of "ArrowExpressionClause": discard #TODO
  of "BreakStatement": discard #TODO
  of "AliasQualifiedName": discard #TODO
  of "TypeParameter": discard #TODO
  of "AwaitExpression": discard #TODO
  of "ConditionalExpression": discard #TODO
  of "AttributeTargetSpecifier": discard #TODO
  of "TypeParameterList": discard #TODO
  of "ForEachStatement": discard #TODO
  of "ForStatement": discard #TODO
  of "InterpolatedStringText": discard #TODO
  of "ParenthesizedLambdaExpression": discard #TODO
  of "TryStatement": discard #TODO
  of "NullableType": discard #TODO
  of "BaseExpression": discard #TODO
  of "CatchClause": discard #TODO
  of "ConstructorInitializer": discard #TODO
  of "Interpolation": discard #TODO
  of "CatchDeclaration": discard #TODO
  of "NameColon": discard #TODO
  of "UsingStatement": discard #TODO
  of "TypeParameterConstraintClause": discard #TODO
  of "TypeConstraint": discard #TODO
  of "SingleVariableDesignation": discard #TODO
  of "InterpolatedStringExpression": discard #TODO
  of "ImplicitArrayCreationExpression": discard #TODO
  of "WhileStatement": discard #TODO
  of "DeclarationExpression": discard #TODO
  of "ExplicitInterfaceSpecifier": discard #TODO
  of "ConditionalAccessExpression": discard #TODO
  of "SwitchStatement": discard #TODO
  of "MemberBindingExpression": discard #TODO
  of "DefaultExpression": discard #TODO
  of "PointerType": discard #TODO
  of "InterfaceDeclaration": discard #TODO
  of "ContinueStatement": discard #TODO
  of "FinallyClause": discard #TODO
  of "DefaultSwitchLabel": discard #TODO
  of "YieldStatement": discard #TODO
  of "AnonymousObjectMemberDeclarator": discard #TODO
  of "CheckedExpression": discard #TODO
  of "StructDeclaration": discard #TODO
  of "IsPatternExpression": discard #TODO
  of "LockStatement": discard #TODO
  of "DeclarationPattern": discard #TODO
  of "ThrowExpression": discard #TODO
  of "ConstantPattern": discard #TODO
  of "RefType": discard #TODO
  of "RefExpression": discard #TODO
  of "ClassOrStructConstraint": discard #TODO
  of "OmittedTypeArgument": discard #TODO
  of "TupleElement": discard #TODO
  of "OperatorDeclaration": discard #TODO
  of "EventFieldDeclaration": discard #TODO
  of "DelegateDeclaration": discard #TODO
  of "ImplicitElementAccess": discard #TODO
  of "AnonymousMethodExpression": discard #TODO
  of "TupleExpression": discard #TODO
  of "AnonymousObjectCreationExpression": discard #TODO
  of "IndexerDeclaration": discard #TODO
  of "BracketedParameterList": discard #TODO
  of "EventDeclaration": discard #TODO
  of "GotoStatement": discard #TODO
  of "DoStatement": discard #TODO
  of "GlobalStatement": discard #TODO
  of "IncompleteMember": discard #TODO
  of "LocalFunctionStatement": discard #TODO
  of "ConversionOperatorDeclaration": discard #TODO
  of "TupleType": discard #TODO
  of "FixedStatement": discard #TODO
  of "EmptyStatement": discard #TODO
  of "FromClause": discard #TODO
  of "SizeOfExpression": discard #TODO
  of "QueryBody": discard #TODO
  of "CheckedStatement": discard #TODO
  of "QueryExpression": discard #TODO
  of "SelectClause": discard #TODO
  of "CasePatternSwitchLabel": discard #TODO
  of "LabeledStatement": discard #TODO
  of "WhereClause": discard #TODO
  of "ConstructorConstraint": discard #TODO
  of "UnsafeStatement": discard #TODO
  of "ParenthesizedVariableDesignation": discard #TODO
  of "InterpolationFormatClause": discard #TODO
  of "DestructorDeclaration": discard #TODO
  of "DiscardDesignation": discard #TODO
  of "StackAllocArrayCreationExpression": discard #TODO
  of "WhenClause": discard #TODO
  of "ForEachVariableStatement": discard #TODO
  of "LetClause": discard #TODO
  of "ElementBindingExpression": discard #TODO
  of "CatchFilterClause": discard #TODO
  of "Ordering": discard #TODO
  of "OrderByClause": discard #TODO
  of "JoinClause": discard #TODO
  of "GroupClause": discard #TODO
  of "InterpolationAlignmentClause": discard #TODO
  of "QueryContinuation": discard #TODO
  of "ExternAliasDirective": discard #TODO
  of "MakeRefExpression": discard #TODO
  of "JoinIntoClause": discard #TODO
  of "RefValueExpression": discard #TODO
  of "RefTypeExpression": discard #TODO
  # more:
  of "Block": discard #TODO
  of "VariableDeclaration": discard #TODO
  of "BadDirectiveTrivia": discard
  of "BinaryPattern": discard #TODO

  of "ConversionOperatorMemberCref": discard #TODO
  of "CrefBracketedParameterList": discard #TODO
  of "CrefParameter": discard #TODO
  of "CrefParameterList": discard #TODO
  of "DefineDirectiveTrivia": discard
  of "DiscardPattern": discard #TODO
  of "DocumentationCommentTrivia": discard
  of "ElifDirectiveTrivia": discard
  of "ElseDirectiveTrivia": discard
  of "EndIfDirectiveTrivia": discard
  of "EndRegionDirectiveTrivia": discard
  of "ErrorDirectiveTrivia": discard
  of "FunctionPointerType": discard #TODO
  of "IdentifierName": discard #TODO
  of "ImplicitObjectCreationExpression": discard #TODO
  of "MemberAccessExpression": discard #TODO
  of "NullableDirectiveTrivia": discard
  of "ParenthesizedPattern": discard #TODO
  of "PositionalPatternClause": discard #TODO
  of "PrimaryConstructorBaseType": discard #TODO
  of "PropertyPatternClause": discard #TODO
  of "RangeExpression": discard #TODO
  of "RecordDeclaration": discard #TODO
  of "RecursivePattern": discard #TODO
  of "RegionDirectiveTrivia": discard
  of "RelationalPattern": discard #TODO
  of "Subpattern": discard #TODO
  of "SwitchExpression": discard #TODO
  of "SwitchExpressionArm": discard #TODO
  of "TypePattern": discard #TODO
  of "UnaryPattern": discard #TODO
  of "VariableDeclarator": discard #TODO
  of "VarPattern": discard #TODO
  of "WithExpression": discard #TODO
  of "XmlCDataSection": discard
  of "XmlComment": discard
  of "XmlCrefAttribute": discard
  of "XmlElement": discard
  of "XmlElementEndTag": discard
  of "XmlElementStartTag": discard
  of "XmlEmptyElement": discard
  of "XmlName": discard
  of "XmlNameAttribute": discard
  of "XmlPrefix": discard
  of "XmlProcessingInstruction": discard
  of "XmlText": discard
  of "XmlTextAttribute": discard
  of "IfDirectiveTrivia": discard
  of "ImplicitStackAllocArrayCreationExpression": discard #TODO
  of "IndexerMemberCref": discard #TODO
  of "LineDirectiveTrivia": discard
  of "LoadDirectiveTrivia": discard
  of "NameMemberCref": discard #TODO
  of "OperatorMemberCref": discard #TODO
  of "PragmaChecksumDirectiveTrivia": discard
  of "PragmaWarningDirectiveTrivia": discard
  of "QualifiedCref": discard #TODO
  of "ReferenceDirectiveTrivia": discard
  of "ShebangDirectiveTrivia": discard
  of "SkippedTokensTrivia": discard
  of "TypeCref": discard #TODO
  of "UndefDirectiveTrivia": discard
  of "WarningDirectiveTrivia": discard



  else:
    raise newException(Exception, "unsupported! Please add to the switch case above: `" &
        info.declName & "`")

