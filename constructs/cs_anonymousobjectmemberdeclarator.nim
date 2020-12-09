import ../types, uuids, options
type CsAnonymousObjectMemberDeclarator* = ref object of CsObject #TODO(type:CsAnonymousObjectMemberDeclarator)

proc newCs*(t: typedesc[CsAnonymousObjectMemberDeclarator]; name: string): CsAnonymousObjectMemberDeclarator =
  new result
  result.id = uuids.genUUID #TODO(create:CsAnonymousObjectMemberDeclarator)

proc extract*(t: typedesc[CsAnonymousObjectMemberDeclarator]; info: Info): CsAnonymousObjectMemberDeclarator = discard #TODO(extract:CsAnonymousObjectMemberDeclarator)

proc add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy; data: AllNeededData) = parent.add(item) # TODO
proc add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy) =
  discard # TODO(add:CsAnonymousObjectMemberDeclarator)
  # item.parentId = parent.id

proc gen*(c: var CsAnonymousObjectMemberDeclarator): string = discard #TODO(gen:CsAnonymousObjectMemberDeclarator)
