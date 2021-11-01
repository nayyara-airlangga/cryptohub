import 'dart:convert';

import '../services/crypto_api.dart';
import '../core/coin.dart';
import '../core/graph_data.dart';
import '../core/exchanges.dart';
import '../core/crypto_info.dart';
import '../core/crypto_stats.dart';

class CryptosHelper {
  final api = CryptoApi();
  static const errorMessage = "An Error Occured";

  Future<List<Coin?>> getCryptosHelper(int? limit) async {
    final res = await api.getCryptos(limit);

    if (res == errorMessage) {
      return [];
    }

    final data = json.decode(res) as Map<String, dynamic>;

    final List<Coin?> cryptos = [];

    for (Map<String, dynamic> coin in data['data']['coins']) {
      cryptos.add(Coin.fromMap(coin));
    }

    return cryptos;
  }

  Future<CryptoStats?> getCryptoStatsHelper(int? limit) async {
    final res = await api.getCryptos(limit);

    if (res == errorMessage) {
      return null;
    }

    final data = json.decode(res) as Map<String, dynamic>;
    final CryptoStats cryptoStats = CryptoStats.fromMap(data['data']['stats'])!;

    return cryptoStats;
  }

  Future<CryptoInfo?> getCryptoDetailsHelper(int coinId) async {
    final res = await api.getCryptoDetails(coinId);
    if (res == errorMessage) {
      return null;
    }

    final data = json.decode(res);
    final CryptoInfo coin = data['data']['coin'];

    return coin;
  }

  Future<CoinHistory?> getCryptoHistoryHelper(
    int coinId,
    String timePeriod,
  ) async {
    final res = await api.getCryptoHistory(coinId, timePeriod);
    if (res == errorMessage) {
      return null;
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
