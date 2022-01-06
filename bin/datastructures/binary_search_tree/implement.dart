import 'dart:convert';

class TreeNode {
  final int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode({required this.value, this.left, this.right});
}

class BinarySearchTree {
  TreeNode? root;

  void insert(int value) {
    final newNode = TreeNode(value: value);
    if (root == null) {
      root = newNode;
    } else {
      var currentNode = root;
      while (true) {
        if (currentNode!.value < value) {
          if (currentNode.right == null) {
            currentNode.right = newNode;
            return;
          } else {
            currentNode = currentNode.right;
          }
        } else {
          if (currentNode.left == null) {
            currentNode.left = newNode;
            return;
          } else {
            currentNode = currentNode.left;
          }
        }
      }
    }
  }

  bool lookup(value) {
    var currentNode = root;
    while (true) {
      if (currentNode == null) {
        return false;
      } else if (currentNode.value == value) {
        return true;
      } else if (currentNode.value < value) {
        currentNode = currentNode.right;
      } else {
        currentNode = currentNode.left;
      }
    }
  }

  bool remove(int value) {
    TreeNode? parent;
    TreeNode? currentNode = root;
    while (currentNode != null) {
      if (currentNode.value == value) {
        if (currentNode.left == null && currentNode.right == null) {
          if (valueIsLeftNode(parent!, value)) {
            parent.left = null;
          } else {
            parent.right = null;
          }
        } else if (currentNode.right == null) {
          if (valueIsLeftNode(parent!, value)) {
            parent.left = currentNode.left;
          } else {
            parent.right = currentNode.left;
          }
        } else if (currentNode.left == null ||
            currentNode.right!.left == null) {
          if (valueIsLeftNode(parent!, value)) {
            parent.left = currentNode.right;
          } else {
            parent.right = currentNode.right;
          }
        } else {
          var parentChange = currentNode.right;
          var change = currentNode.right!.left;
          while (change!.left != null) {
            parentChange = change;
            change = change.left;
          }
          if (valueIsLeftNode(parent!, value)) {
            parent.left = change;
          } else {
            parent.right = change;
          }
          parentChange!.left = null;
        }
        return true;
      } else {
        parent = currentNode;
        if (currentNode.value < value) {
          currentNode = currentNode.right;
        } else {
          currentNode = currentNode.left;
        }
      }
    }
    return false;
  }

  bool valueIsLeftNode(TreeNode node, value) {
    return node.value > value;
  }

  @override
  String toString() {
    if (root == null) return "";
    return json.encode(traverse(root!));
  }
}

Map<String, dynamic> traverse(TreeNode node) {
  final Map<String, dynamic> tree = {"value": node.value};
  tree['left'] = node.left == null ? null : traverse(node.left!);
  tree['right'] = node.right == null ? null : traverse(node.right!);
  return tree;
}

void main() {
  final tree = BinarySearchTree();
  tree.insert(20);
  tree.insert(10);
  tree.insert(30);
  tree.insert(15);
  tree.insert(12);
  print(tree.toString());
  print(tree.remove(30));
  print(tree.toString());
}
