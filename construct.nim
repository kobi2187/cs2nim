# construct.nim
import constructs/cs_all_constructs, uuids

type ConstructKind* = enum
  # ckRoot # nah, too special.
  ckNamespace,
  ckClass,
  ckMethod

import options
type CNode {.acyclic.} = object
  id*: Option[UUID]
  parentId*: Option[UUID]
  case kind*: ConstructKind
  # add types here:
  # of ckRoot: root: CsRoot
  of ckNamespace:
    namespace*: CsNamespace
  of ckClass:
    class*: CsClass
  of ckMethod:
    `method`*: CsMethod

type Construct* = ref CNode # all the types we support, wrapped in a variant.


proc wrap*[T](obj: ref T, kind: ConstructKind): Construct =
  case kind
  # of ckRoot: Construct(kind: ckRoot, root: obj)
  of ckNamespace: result = Construct(kind: ckNamespace, namespace: obj)
  of ckClass: result = Construct(kind: ckClass, class: obj)
  of ckMethod: result = Construct(kind: ckMethod, `method`: obj)
# proc newC*[T](c: ConstructKind, a: typedesc[T], b: T): Construct =
#   case c
#   of ckClass:
#     result = Construct(kind: ckClass, class: b)

# template unwrap*(c: Construct): untyped =
#   case c.kind:
#   # of ckRoot: c.root
#   of ckNamespace: c.namespace
#   of ckClass: c.class
#   of ckMethod: c.`method`
