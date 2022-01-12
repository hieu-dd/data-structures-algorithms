List quickSort(List arr, int start, int end) {
  if (start >= end) return arr;
  final pivot = arr[end];
  var partitionIndex = start;

  for (int i = start; i < end; i++) {
    if (arr[i] < pivot) {
      final temp = arr[i];
      arr[i] = arr[partitionIndex];
      arr[partitionIndex] = temp;
      partitionIndex++;
    }
  }

  final temp = arr[partitionIndex];
  arr[partitionIndex] = pivot;
  arr[end] = temp;

  quickSort(arr, start, partitionIndex - 1);

  quickSort(arr, partitionIndex + 1, end);

  return arr;
}

void main() {
  final array = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
  print(quickSort(array, 0, array.length - 1));
}
