import 'dart:convert';

import '../services/crypto_api.dart';
import '../core/coin.dart';
import '../core/graph_data.dart';
import '../core/exchanges.dart';

class CryptosHelper {
  final api = CryptoApi();
  static const errorMessage = "An Error Occured";

  Future<List<Coin>> getCryptosHelper(int? limit) async {
    final res = await api.getCryptos(limit);

    if (res == errorMessage) {
      return [];
    }

    final data = json.decode(res);
    final List<Coin> cryptos = data['data']['coins'];

    return cryptos;
  }

  Future<Coin> getCryptoDetailsHelper(int coinId) async {
    final res = await api.getCryptoDetails(coinId);
    if (res == errorMessage) {
      return Coin(
        id: 0,
        uuid: "",
        slug: "",
        symbol: "",
        name: "",
        description: "",
        rank: 0,
        iconUrl: "",
        price: "",
        marketCap: 0,
        change: 0,
      );
    }

    final data = json.decode(res);
    final Coin coin = data['data']['coin'];

    return coin;
  }

  Future<CoinHistory> getCryptoHistory(int coinId, String timePeriod) async {
    final res = await api.getCryptoHistory(coinId, timePeriod);
    if (res == errorMessage) {
      return CoinHistory(change: 0, history: []);
    }

    final data = json.decode(res);
    final CoinHistory coinHistory = data['data'];

    return coinHistory;
  }

  Future<List<Exchanges>> getExchangesHelper() async {
    final res = await api.getExchanges();
    if (res == errorMessage) {
      return [];
    }

    final data = json.decode(res);
    final List<Exchanges> exchanges = data['data']['exchanges'];

    return exchanges;
  }
}
