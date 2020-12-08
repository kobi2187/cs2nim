# construct.nim
import constructs/constructs

type ConstructKind* = enum
  # ckRoot # nah, too special.
  ckNamespace
  ckClass

type CNode = object
  t*: ConstructKind
  case kind: ConstructKind
  # add types here:
  # of ckRoot: root: CsRoot
  of ckNamespace: namespace*: CsNamespace
  of ckClass: class*: CsClass

type Construct* = ref CNode # all the types we support, wrapped in a variant.
proc type*(c: Construct): ConstructKind = c.t

template wrap*(obj: untyped, kind: ConstructKind): Construct =
  case kind
  # of ckRoot: Construct(kind: ckRoot, root: obj)
  of ckNamespace: Construct(kind: ckNamespace, namespace: obj)
  of ckClass: Construct(kind: ckClass, class: obj)

template unwrap*(c: Construct; kind: ConstructKind): untyped =
  case kind:
  # of ckRoot: c.root
  of ckNamespace: c.namespace
  of ckClass: c.class
