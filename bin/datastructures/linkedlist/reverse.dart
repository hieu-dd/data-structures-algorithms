import 'singly_linked_list/implement.dart';

void main() {
  final myLinkedList = MyLinkedList(1);
  myLinkedList.appendAll([2, 3, 4, 5, 6]);
  print(myLinkedList.reverse());
}
