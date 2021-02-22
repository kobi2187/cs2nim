# interface is a non-instantiable ref object, compose together if inherits other interfaces.
# final means cannot inherit from. not what we want. this is for structs perhaps.
import iface
iface ICanFly:
  proc name(): string
  # proc wings():int
type Fly = ref object of RootRef
proc name(f: Fly): string = "Fly"
type Bird = ref object of RootRef
proc name(f: Bird): string = "Bird"
var flies: seq[ICanFly] = @[]
flies.add Fly()
flies.add Bird()
for f in flies:
  echo f.name()
