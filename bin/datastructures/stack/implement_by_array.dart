class MyStack<E> {
  final List<E> _data = [];

  int get length => _data.length;

  int push(E value) {
    return (_data..add(value)).length;
  }

  E pop() {
    return _data.removeLast();
  }

  E? peek() {
    return _data.isEmpty ? null : _data.last;
  }
}

void main() {
  final myStack = MyStack();
  myStack.push(1);
  myStack.push(2);
  print(myStack.peek());
}
