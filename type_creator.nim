import uuids, options
import types
import construct
import constructs/cs_all_constructs

proc createType*(info: Info; id: UUID; data: AllNeededData): Construct =
  case info.declName #theType

  # ## unsupported by choice, or implement last.  
  # not interested in supporting attributes
  # not interested in supporting xml attributes comments etc.
  # not interested in supporting Trivia at the moment, some have nim equivalents though.
  # hmmm, what is Cref ?
  # linq stuff, we should support it, but perhaps there are shortcuts. (program that replaces linq with normal c#) or we'll make equivalent nim procs to handle it.
  of ["AttributeTargetSpecifier", "Attribute", "AttributeList", "AttributeArgument", "AttributeArgumentList"
  , "XmlCDataSection", "XmlComment", "XmlCrefAttribute", "XmlElement", "XmlElementEndTag", "XmlElementStartTag", "XmlEmptyElement`", "XmlName", "XmlNameAttribute", "XmlPrefix", "XmlProcessingInstruction", "XmlText", "XmlTextAttribute"
  , "BadDirectiveTrivia", "DefineDirectiveTrivia", "DocumentationCommentTrivia", "ElifDirectiveTrivia", "ElseDirectiveTrivia", "EndIfDirectiveTrivia", "EndRegionDirectiveTrivia", "ErrorDirectiveTrivia", "NullableDirectiveTrivia", "RegionDirectiveTrivia", "IfDirectiveTrivia", "LineDirectiveTrivia", "LoadDirectiveTrivia", "PragmaChecksumDirectiveTrivia", "PragmaWarningDirectiveTrivia",
  "ReferenceDirectiveTrivia", "ShebangDirectiveTrivia", "SkippedTokensTrivia", "UndefDirectiveTrivia", "WarningDirectiveTrivia", "ConversionOperatorMemberCref", "CrefBracketedParameterList", "CrefParameter", "CrefParameterList", "IndexerMemberCref", "NameMemberCref", "OperatorMemberCref", "QualifiedCref", "TypeCref", "OrderByClause", "GroupClause", "JoinClause", "FromClause", "SelectClause",
      "WhereClause", "JoinIntoClause"]:
    discard

  of "NamespaceDeclaration": # etc etc
    var a = extract(CsNamespace, info, data)
    a.id = some(id)
    result = Construct(kind: ckNamespace, namespace: a)
  of "ClassDeclaration":
    var a = extract(CsClass, info, data)
    a.id = some(id)
    result = Construct(kind: ckClass, class: a)
    # Construct(t: ckNamespace, namespace: a) #.wrap(ckNamespace)
  of "MethodDeclaration":
    var a = extract(CsMethod, info, data)
    a.id = some(id)
    result = Construct(kind: ckMethod, cmethod: a)
  # still unsupported
  of "PredefinedType":
    var a = extract(CsPredefinedType, info, data)
    a.id = some(id)
    result = Construct(kind: ckPredefinedType, predefinedType: a)
  of "ParameterList":
    var a = extract(CsParameterList, info,data)
    a.id = some(id)
    result = Construct(kind:ckParameterList, parameterlist: a)
  of "LocalDeclarationStatement":
    var a = extract(CsLocalDeclarationStatement, info,data)
    a.id = some(id)
    result = Construct(kind: ckLocalDeclarationStatement, localDeclarationStatement: a)
  of "EnumDeclaration":
    var a = extract(CsEnum, info)
    a.id = some(id)
    result = Construct(kind: ckEnum, cenum: a)
  of "EnumMemberDeclaration":
    var a = extract(CsEnumMember, info)
    a.id = some(id)
    result = Construct(kind: ckEnumMember, enumMember: a)
  of "EqualsValueClause": # assignment.
    var a = extract(CsEqualsValueClause, info) #, data); 
    a.id = some(id)
    result = Construct(kind: ckEqualsValueClause, equalsValueClause: a)

  of "LiteralExpression":
    var a = extract(CsLiteralExpression, info) #, data); 
    a.id = some(id)
    result = Construct(kind: ckLiteralExpression, literalExpression: a)

  of ["... add here."]: discard # TODO
  else: assert false, "still unsupported: of \"" & info.declName & "\" : maybe in handle_construct.nim"

  result.id = some(id)
