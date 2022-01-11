int findFactorialRecursive(int n) {
  if (n == 0) return 0;
  if (n == 1) return 1;
  return n * findFactorialRecursive(n - 1);
}
int findFactorialIterative(int n){
  var answer = 1;
  for(int i= 2;i<=n;i++){
    answer *= i;
  }
  return answer;
}
void main(){
  print(findFactorialRecursive(0));
  print(findFactorialRecursive(1));
  print(findFactorialRecursive(4));
  print(findFactorialIterative(4));
}
