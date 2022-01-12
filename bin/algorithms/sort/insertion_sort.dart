void insertionSort(List arr) {
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] < arr[i - 1]) {
      for (int j = 0; j < i; j++) {
        if (arr[i] < arr[j]) {
          arr.insert(j, arr.removeAt(i));
          break;
        }
      }
    }
  }
}

void main() {
  final array = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
  insertionSort(array);
  print(array);
}
