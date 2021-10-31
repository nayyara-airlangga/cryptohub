import 'package:flutter/foundation.dart';

import '../../models/helpers/cryptos_helper.dart';
import '../../models/core/crypto_info.dart';

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
      _cryptoInfo = CryptoInfo(
        name: cryptoInfo.name,
        description: cryptoInfo.description,
        iconUrl: cryptoInfo.iconUrl,
        links: cryptoInfo.links,
        slug: cryptoInfo.slug,
        price: cryptoInfo.price,
        rank: cryptoInfo.rank,
        volume: cryptoInfo.volume,
        marketCap: cryptoInfo.marketCap,
        allTimeHigh: cryptoInfo.allTimeHigh,
        numberOfMarkets: cryptoInfo.numberOfMarkets,
        numberOfExchanges: cryptoInfo.numberOfExchanges,
        approvedSupply: cryptoInfo.approvedSupply,
        totalSupply: cryptoInfo.totalSupply,
        circulatingSupply: cryptoInfo.circulatingSupply,
      );
      notifyListeners();
    }
  }
}
