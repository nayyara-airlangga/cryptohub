import 'dart:convert';

class Coin {
  int id;
  String uuid;
  String slug;
  String symbol;
  String name;
  String description;
  int rank;
  String iconUrl;
  String price;
  int marketCap;
  double change;

  Coin({
    required this.id,
    required this.uuid,
    required this.slug,
    required this.symbol,
    required this.name,
    required this.description,
    required this.rank,
    required this.iconUrl,
    required this.price,
    required this.marketCap,
    required this.change,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uuid': uuid,
      'slug': slug,
      'symbol': symbol,
      'name': name,
      'description': description,
      'rank': rank,
      'iconUrl': iconUrl,
      'price': price,
      'marketCap': marketCap,
      'change': change,
    };
  }

  static Coin? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Coin(
      id: map['id'],
      uuid: map['uuid'],
      slug: map['slug'],
      symbol: map['symbol'],
      name: map['name'],
      description: map['description'],
      rank: map['rank'],
      iconUrl: map['iconUrl'],
      price: map['price'],
      marketCap: map['marketCap'],
      change: map['change'],
    );
  }

  String toJson() => json.encode(toMap());

  static Coin? fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Coin(id: $id, uuid, $uuid, slug: $slug, symbol: $symbol, name: $name, description: $description, rank: $rank, iconUrl: $iconUrl, price: $price, marketCap: $marketCap, change: $change)';
  }
}
