class Exchanges {
  String name;
  int id;
  int rank;
  String iconUrl;
  double volume;
  int numberOfMarkets;
  double marketShare;
  String? description;

  Exchanges({
    required this.name,
    required this.id,
    required this.rank,
    required this.iconUrl,
    required this.volume,
    required this.numberOfMarkets,
    required this.marketShare,
    this.description,
  });
}
