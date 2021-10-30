import 'package:flutter/foundation.dart';

import '../../models/core/graph_data.dart';
import '../../models/helpers/cryptos_helper.dart';

class CoinHistoryProvider with ChangeNotifier {
  final int coinId;
  final String timePeriod;
  final helper = CryptosHelper();

  CoinHistoryProvider({required this.coinId, required this.timePeriod});

  CoinHistory? _coinHistory;

  CoinHistory? get coinHistory => _coinHistory;

  Future<void> setCoinHistory() async {
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
