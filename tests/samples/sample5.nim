type Array* = ref object

proc `[]`*(this: var IList; index: int): object = discard
proc `[]=`*(this: var IList; index: int; value: object) = discard
