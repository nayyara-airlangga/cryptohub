import 'package:flutter/foundation.dart';

import '../../models/crypto_news/crypto_news.dart';
import '../../../utils/helpers/crypto_news_helper.dart';

class CryptoNewsProvider with ChangeNotifier {
  final helper = CryptoNewsHelper();

  List<CryptoNews?> _cryptoNewsList = [];

  List<CryptoNews?> get cryptoNewsList => [..._cryptoNewsList];

  Future<void> setCryptoNews(String newsCategory, int count) async {
    final cryptoNews = await helper.getCryptoNewsHelper(newsCategory, count);
    if (cryptoNews.isEmpty) {
      _cryptoNewsList = [];
      notifyListeners();
    } else {
      _cryptoNewsList = cryptoNews;
      notifyListeners();
    }
  }
}
