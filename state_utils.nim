# state_utils.nim
# just to prevent circular dependency
import stacks,tables
import sequtils
import state,extract,types

proc nsPath:string = 
  var started = false
# we assume blocks starts with namespaces.
  for b in blocks.toSeq:
    if b.info.declName == "NamespaceDeclaration":
      started=true
      result &= "." & extractCsNamespace(b.info).name
    else:
      if not started: continue
      else: return



proc addToRoot*( src:string; info:Info) = 
  ## here, we take the path from `blocks`, if there are consecutive namespaces, we combine them. (ns decl will already create new ns in root if they are nested)
  ## (update block types if we find more)

  # lots of impl details here. two parts:1) get the path, 2) create object and extract details from Info.
  ## we go deep, according to path, get the reference, and add the new info as the correct object (from types).
  ## probably we discover we need to extract info better, or the types are not well defined, so fix them when we find such a discrepancy
  ## that's it for this proc.
  case info.declName
  # declaration names:
  of "NamespaceDeclaration":
    #handle nested.
    let newns = extractCsNamespace(info)
    root.ns.add(newns)
    addNamespace(newns)
  of "UsingDirective": discard #TODO
  of "QualifiedName": discard #TODO
  of "ClassDeclaration": #TODO
    let className = info.essentials[0]
    let p = nsPath()
    echo p
    if root.nsTables.hasKey(p):
      let ns = root.nsTables[p]
      ns.addClass(className)
  of "MethodDeclaration": discard #TODO
  of "PredefinedType": discard #TODO
  of "BlockStarts": discard #TODO
  of "ExpressionStatement": discard #TODO
  of "InvocationExpression": discard #TODO
  of "ArgumentList": discard #TODO
  of "Argument": discard #TODO
  of "LiteralExpression": discard #TODO
  of "Parameter": discard #TODO

  else:
    echo "so far:"
    echo root #TODO: make a $ proc for CsRoot
    raise newException(Exception,"unsupported or not implemented: `" & info.declName & "`")