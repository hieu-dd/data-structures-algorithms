class Graph {
  Map<int, List<int>> adjacentList = {};

  void addVertex(int node) {
    adjacentList.putIfAbsent(node, () => []);
  }

  void addEdge(int node1, int node2) {
    // undirected graph
    adjacentList[node1]?.add(node2);
    adjacentList[node2]?.add(node1);
  }
}

void main() {
  // Adjacent Matrix
  const graph = [
    [0, 1, 0, 0, 1],
    [1, 0, 1, 1, 1],
    [0, 1, 0, 1, 0],
    [0, 1, 1, 0, 1],
    [1, 1, 0, 1, 0]
  ];
}
