import '../linkedlist/singly_linked_list/implement.dart';

class MyStack<E> {
  final MyLinkedList<E> _data = MyLinkedList();

  int get length => _data.length;

  int push(E value) {
    return (_data..prepend(value)).length;
  }

  int pop() {
    return (_data..remove(0)).length;
  }

  E? peek() {
    return length > 0 ? _data.head?.value : null;
  }
}

void main(){
  final myStack = MyStack();
  myStack.push(1);
  myStack.push(2);
  print(myStack.peek());
}