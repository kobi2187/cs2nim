# no, don't do that, we have a better design.

import constructs/constructs
import sequtils, sets, tables



# proc add*(root: var CsRoot; item: CsInvocationExpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsArgumentList) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsUsingDirective) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsLiteralExpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsPredefinedType) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsMethod) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsEnum) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsEnumMember) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsClass) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsArgument) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsExpressionStatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsBinaryExpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsParameter) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: CsAssignmentExpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: CsEqualsValueClause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csparameterlist) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cslocaldeclarationstatement) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csobjectcreationexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csreturnstatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csifstatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csattribute) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csattributelist) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csthisexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cstypeargumentlist) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csgenericname) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csattributeargument) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csaccessor) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csfield) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csbracketedargumentlist) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cselementaccessexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csproperty) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csaccessorlist) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csattributeargumentlist) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csparenthesizedexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cscastexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csarrayrankspecifier) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csarraytype) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csprefixunaryexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csomittedarraysizeexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csinitializerexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csnameequals) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csthrowstatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cstypeofexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cselseclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cscaseswitchlabel) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cssimplebasetype) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csconstructor) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csbaselist) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csswitchsection) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cssimplelambdaexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cspostfixunaryexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csarraycreationexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csarrowexpressionclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csbreakstatement) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csaliasqualifiedname) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cstypeparameter) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csawaitexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csconditionalexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csattributetargetspecifier) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cstypeparameterlist) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csforeachstatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csforstatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csinterpolatedstringtext) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csparenthesizedlambdaexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cstrystatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csnullabletype) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csbaseexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cscatchclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csconstructorinitializer) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csinterpolation) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cscatch) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csnamecolon) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csusingstatement) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cstypeparameterconstraintclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cstypeconstraint) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cssinglevariabledesignation) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csinterpolatedstringexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csimplicitarraycreationexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cswhilestatement) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csdeclarationexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csexplicitinterfacespecifier) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csconditionalaccessexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csswitchstatement) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csmemberbindingexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csdefaultexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cspointertype) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csinterface) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cscontinuestatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csfinallyclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csdefaultswitchlabel) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csyieldstatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csanonymousobjectmemberdeclarator) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cscheckedexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csstruct) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csispatternexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cslockstatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csdeclarationpattern) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csthrowexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csconstantpattern) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csreftype) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csrefexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csclassorstructconstraint) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csomittedtypeargument) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cstupleelement) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csoperator) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cseventfield) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csdelegate) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csimplicitelementaccess) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csanonymousmethodexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cstupleexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csanonymousobjectcreationexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csindexer) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csbracketedparameterlist) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csevent) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csgotostatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csdostatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csglobalstatement) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csincompletemember) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cslocalfunctionstatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csconversionoperator) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cstupletype) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csfixedstatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csemptystatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csfromclause) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cssizeofexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csquerybody) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cscheckedstatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csqueryexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csselectclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cscasepatternswitchlabel) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cslabeledstatement) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cswhereclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csconstructorconstraint) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csunsafestatement) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csparenthesizedvariabledesignation) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csinterpolationformatclause) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csdestructor) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csdiscarddesignation) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csstackallocarraycreationexpression) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cswhenclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csforeachvariablestatement) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csletclause) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Cselementbindingexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Cscatchfilterclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csordering) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csorderbyclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csjoinclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csgroupclause) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csinterpolationalignmentclause) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csquerycontinuation) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csexternaliasdirective) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csmakerefexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csjoinintoclause) =
#   assert false, "implement me plz"

# proc add*(root: var CsRoot; item: Csrefvalueexpression) =
#   assert false, "implement me plz"
# proc add*(root: var CsRoot; item: Csreftypeexpression) =
#   assert false, "implement me plz"

