void bubbleSort(List<int> arr) {
  var length = arr.length;
  for (int i = 0; i < length; i++) {
    for (int j = 0; j < length - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        var temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void main() {
  final array = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
  bubbleSort(array);
  print(array);
}
