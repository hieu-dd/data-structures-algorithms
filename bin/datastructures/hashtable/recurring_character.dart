import 'implement.dart';

int? firstRecurringCharacter(List<int> arr) {
  for (var i = 0; i < arr.length - 1; i++) {
    for (var j = i + 1; j < arr.length; j++) {
      if (arr[i] == arr[j]) {
        return arr[i];
      }
    }
  }
  return null;
} // O(n^2)

int? secondRecurringCharacter(List<int> arr) {
  final myHash = MyHashTable(50);
  for (var i = 0; i < arr.length; i++) {
    if (myHash.get(arr[i]) != null) {
      return arr[i];
    } else {
      myHash.set(arr[i], i);
    }
  }
  return null;
} // O(n)

void main() {
  print(firstRecurringCharacter([1, 2, 3]));
  print(secondRecurringCharacter([1, 2, 3, 1]));
}
