import 'package:flutter/foundation.dart';

import '../../utils/helpers/cryptos_helper.dart';
import '../../models/cryptos/crypto_info.dart';

class CryptoDetailsProvider extends ChangeNotifier {
  final helper = CryptosHelper();

  CryptoInfo? _cryptoInfo;

  CryptoInfo? get cryptoInfo => _cryptoInfo;

  Future<void> setCryptoInfo(int coinId) async {
    final cryptoInfo = await helper.getCryptoDetailsHelper(coinId);
    if (cryptoInfo == null) {
      _cryptoInfo = null;
      notifyListeners();
    } else {
      _cryptoInfo = cryptoInfo;
      notifyListeners();
    }
  }

  void disposeCryptoInfo() {
    _cryptoInfo = null;
  }
}
