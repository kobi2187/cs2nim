# state_utils.nim
# just to prevent circular dependency
import stacks, tables, json
# import sequtils
import state, extract, types

proc nsPath: string =
  var started = false
 # we assume blocks starts with namespaces.
 # echo blocks.toSeq
  for b in blocks.toSeq:
    if b.info.declName == "NamespaceDeclaration":
      started = true
      if result != "":
        result &= "."
      result &= extractCsNamespace(b.info).name

    else:
      if not started: continue
      else: return


import extract

proc addToRoot*(src: string; info: Info) =
  ## here, we take the path from `blocks`, if there are consecutive namespaces, we combine them. (ns decl will already create new ns in root if they are nested)
  ## (update block types if we find more)

  # lots of impl details here. two parts:1) get the path, 2) create object and extract details from Info.
  ## we go deep, according to path, get the reference, and add the new info as the correct object (from types).
  ## probably we discover we need to extract info better, or the types are not well defined, so fix them when we find such a discrepancy
  ## that's it for this proc.
  case info.declName
  # declaration names:

  of "CompilationUnit": discard # for real.
  of "NamespaceDeclaration":
    #handle nested.
    let newns = extractCsNamespace(info)
    addNamespace(newns)

  of "ClassDeclaration":
    let c = extractClass(info)
    var p = nsPath()
    if p == "": p = "default"
    # echo "nsPath is: " & p
    c.nsParent = p
    assert root.nsTables.hasKey(p)
    let ns = root.nsTables[p]
    ns.addClass(c)


  of "ReturnStatement": discard #TODO
  of "UsingDirective": discard #TODO
  of "QualifiedName": discard #TODO
  of "MethodDeclaration": discard #TODO
  of "PredefinedType": discard #TODO
  of "BlockStarts": discard #TODO
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
  of "EnumMemberDeclaration": discard #TODO
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
  of "EnumDeclaration": discard #TODO
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
  of "BadDirectiveTrivia": discard #TODO
  of "BinaryPattern": discard #TODO

  of "ConversionOperatorMemberCref": discard #TODO
  of "CrefBracketedParameterList": discard #TODO
  of "CrefParameter": discard #TODO
  of "CrefParameterList": discard #TODO
  of "DefineDirectiveTrivia": discard #TODO
  of "DiscardPattern": discard #TODO
  of "DocumentationCommentTrivia": discard #TODO
  of "ElifDirectiveTrivia": discard #TODO
  of "ElseDirectiveTrivia": discard #TODO
  of "EndIfDirectiveTrivia": discard #TODO
  of "EndRegionDirectiveTrivia": discard #TODO
  of "ErrorDirectiveTrivia": discard #TODO
  of "FunctionPointerType": discard #TODO
  of "IdentifierName": discard #TODO
  of "ImplicitObjectCreationExpression": discard #TODO
  of "MemberAccessExpression": discard #TODO
  of "NullableDirectiveTrivia": discard #TODO
  of "ParenthesizedPattern": discard #TODO
  of "PositionalPatternClause": discard #TODO
  of "PrimaryConstructorBaseType": discard #TODO
  of "PropertyPatternClause": discard #TODO
  of "RangeExpression": discard #TODO
  of "RecordDeclaration": discard #TODO
  of "RecursivePattern": discard #TODO
  of "RegionDirectiveTrivia": discard #TODO
  of "RelationalPattern": discard #TODO
  of "Subpattern": discard #TODO
  of "SwitchExpression": discard #TODO
  of "SwitchExpressionArm": discard #TODO
  of "TypePattern": discard #TODO
  of "UnaryPattern": discard #TODO
  of "VariableDeclarator": discard #TODO
  of "VarPattern": discard #TODO
  of "WithExpression": discard #TODO
  of "XmlCDataSection": discard #TODO
  of "XmlComment": discard #TODO
  of "XmlCrefAttribute": discard #TODO
  of "XmlElement": discard #TODO
  of "XmlElementEndTag": discard #TODO
  of "XmlElementStartTag": discard #TODO
  of "XmlEmptyElement": discard #TODO
  of "XmlName": discard #TODO
  of "XmlNameAttribute": discard #TODO
  of "XmlPrefix": discard #TODO
  of "XmlProcessingInstruction": discard #TODO
  of "XmlText": discard #TODO
  of "XmlTextAttribute": discard #TODO
  of "IfDirectiveTrivia": discard #TODO
  of "ImplicitStackAllocArrayCreationExpression": discard #TODO
  of "IndexerMemberCref": discard #TODO
  of "LineDirectiveTrivia": discard #TODO
  of "LoadDirectiveTrivia": discard #TODO
  of "NameMemberCref": discard #TODO
  of "OperatorMemberCref": discard #TODO
  of "PragmaChecksumDirectiveTrivia": discard #TODO
  of "PragmaWarningDirectiveTrivia": discard #TODO
  of "QualifiedCref": discard #TODO
  of "ReferenceDirectiveTrivia": discard #TODO
  of "ShebangDirectiveTrivia": discard #TODO
  of "SkippedTokensTrivia": discard #TODO
  of "TypeCref": discard #TODO
  of "UndefDirectiveTrivia": discard #TODO
  of "WarningDirectiveTrivia": discard #TODO



  else:
    echo "so far:"
    echo root #TODO: make a $ proc for CsRoot
    raise newException(Exception, "unsupported or not implemented: `" &
        info.declName & "`")
