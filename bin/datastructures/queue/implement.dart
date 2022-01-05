import '../linkedlist/singly_linked_list/implement.dart';

class MyQueue<E> {
  final MyLinkedList<E> _data = MyLinkedList();

  int get length => _data.length;

  int enqueue(E value) {
    return (_data..append(value)).length;
  }

  int dequeue() {
    return (_data..remove(0)).length;
  }

  E? peek() {
    return _data.head?.value;
  }
}

void main(){
  final myQueue = MyQueue();
  myQueue.enqueue(1);
  myQueue.enqueue(2);
  print(myQueue.peek());
}
