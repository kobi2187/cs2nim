type Z = object of RootRef
type A = ref object of Z
type B = ref object of Z

# method add(it: ref Z) {.base.} = echo "Z"
# method add(it: A) = echo "A"
# method add(it: B) = echo "B"



method add(it: var ref Z, x: A) {.base.} = echo "Z"
method add(it: var A, x: A) = echo "A"
method add(it: var B, x: A) = echo "B"


var ls = @[A(), B()]
for n in ls.mitems:
  echo typeof(n)
  let a = A()
  n.add(a)
#[
type Z* = object of RootRef
type A* = ref object of Z
type B* = ref object of Z

method add*(a: var ref Z, b: ref Z) {.base.} =
  raise newException(Exception, "got CsObject's method")

method adds*(a: var A; b: B) =
  echo "CsClass adds CsMethod"

var list = @[A(), B()]
var a = list[0]
echo typeof(a)
a.adds(list[1])
]#
