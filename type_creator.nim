import uuids, options
import types
import construct
import constructs/constructs

proc createType*(info: Info; id: UUID; data: AllNeededData): Construct =
  case info.declName #theType
  of "NamespaceDeclaration": # etc etc
    var a = extract(CsNamespace, info, data)
    a.id = some(id)
    result = Construct(kind: ckNamespace, namespace: a)
    # Construct(t: ckNamespace, namespace: a) #.wrap(ckNamespace)

  else: assert false, "still unsupported " & info.declName

