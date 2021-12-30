class MyArray<T> {
  var length = 0;
  Map<int, T> data = {};

  T get(index) {
    if (data[index] == null) {
      throw Exception("");
    }
    return data[index]!;
  }

  int push(T item) {
    data[length] = item;
    return ++length;
  }

  T pop() {
    final lastItem = data[length - 1];
    data.remove(length - 1);
    length--;
    return lastItem!;
  }

  T delete(int index) {
    final item = data[index];
    if (item == null) {
      throw Exception("");
    }
    for (var i = index; i < length - 1; i++) {
      data[i] = data[i + 1]!;
    }
    data.remove(length - 1);
    return item;
  }

  @override
  String toString() {
    var result = "[";
    data.forEach((key, value) {
      result+="{${key}:${value}},";
    });
    result+="]";
    return result;
  }
}

void main(){
  final newArray = MyArray<int>();
  newArray.push(1);
  newArray.push(2);
  newArray.push(3);
  newArray.push(4);
  newArray.push(5);
  newArray.push(6);
  newArray.pop();
  newArray.delete(2);
  print(newArray.toString());
}
