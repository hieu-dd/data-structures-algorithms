class Node<E> {
  final E value;
  Node? next;
  Node? previous;

  Node(this.value, this.next, this.previous);

  @override
  String toString() {
    return """{value : $value , next : ${next.toString()}}""";
  }
}

class DoublyLinkedList<E> {
  Node? head;
  Node? tail;
  var length = 0;

  DoublyLinkedList(E value) {
    head = Node(value, null, null);
    tail = head;
    length = 1;
  }

  Node append(value) {
    final newNode = Node(value, null, tail);
    tail!.next = newNode;
    tail = newNode;
    length++;
    return head!;
  }

  Node appendAll(List<E> values) {
    values.forEach((element) {
      append(element);
    });
    return head!;
  }

  Node prepend(value) {
    final newNode = Node(value, head, null);
    head!.previous = newNode;
    head = newNode;
    length++;
    return head!;
  }

  Node insert(index, value) {
    if (index > length) {
      throw Exception("Out of index");
    } else if (index == 0) {
      prepend(value);
    } else if (index == length) {
      append(value);
    } else {
      final currentNode = traverseToIndex(index);
      final leadNode = currentNode!.previous;
      final newNode = Node(value, currentNode, leadNode);
      leadNode!.next = newNode;
      currentNode.previous = newNode;
    }
    length++;
    return head!;
  }

  Node? remove(index) {
    if (index >= length) {
      throw Exception("Out of index");
    } else if (index == 0) {
      head = head!.next;
    } else {
      final notNeedNode = traverseToIndex(index)!;
      final leadNode = notNeedNode.previous;
      final trailNode = notNeedNode.next;
      leadNode!.next = trailNode;
      trailNode!.previous = leadNode;
    }
    length--;
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

  @override
  String toString() {
    return "${head.toString()} length: $length";
  }
}

void main() {
  final myLinkedList = DoublyLinkedList(1);
  myLinkedList.append(2);
  myLinkedList.append(2);
  myLinkedList.prepend(4);
  myLinkedList.insert(2, 5);
  myLinkedList.remove(2);
  myLinkedList.appendAll([6,7,8]);
  print(myLinkedList.toString());
}
