class CryptoInfo {
  String name;
  String description;
  String iconUrl;
  List<CryptoLink> links;
  String slug;
  String price;
  int rank;
  int volume;
  int marketCap;
  Map<dynamic, String> allTimeHigh;
  int numberOfMarkets;
  int numberOfExchanges;
  bool approvedSupply;
  int totalSupply;
  int circulatingSupply;

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
  });
}

class CryptoLink {
  String name;
  String type;
  String url;

  CryptoLink({
    required this.name,
    required this.type,
    required this.url,
  });
}
