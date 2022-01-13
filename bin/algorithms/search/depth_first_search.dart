import '../../datastructures/binary_search_tree/implement.dart';

List dfsPreOrder(BinarySearchTree tree) {
  final queue = <TreeNode>[];
  addNodePreOrder(queue, tree.root!);
  return queue.map((e) => e.value).toList();
}

void addNodePreOrder(List arr, TreeNode node) {
  arr.add(node);
  if (node.left != null) addNodePreOrder(arr, node.left!);
  if (node.right != null) addNodePreOrder(arr, node.right!);
}

List dfsInOrder(BinarySearchTree tree) {
  final queue = <TreeNode>[];
  addNodeInOrder(queue, tree.root!);
  return queue.map((e) => e.value).toList();
}

void addNodeInOrder(List arr, TreeNode node) {
  if (node.left != null) addNodeInOrder(arr, node.left!);
  arr.add(node);
  if (node.right != null) addNodeInOrder(arr, node.right!);
}

List dfsPostOrder(BinarySearchTree tree) {
  final queue = <TreeNode>[];
  addNodePostOrder(queue, tree.root!);
  return queue.map((e) => e.value).toList();
}

void addNodePostOrder(List arr, TreeNode node) {
  if (node.left != null) addNodePostOrder(arr, node.left!);
  if (node.right != null) addNodePostOrder(arr, node.right!);
  arr.add(node);
}

void main() {
  final tree = BinarySearchTree();
  tree.insert(9);
  tree.insert(4);
  tree.insert(20);
  tree.insert(1);
  tree.insert(6);
  tree.insert(15);
  tree.insert(170);
  print(dfsPreOrder(tree));
  print(dfsInOrder(tree));
  print(dfsPostOrder(tree));
}
