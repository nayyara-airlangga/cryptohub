import 'dart:convert';

import '../services/crypto_news_api.dart';
import '../core/crypto_news.dart';

class CryptoNewsHelper {
  final api = CryptoNewsApi();
  static const errorMessage = "An Error Occured";

  Future<List<CryptoNews>> getCryptoNewsHelper(
      String newsCategory, int count) async {
    final res = await api.getCryptoNews(newsCategory, count);
    if (res == errorMessage) {
      return [];
    }

    final data = json.decode(res);
    final List<CryptoNews> cryptoNewsList = data['value'];

    return cryptoNewsList;
  }
}
