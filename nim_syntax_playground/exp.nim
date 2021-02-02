# code generation
# how to handle calling to super, or base in the C# constructor?
# the return type is different (a base class), the assignments
# we send a new result of child, to a parent ctor.
# instead of newCtor = new result; result.a = 1 
#  we do newCtor(this:RetType = nil; other, args:int) : RetType
  # if this.isNil: new result ...
  # I think it'll allow to call parent ctor, and then continue adding fields.
  # TEST:

# problem : how to do a ctor call to the base ctor?

# I think this is the simplest way

type A = ref object of RootRef
  one*: int
  status*: string
type B = ref object of A
  other: string

proc newA(this: var A | typeof(nil) = nil; other: int): A =
  new result
  if this.isNil: result = A() else: result = this
  # original body:
  result.one = other


proc newB(other: string): B =
  let args = 2
  result = B procCall newA(A B(), args) # here is the magic. not very convenient though.

  result.other = other
  return result

# var b = B()
let x = newB("hello")
echo x.other, x.one, x.status
# var a = A()
# let a2 = newA(3)
# echo a2.status, a2.one

