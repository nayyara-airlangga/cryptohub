class GraphData {
  CoinHistory? coinHistory;
  String coinName;
  String currentPrice;

  GraphData({
    this.coinHistory,
    required this.coinName,
    required this.currentPrice,
  });
}

class CoinHistory {
  double change;
  List<Map<String, dynamic>> history;

  CoinHistory({
    required this.change,
    required this.history,
  });
}
