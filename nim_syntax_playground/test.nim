# test.nim

type A = ref object of RootRef
  x: int

type B = ref object of A
type C = ref object of B

C().x = 7

type A1 = object of RootObj
  x: int

type B1 = object of A1
type C1 = object of B1

var a = A1()
a.x = 8
var b = B1()
b.x = 8
var c = C1()
c.x = 8
