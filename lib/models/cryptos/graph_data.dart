class GraphData {
  final String price;
  final String date;

  GraphData({required this.price, required this.date});
}

class CoinHistory {
  double change;
  List<dynamic> history;

  CoinHistory({
    required this.change,
    required this.history,
  });

  static CoinHistory? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return CoinHistory(
      change: map['change'],
      history: map['history'],
    );
  }
}
