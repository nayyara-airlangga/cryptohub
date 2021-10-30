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
}
