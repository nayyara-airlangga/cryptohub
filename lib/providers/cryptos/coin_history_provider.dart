import 'package:flutter/foundation.dart';

import '../../models/core/graph_data.dart';
import '../../models/helpers/cryptos_helper.dart';

class CoinHistoryProvider with ChangeNotifier {
  final helper = CryptosHelper();

  CoinHistory? _coinHistory;

  CoinHistory? get coinHistory => _coinHistory;

  Future<void> setCoinHistory(int coinId, String timePeriod) async {
    final coinHistory = await helper.getCryptoHistoryHelper(coinId, timePeriod);
    if (coinHistory == null) {
      _coinHistory = null;
      notifyListeners();
    } else {
      _coinHistory = CoinHistory(
        change: coinHistory.change,
        history: coinHistory.history,
      );
    }
  }
}
