import constructs/[cs_all_constructs, cs_root]
import types, state#, construct
import options
import state_utils
import uuids

proc idLastClassPart*(data:AllNeededData):Option[UUID]=
   case data.classLastAdded
    of Ctors:
      result = data.lastCtor.id
    of Properties:
      result = data.lastProp.id
    of Methods:
      result = data.lastMethod.id
    of Indexer:
      result = data.lastClass.indexer.id

proc idLastNsPart*(data:AllNeededData):Option[UUID]=
  case data.nsLastAdded
  of Interfaces:
    result = data.lastInterface.id
  of Enums:
    result = data.lastEnum.id
  of Classes: 
    result = data.lastClass.id
  of Using: result = data.lastUsing.id
  else: return none(UUID)

proc isNsEmpty*(data:AllNeededData) : bool=
  result = not data.currentNamespace.lastAddedTo.isSome()

proc getBody(c: CsProperty) : seq[BodyExpr]=
  result = case c.lastAddedTo
  of Getter: c.bodyGet
  of Setter: c.bodySet

proc getBody(c:CsMethod | CsConstructor):seq[BodyExpr]=
  result = c.body

proc lastBodyExpr*(c:CsMethod | CsConstructor | CsProperty):Option[BodyExpr] = 
  let b = c.getBody()
  if not b.isEmpty:
    result = some(b[^1])
  else: result =none(BodyExpr)

proc lastBodyExprId*(c:CsMethod | CsConstructor | CsProperty):Option[UUID] = 
  let x = c.lastBodyExpr
  if x.isNone: result = none(UUID)
  else: result = x.get.id


proc makeNeededData*(root: var CsRoot; info: Info; src: string; ): AllNeededData =
  # echo "in makeNeededData"
  result.sourceCode = src
  echo "!! Source: ", src
  result.constructDeclName = info.declName
  if not state.currentConstruct.isEmpty and not state.currentConstruct.last.info.isVisitBlock():
    result.inBlock = state.currentConstruct.last

  result.currentConstruct =
    if currentConstruct.len > 0:
      currentConstruct.last.some      
    else: none(Block)
  

  if currentConstruct.len >= 2:
    result.previousConstruct = some(previousConstruct())
  if currentConstruct.len >= 3:
    result.previousPreviousConstruct = some(prevprevConstruct())


  if previousBlock().isSome:
    result.prevBlock = previousBlock().get

  var (_, ns) = getCurrentNs(root)

  # ns info
  result.currentNamespace = ns
  
  if not result.isNsEmpty:
    result.nsLastAdded = ns.lastAddedTo.get
    if not result.currentNamespace.imports.isEmpty:
      result.lastUsing = ns.imports.last
    if true: #result.nsLastAdded != NamespaceParts.Unset:
      #interfaces info
      if not result.currentNamespace.interfaces.isEmpty:
        result.lastInterface = ns.interfaces.last
      # enum info
      if not result.currentNamespace.enums.isEmpty:
        result.lastEnum = result.currentNamespace.enums.last
        if result.lastEnum != nil and not result.lastEnum.items.isEmpty:
          result.lastEnumMember = result.lastEnum.items.last
      # class info
      if not ns.classes.isEmpty:
        result.lastClass = ns.classes.last
        if result.lastClass.lastAddedTo.isSome():
          result.classLastAdded = result.lastClass.lastAddedTo.get
          if not result.lastClass.methods.isEmpty:
            result.lastMethod = result.lastClass.methods.last
            # if result.lastMethod.body.len > 0 :
            #   result.lastMethodBodyExpr = result.lastMethod.body[^1]
          if not result.lastClass.properties.isEmpty:
            result.lastProp = result.lastClass.properties.last
          if not result.lastClass.ctors.isEmpty:
            result.lastCtor = result.lastClass.ctors.last
          if result.classLastAdded in [ ClassParts.Methods, ClassParts.Properties, ClassParts.Ctors]:
            case result.classLastAdded
              of  ClassParts.Methods:
                result.lastBodyExpr = lastBodyExpr(result.lastMethod)
                result.lastBodyExprId = lastBodyExprId(result.lastMethod)
              of  ClassParts.Ctors:
                result.lastBodyExpr = lastBodyExpr(result.lastCtor)
                result.lastBodyExprId = lastBodyExprId(result.lastCtor)
              of ClassParts.Properties:
                result.lastBodyExpr = lastBodyExpr(result.lastProp)
                result.lastBodyExprId = lastBodyExprId(result.lastProp)
              else: discard
proc refresh*(d: var AllNeededData; root: var CsRoot; info: Info; src: string) =
  d = makeNeededData(root, info, src)

