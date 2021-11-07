import 'dart:collection';

class CryptoInfo {
  String name;
  String? description;
  String iconUrl;
  List<dynamic> links;
  String slug;
  String price;
  int rank;
  int volume;
  int marketCap;
  LinkedHashMap<String, dynamic> allTimeHigh;
  int numberOfMarkets;
  int numberOfExchanges;
  bool approvedSupply;
  double totalSupply;
  double circulatingSupply;
  double change;

  CryptoInfo({
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.links,
    required this.slug,
    required this.price,
    required this.rank,
    required this.volume,
    required this.marketCap,
    required this.allTimeHigh,
    required this.numberOfMarkets,
    required this.numberOfExchanges,
    required this.approvedSupply,
    required this.totalSupply,
    required this.circulatingSupply,
    required this.change,
  });

  static CryptoInfo? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return CryptoInfo(
      name: map['name'],
      description: map['description'],
      iconUrl: map['iconUrl'],
      links: map['links'],
      slug: map['slug'],
      price: map['price'],
      rank: map['rank'],
      volume: map['volume'],
      marketCap: map['marketCap'],
      allTimeHigh: map['allTimeHigh'],
      numberOfMarkets: map['numberOfMarkets'],
      numberOfExchanges: map['numberOfExchanges'],
      approvedSupply: map['approvedSupply'],
      totalSupply: double.parse(map['totalSupply'].toString()),
      circulatingSupply: double.parse(map['circulatingSupply'].toString()),
      change: double.parse(map['change'].toString()),
    );
  }
}
