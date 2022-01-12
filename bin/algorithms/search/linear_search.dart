bool linearSearch<E>(List arr, E value) {
  for (E e in arr) {
    if (e == value) return true;
  }
  return false;
}

void main(){
  print(linearSearch([1,2,3], 3));
}
