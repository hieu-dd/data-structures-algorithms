void selectionSort(List arr) {
  for (int i = 0; i < arr.length; i++) {
    var minIndex = i;
    for (int j = i; j < arr.length; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    if (minIndex != i) {
      final temp = arr[i];
      arr[i] = arr[minIndex];
      arr[minIndex] = temp;
    }
  }
}

void main() {
  final array = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
  selectionSort(array);
  print(array);
}
