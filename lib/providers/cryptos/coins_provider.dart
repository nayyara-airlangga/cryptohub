import 'package:flutter/foundation.dart';

import '../../models/core/coin.dart';
import '../../models/helpers/cryptos_helper.dart';

class CoinsProvider with ChangeNotifier {
  final helper = CryptosHelper();

  List<Coin> _coins = [];

  List<Coin> get coins => [..._coins];

  Future<void> setCoins(int limit) async {
    final coinList = await helper.getCryptosHelper(limit);
    if (coinList.isEmpty) {
      _coins = [];
      notifyListeners();
    } else {
      _coins = coinList;
      notifyListeners();
    }
  }
}
