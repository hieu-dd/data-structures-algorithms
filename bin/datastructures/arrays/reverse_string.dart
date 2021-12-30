String reverse(String input) {
  return input.split("").reversed.toList().join("");
}

String reverse1(String input) {
  final backwards = [];
  for (int i = input.length - 1; i >= 0; i--) {
    backwards.add(input[i]);
  }
  return backwards.join("");
}

void main() {
  print(reverse("123456"));
}
