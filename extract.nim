# extract.nim

import types,state
import json,tables

func extractCsNamespace*(info:Info) : CsNamespace = 
  newCsNamespace(info.essentials[0])

  
proc addNamespace*(csn:CsNamespace) =
  root.ns.add(csn)
  root.nsTables[csn.name] = csn

proc addNamespace*(ns:string) =
  let csn = newCsNamespace(ns)
  addNamespace(csn)

proc extractClass*(info:Info):CsClass =
  let name = info.essentials[0]
  result= CsClass(name:name)


proc addClass*(ns:CsNamespace,class:CsClass)=
  ns.classes.add(class)
  ns.classTable[class.name] = class