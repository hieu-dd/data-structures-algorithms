import '../../datastructures/binary_search_tree/implement.dart';

List breadthFirstSearch(BinarySearchTree tree) {
  final result = [];
  final queue = <TreeNode>[];
  var currentNode = tree.root;
  queue.add(currentNode!);
  while (queue.isNotEmpty) {
    final currentNode = queue.removeAt(0);
    result.add(currentNode.value);
    if (currentNode.left != null) {
      queue.add(currentNode.left!);
    }
    if (currentNode.right != null) {
      queue.add(currentNode.right!);
    }
  }
  return result;
}

List breadthFirstSearchRecursive(List<TreeNode> queue, List result) {
  if (queue.isEmpty) return result;
  final node = queue.removeAt(0);
  result.add(node.value);
  if (node.left != null) {
    queue.add(node.left!);
  }
  if (node.right != null) {
    queue.add(node.right!);
  }
  return breadthFirstSearchRecursive(queue, result);
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
  print(breadthFirstSearch(tree));
  print(breadthFirstSearchRecursive([tree.root!], []));
}
