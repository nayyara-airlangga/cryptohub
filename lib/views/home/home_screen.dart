import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../shared/custom_scaffold.dart';
import 'widgets/crypto_stats_left_col.dart';
import 'widgets/crypto_stats_right_col.dart';
import '../shared/coin_card.dart';
import '../shared/news_card.dart';
import '../../providers/cryptos/coins_provider.dart';
import '../../providers/crypto_news/crypto_news_provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future? _cryptoStatsFuture;

  Future? _coinsFuture;

  Future? _cryptoNewsListFuture;

  Future _setCryptoNewsListFuture() {
    return Provider.of<CryptoNewsProvider>(context, listen: false)
        .setCryptoNews("Cryptocurrency", 9);
  }

  Future _setCryptoStatsFuture() {
    return Provider.of<CoinsProvider>(context, listen: false)
        .setCryptoStats(10);
  }

  Future _setCoinsFuture() {
    return Provider.of<CoinsProvider>(context, listen: false).setCoins(10);
  }

  @override
  void initState() {
    _cryptoStatsFuture = _setCryptoStatsFuture();
    _coinsFuture = _setCoinsFuture();
    _cryptoNewsListFuture = _setCryptoNewsListFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cryptosData = Provider.of<CoinsProvider>(context);
    final cryptosNewsData = Provider.of<CryptoNewsProvider>(context);
    final cryptoStats = cryptosData.cryptoStats;
    final coins = cryptosData.coins;
    final cryptoNewsList = cryptosNewsData.cryptoNewsList;
    final theme = Theme.of(context);

    return CustomScaffold(
      index: 0,
      body: RefreshIndicator(
        onRefresh: () async {
          _cryptoStatsFuture = null;
          _coinsFuture = null;
          _cryptoNewsListFuture = null;
          _cryptoStatsFuture = _setCryptoStatsFuture();
          _coinsFuture = _setCoinsFuture();
          _cryptoNewsListFuture = _setCryptoNewsListFuture();
          return _coinsFuture as Future;
        },
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Global Crypto Stats",
                  style:
                      theme.textTheme.headline4?.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 40),
                FutureBuilder(
                  future: _cryptoStatsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CryptoStatsLeftCol(cryptoStats: cryptoStats!),
                          CryptoStatsRightCol(cryptoStats: cryptoStats),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(height: 40),
                Text(
                  "The World's Top 10 Cryptocurrencies",
                  style:
                      theme.textTheme.headline4?.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 30),
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else {
                      return SizedBox(
                        child: Column(
                          children: [
                            for (int index = 0; index < coins.length; index++)
                              CoinCard(
                                key: ValueKey(double.parse(
                                    coins[index]!.rank.toString())),
                                coin: coins[index],
                                theme: theme,
                              ),
                          ],
                        ),
                      );
                    }
                  },
                  future: _coinsFuture,
                ),
                const SizedBox(height: 25),
                Text(
                  "Latest Crypto News",
                  style:
                      theme.textTheme.headline4?.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 25),
                FutureBuilder(
                  future: _cryptoNewsListFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else {
                      return SizedBox(
                        child: Column(
                          children: [
                            for (int index = 0;
                                index < cryptoNewsList.length;
                                index++)
                              NewsCard(
                                key: ValueKey(cryptoNewsList[index]!.name),
                                cryptoNews: cryptoNewsList[index]!,
                                theme: theme,
                              ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
