type A* = ref object of B
  u_IsInvalid: bool

method isInvalid*(this: A): bool = this.u_IsInvalid
