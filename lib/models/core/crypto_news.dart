import 'dart:collection';

class CryptoNews {
  String name;
  String description;
  String url;
  String datePublished;
  List<dynamic> provider;
  LinkedHashMap<String, dynamic> image;

  CryptoNews({
    required this.name,
    required this.description,
    required this.url,
    required this.datePublished,
    required this.provider,
    required this.image,
  });

  static CryptoNews? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return CryptoNews(
      name: map['name'],
      description: map['description'],
      url: map['url'],
      datePublished: map['datePublished'],
      provider: map['provider'],
      image: map['image'],
    );
  }
}
