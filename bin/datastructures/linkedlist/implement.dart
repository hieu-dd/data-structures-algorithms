class Node<E> {
  final E value;
  Node? next;

  Node(this.value, this.next);

  @override
  String toString() {
    return """{value : $value , next : ${next.toString()}}""";
  }
}

class MyLinkedList<E> {
  Node? head;
  Node? tail;
  var lenght = 0;

  MyLinkedList(E value) {
    head = Node(value, null);
    tail = head;
    lenght = 1;
  }

  Node append(value) {
    final newNode = Node(value, null);
    tail!.next = newNode;
    tail = newNode;
    lenght++;
    return head!;
  }

  @override
  String toString() {
    return head.toString();
  }

  Node prepend(value) {
    final newNode = Node(value, head);
    head = newNode;
    lenght++;
    return head!;
  }

  Node insert(index, value) {
    if (index > lenght) {
      throw Exception("Out of index");
    } else if (index == 0) {
      prepend(value);
    } else if (index == lenght) {
      append(value);
    } else {
      final leadNode = traverseToIndex(index - 1);
      final newNode = Node(value, leadNode!.next);
      leadNode.next = newNode;
    }
    lenght++;
    return head!;
  }

  Node? remove(index) {
    if (index >= lenght) {
      throw Exception("Out of index");
    } else if (index == 0) {
      head = head!.next;
    } else {
      final leadNode = traverseToIndex(index - 1);
      final removeNode = leadNode!.next;
      leadNode.next = removeNode!.next;
      removeNode.next = null;
    }
    lenght--;
    return head;
  }

  Node? traverseToIndex(int index) {
    var count = 0;
    var temp = head;
    while (count != index) {
      temp = temp!.next;
      count++;
    }
    return temp;
  }
}

void main() {
  final myLinkedList = MyLinkedList(1);
  myLinkedList.append(2);
  myLinkedList.append(2);
  myLinkedList.prepend(4);
  myLinkedList.insert(2, 5);
  myLinkedList.remove(2);
  print(myLinkedList.toString());
}
