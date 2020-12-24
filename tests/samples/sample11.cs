public static class AVLTreeTest
{
  [Fact]
  public static void DoTest()
  {
    AVLTree<int> avlTree = new AVLTree<int>();
    avlTree.Insert(4); // insert
    AssertCase_2(avlTree);
  }
}