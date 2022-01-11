int fibonacciRecusion(int n) {
  if (n == 0) return 0;
  if (n == 1) return 1;
  return fibonacciRecusion(n - 1) + fibonacciRecusion(n - 2);
}

int fibonacciIterative(int n) {
  var fibonacci1 = 0;
  var fibonacci2 = 1;
  for (int i = 2; i < n; i++) {
    var temp = fibonacci2;
    fibonacci2 += fibonacci1;
    fibonacci1 = temp;
  }
  return fibonacci1 + fibonacci2;
}

void main() {
  print(fibonacciRecusion(7));
  print(fibonacciIterative(7));

}
