class CryptoNews {
  String name;
  String description;
  String url;
  String datePublished;
  List<CryptoNewsCompany> provider;
  Map<String, Map<String, String>> image;

  CryptoNews({
    required this.name,
    required this.description,
    required this.url,
    required this.datePublished,
    required this.provider,
    required this.image,
  });
}

class CryptoNewsCompany {
  String name;
  Map<String, Map<String, String>> image;

  CryptoNewsCompany({
    required this.name,
    required this.image,
  });
}
