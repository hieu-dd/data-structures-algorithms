List mergeSortedArrays(List arr1, List arr2) {
  final result = [];
  var left = 0;
  var right = 0;
  while (left < arr1.length || right < arr2.length) {
    if (right >= arr2.length ||
        (left < arr1.length && arr1[left] <= arr2[right])) {
      result.add(arr1[left]);
      left++;
    } else {
      result.add(arr2[right]);
      right++;
    }
  }
  return result;
}

void main() {
  print(mergeSortedArrays(
    [2, 4],
    [1, 3, 5, 7],
  ));
}
