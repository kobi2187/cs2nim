# interface is a non-instantiable ref object, compose together if inherits other interfaces.
# final means cannot inherit from. not what we want. this is for structs perhaps.

type ICanFly {.final .} = ref object of RootRef # Doesn't work?
  name*:string
  wings*:int
type Fly = ref object of ICanFly
  # name*:string
  # wings*:int
type Bird = ref object of ICanFly
type Dog = object
# flies = # : seq[ICanFly] = @[]
var flies = @[ Fly(name:"fly", wings:2),Bird(name:"birdie"), ICanFly(name:"the group name, don't want this to be instantiable")]
for f in flies:
  echo f.name , f.wings