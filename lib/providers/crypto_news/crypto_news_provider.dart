import 'package:flutter/foundation.dart';

import '../../models/core/crypto_news.dart';
import '../../models/helpers/crypto_news_helper.dart';

class CryptoNewsProvider with ChangeNotifier {
  final helper = CryptoNewsHelper();

  List<CryptoNews> _cryptoNewsList = [];

  List<CryptoNews> get cryptoNewsList => [..._cryptoNewsList];

  Future<void> setCryptoNews(String newsCategory, int count) async {
    final cryptoNewsList =
        await helper.getCryptoNewsHelper(newsCategory, count);
    if (cryptoNewsList.isEmpty) {
      _cryptoNewsList = [];
      notifyListeners();
    } else {
      _cryptoNewsList = cryptoNewsList;
      notifyListeners();
    }
  }
}
