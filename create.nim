# create.nim

import types, lineparser
# here we create the types, based on the values we got in json.
# see: addToRoot
proc jsonWithoutSource(n:JsonNode) : JsonNode =
  var p = n.deepCopy
  p.delete("Source")
  result = p
# this is the place of internal implementation. the specifics.
# info has essentials aka main, and extras.
# this proc knows what these sequences mean and creates the correct type.
# then we add this object to the current location in root. (based on blocks and currentPath)
# so, i think we wouldn't need to keep track of current location except for this blocks stack.
# add the source and original json minus source to the object created (based on CsObject)
# these will be comments when generated later on.