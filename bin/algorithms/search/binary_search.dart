bool binarySearch(List arr, int start, int end, int key) {
  if (arr.isEmpty) return false;
  if (start == end) return arr[start] == key;
  final midIndex = start + (end - start) ~/ 2;
  final middle = arr[midIndex];
  if (middle == key) {
    return true;
  } else if (middle > key) {
    return binarySearch(arr, start, midIndex - 1, key);
  } else {
    return binarySearch(arr, midIndex + 1, end, key);
  }
}

void main() {
  print(binarySearch([1, 2, 3, 4, 5], 0, 4, 6));
}
