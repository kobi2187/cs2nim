import uuids
import types
import construct
import constructs/constructs

proc createType*(info: Info; id: UUID; data: AllNeededData): Construct =
  case info.declName #theType
  of "NamespaceDeclaration": # etc etc
    let a: CsNamespace = extract(CsNamespace, info, data)
    result = Construct(t: ckNamespace, namespace: a)
  else: assert false, "still unsupported " & info.declName
  result.id = id
