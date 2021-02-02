# exp2.nim
type
  A = ref object of RootRef
  B = ref object of A
  C = ref object of B

method bark(a: A, it: string) {.base.} = echo "bark A"
# method bark(b:B) = echo "bark B"
method bark(c: C, it: string) = echo "bark C"


C().bark("a")
