# construct.nim
import constructs/cs_all_constructs, uuids

type ConstructKind* = enum
  # ckRoot # nah, too special.
  ckNamespace,
  ckClass

type CNode {.acyclic.} = object
  id*: UUID
  case kind*: ConstructKind
  # add types here:
  # of ckRoot: root: CsRoot
  of ckNamespace:
    namespace*: CsNamespace
  of ckClass:
    class*: CsClass
type Construct* = ref CNode # all the types we support, wrapped in a variant.


template wrap*(obj: untyped, kind: ConstructKind): Construct =
  result = case kind
  # of ckRoot: Construct(kind: ckRoot, root: obj)
  of ckNamespace: Construct(kind: ckNamespace, namespace: obj)
  of ckClass: Construct(kind: ckClass, class: obj)

proc newC*[T](c: ConstructKind, a: typedesc[T], b: T): Construct =
  case c
  of ckClass:
    result = Construct(kind: ckClass, class: b)



template unwrap*(c: Construct): untyped =
  case c.kind:
  # of ckRoot: c.root
  of ckNamespace: c.namespace
  of ckClass: c.class
