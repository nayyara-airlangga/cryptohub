import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'views/home/home_screen.dart';
import 'views/cryptocurrencies/cryptocurrencies.dart';
import 'views/exchanges/exchanges.dart';
import 'views/news/news.dart';
import 'views/crypto_details/crypto_details.dart';
import 'themes/light_mode.dart';
import 'providers/crypto_news/crypto_news_provider.dart';
import 'providers/cryptos/coins_provider.dart';
import 'providers/cryptos/exchanges_provider.dart';
import 'providers/cryptos/crypto_details_provider.dart';
import 'providers/cryptos/coin_history_provider.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CoinsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CryptoNewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExchangesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CryptoDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CoinHistoryProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CryptoHub',
        theme: lightTheme,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          CryptocurrenciesScreen.routeName: (context) =>
              const CryptocurrenciesScreen(),
          ExchangesScreen.routeName: (context) => const ExchangesScreen(),
          NewsScreen.routeName: (context) => const NewsScreen(),
          CryptoDetailsScreen.routeName: (context) =>
              const CryptoDetailsScreen(),
        },
      ),
    );
  }
}
