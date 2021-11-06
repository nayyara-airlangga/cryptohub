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

  static Exchanges? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return Exchanges(
      name: map['name'],
      id: map['id'],
      rank: map['rank'],
      iconUrl: map['iconUrl'],
      volume: map['volume'],
      numberOfMarkets: map['numberOfMarkets'],
      marketShare: map['marketShare'],
      description: map['description'],
    );
  }
}
