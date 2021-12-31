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
    _data[address]!.add(KeyValue(key.toString(), value));
  }

  dynamic get(key) {
    final address = _hash(key);
    final bucket = _data[address];
    try {
      return bucket?.firstWhere((element) => element.hasKey(key)).value;
    } catch (error) {
      return null;
    }
  }

  List<dynamic> keys() {
    return _data
        .toList()
        .expand(
            (element) => ((element ?? <KeyValue>[]).map((e) => e.key).toList()))
        .toList();
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

  bool hasKey(dynamic key) => this.key == key.toString();

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
  print(myHash.get("key5"));
  print(myHash.keys());
}
