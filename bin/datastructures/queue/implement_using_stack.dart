import '../stack/implement_by_array.dart';

class MyQueue<E> {
  final MyStack<E> _first = MyStack();
  final MyStack<E> _second = MyStack();

  int get length => _first.length == 0 ? _second.length : _first.length;

  void enqueue(E value) {
    if (_second.length > 0) {
      _second.push(value);
    } else {
      _first.push(value);
    }
  }

  E? dequeue() {
    if (_second.length > 0) {
      return _second.pop();
    } else {
      while (_first.length > 1) {
        _second.push(_first.pop());
      }
      return _first.pop();
    }
  }

  E? peek() {
    if (_second.length > 0) {
      return _second.peek();
    } else {
      while (_first.length > 0) {
        _second.push(_first.pop());
      }
      return _second.peek();
    }
  }
}

void main() {
  final myQueue = MyQueue();
  myQueue.enqueue(1);
  myQueue.enqueue(2);
  myQueue.enqueue(3);
  myQueue.dequeue();
  myQueue.enqueue(4);
  myQueue.dequeue();
  print(myQueue.peek());
}
