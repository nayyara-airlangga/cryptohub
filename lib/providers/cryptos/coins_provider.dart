import 'package:cryptohub/models/core/crypto_stats.dart';
import 'package:flutter/foundation.dart';

import '../../models/core/coin.dart';
import '../../models/helpers/cryptos_helper.dart';

class CoinsProvider with ChangeNotifier {
  final helper = CryptosHelper();

  List<Coin?> _coins = [];
  CryptoStats? _cryptoStats;

  List<Coin?> get coins => [..._coins];
  CryptoStats? get cryptoStats => _cryptoStats;

  Future<void> setCoins(int? limit) async {
    final coinList = await helper.getCryptosHelper(limit);
    if (coinList.isEmpty) {
      _coins = [];
      notifyListeners();
    } else {
      _coins = coinList;
      notifyListeners();
    }
  }

  Future<void> setCryptoStats(int? limit) async {
    final cryptoStats = await helper.getCryptoStatsHelper(limit);
    if (cryptoStats == null) {
      _cryptoStats = null;
      notifyListeners();
    } else {
      _cryptoStats = cryptoStats;
      notifyListeners();
    }
  }
}
