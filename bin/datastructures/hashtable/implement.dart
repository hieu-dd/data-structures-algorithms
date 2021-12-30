class MyHashTable {
  final int size;

  late final List<List<KeyValue>?> _data;

  MyHashTable(this.size) {
    _data = List.filled(size, null);
  }

  int _hash(dynamic key) {
    var hash = 0;
    key.toString().runes.forEach((element) {
      hash += element;
    });
    return hash % size;
  }

  void set(key, value) {
    final address = _hash(key);
    if (_data[address] == null) {
      _data[address] = [];
    }
    _data[address]!.add(KeyValue(key, value));
  }

  dynamic get(key) {
    final address = _hash(key);
    final bucket = _data[address];
    return bucket?.firstWhere((element) => element.key == key).value;
  }

  @override
  String toString() {

    return _data.toString();
  }
}

class KeyValue {
  final String key;
  final dynamic value;

  KeyValue(this.key, this.value);
  @override
  String toString() {
    return "{key:$key,value:$value}";
  }
}

void main() {
  final myHash = MyHashTable(2);
  myHash.set("key1", 1);
  myHash.set("key2", 2);
  myHash.set("key3", "a");
  myHash.set("key4", "b");
  print(myHash.toString());
  print(myHash.get("key1"));
}
