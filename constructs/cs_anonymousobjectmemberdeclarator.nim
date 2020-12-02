import ../types
type CsAnonymousObjectMemberDeclarator* = ref object of CsObject #TODO(type:CsAnonymousObjectMemberDeclarator)

proc newCs*(t: typedesc[CsAnonymousObjectMemberDeclarator]; name: string): CsAnonymousObjectMemberDeclarator =
  new result #TODO(create:CsAnonymousObjectMemberDeclarator)

proc extract*(t: typedesc[CsAnonymousObjectMemberDeclarator]; info: Info): CsAnonymousObjectMemberDeclarator = discard #TODO(extract:CsAnonymousObjectMemberDeclarator)

proc add*(parent: var CsAnonymousObjectMemberDeclarator; item: Dummy) = discard # TODO(add:CsAnonymousObjectMemberDeclarator)

proc gen*(c: var CsAnonymousObjectMemberDeclarator): string = discard #TODO(gen:CsAnonymousObjectMemberDeclarator)
