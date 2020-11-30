type CriticalHandleMinusOneIsInvalid* = ref object of CriticalHandle

proc newCriticalHandleMinusOneIsInvalid(): CriticalHandleMinusOneIsInvalid =
  new result



