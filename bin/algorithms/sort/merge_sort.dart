List mergeSort(List arr) {
  int length = arr.length;
  if (length == 1) return arr;
  final arrLeft = mergeSort(arr.sublist(0, length ~/ 2));
  final arrRight = mergeSort(arr.sublist(length ~/ 2));
  return mergeTwoArray(arrLeft, arrRight);
}

List mergeTwoArray(List arrLeft, List arrRight) {
  final result = [];
  var leftIndex = 0;
  var rightIndex = 0;
  while (leftIndex < arrLeft.length || rightIndex < arrRight.length) {
    if (leftIndex >= arrLeft.length ||
        (rightIndex < arrRight.length &&
            arrRight[rightIndex] < arrLeft[leftIndex])) {
      result.add(arrRight[rightIndex]);
      rightIndex++;
    } else {
      result.add(arrLeft[leftIndex]);
      leftIndex++;
    }
  }
  return result;
}

void main() {
  final array = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
  print(mergeSort(array));
}
