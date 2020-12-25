type AVLTreeTest* = ref object

proc doTest() =
  var treeDataList : List[int] = newList[int]().initWith(15, 25, -5)