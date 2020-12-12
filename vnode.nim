#### experimental. test this!
# experiment: different objects in table based on id, wrapped in a variant object
import constructs/[cs_all_constructs]
import types, uuids
type
  VKind* = enum
    vkMethod, vkClass, vkBodyExpr
  V2 = object
    case kind: VKind
    of vkMethod: m: CsMethod
    of vkClass: c: CsClass
    of vkBodyExpr: b: BodyExpr
  Variant* = ref V2

template expect*(v: Variant; kind: VKind): untyped =
  case kind:
  of vkBodyExpr: v.b
  of vkClass: v.c
  of vkMethod: v.m

import options
proc id*(v: Variant): UUID =
  v.expect(v.kind).id.get

# proc asVariant(c: CsObject; kind: VKind): Variant =
#   c.id

