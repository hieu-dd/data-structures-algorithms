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
  var length = 0;

  MyLinkedList(E value) {
    head = Node(value, null);
    tail = head;
    length = 1;
  }

  Node append(value) {
    final newNode = Node(value, null);
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
    final newNode = Node(value, head);
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
      final leadNode = get(index - 1);
      final newNode = Node(value, leadNode!.next);
      leadNode.next = newNode;
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
      final leadNode = get(index - 1);
      final removeNode = leadNode!.next;
      leadNode.next = removeNode!.next;
      removeNode.next = null;
    }
    length--;
    return head;
  }

  Node? get(int index) {
    var count = 0;
    var temp = head;
    while (count != index) {
      temp = temp!.next;
      count++;
    }
    return temp;
  }

  Node? reverse() {
    if (length == 1) {
      return head;
    }
    var first = head;
    var second = first!.next;
    while (second != null) {
      var temp = second.next;
      second.next = first;
      first = second;
      second = temp;
    }
    head!.next = null;
    head = first;
    return head;
  }

  @override
  String toString() {
    return head.toString();
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
