import constructs/[cs_all_constructs, cs_root]
import types, state, construct
import options
import state_utils


proc makeNeededData*(root: var CsRoot; info: Info; src: string; ): AllNeededData =
  result.sourceCode = src
  result.constructDeclName = info.declName
  if not state.currentConstruct.isEmpty and not state.currentConstruct.last.info.isVisitBlock():
    result.inBlock = state.currentConstruct.last

  if previousBlock().isSome:
    result.prevBlock = previousBlock().get

  var (_, ns) = getCurrentNs(root)
  # let cns = Construct(kind: ckNamespace, namespace: ns)
  result.currentNamespace = ns
  result.isNsEmpty = not ns.lastAddedTo.isSome
  if not result.isNsEmpty:
    result.nsLastAdded = ns.lastAddedTo.get

    if not ns.classes.isEmpty:
      result.lastClass = ns.classes.last
      if result.lastClass.lastAddedTo.isSome():
        result.classLastAdded = result.lastClass.lastAddedTo.get

      if not result.lastClass.enums.isEmpty:
        result.lastEnum = result.lastClass.enums.last

        if result.lastEnum != nil:
          result.lastEnumMember = result.lastEnum.items.last


        if not result.lastClass.methods.isEmpty:
          result.lastMethod = result.lastClass.methods.last
        if not result.lastClass.properties.isEmpty:
          result.lastProp = result.lastClass.properties.last
        if not result.lastClass.ctors.isEmpty:
          result.lastCtor = result.lastClass.ctors.last
