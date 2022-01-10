class Graph {
  int numberOfNodes = 0;
  Map<int, List<int>> adjacentList = {};

  void addVertex(int node) {
    adjacentList[node] = [];
    numberOfNodes++;
  }

  void addEdge(int node1, int node2) {
    // undirected graph
    adjacentList[node1]?.add(node2);
    adjacentList[node2]?.add(node1);
  }
}
