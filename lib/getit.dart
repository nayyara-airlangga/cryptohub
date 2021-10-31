import 'package:get_it/get_it.dart';

import 'providers/cryptos/coins_provider.dart';
import 'providers/cryptos/crypto_details_provider.dart';
import 'providers/cryptos/coin_history_provider.dart';
import 'providers/cryptos/exchanges_provider.dart';
import 'providers/crypto_news/crypto_news_provider.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CoinsProvider>(CoinsProvider());
  getIt.registerSingleton<CryptoDetailsProvider>(CryptoDetailsProvider());
  getIt.registerSingleton<CoinHistoryProvider>(CoinHistoryProvider());
  getIt.registerSingleton<ExchangesProvider>(ExchangesProvider());
  getIt.registerSingleton<CryptoNewsProvider>(CryptoNewsProvider());
}
