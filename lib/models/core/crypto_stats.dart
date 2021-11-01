class CryptoStats {
  int total;
  int offset;
  int limit;
  String order;
  String base;
  int totalMarkets;
  int totalExchanges;
  double totalMarketCap;
  double total24hVolume;

  CryptoStats({
    required this.total,
    required this.offset,
    required this.limit,
    required this.order,
    required this.base,
    required this.totalMarkets,
    required this.totalExchanges,
    required this.totalMarketCap,
    required this.total24hVolume,
  });

  static CryptoStats? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return CryptoStats(
      total: map['total'],
      offset: map['offset'],
      base: map['base'],
      limit: map['limit'],
      order: map['order'],
      totalMarkets: map['totalMarkets'],
      totalExchanges: map['totalExchanges'],
      totalMarketCap: map['totalMarketCap'],
      total24hVolume: map['total24hVolume'],
    );
  }
}
