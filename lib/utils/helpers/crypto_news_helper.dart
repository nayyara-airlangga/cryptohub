import 'dart:convert';

import '../services/crypto_news_api.dart';
import '../../models/crypto_news/crypto_news.dart';

class CryptoNewsHelper {
  final api = CryptoNewsApi();
  static const errorMessage = "An Error Occured";

  Future<List<CryptoNews?>> getCryptoNewsHelper(
    String newsCategory,
    int count,
  ) async {
    final res = await api.getCryptoNews(newsCategory, count);
    if (res == errorMessage) {
      return [];
    }

    final data = json.decode(res) as Map<String, dynamic>;

    final List<CryptoNews?> cryptoNewsList = [];

    for (Map<String, dynamic> news in data['value']) {
      cryptoNewsList.add(
        CryptoNews.fromMap(news),
      );
    }

    return cryptoNewsList;
  }
}
