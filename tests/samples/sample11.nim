type AVLTreeTest* = ref object

proc doTest() =
  var avlTree : AVLTree<int> = newAVLTree<int>
  avlTree.Insert(4)
  assertCase_2(avlTree)