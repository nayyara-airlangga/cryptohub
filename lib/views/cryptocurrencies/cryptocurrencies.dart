import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../views/shared/custom_scaffold.dart';
import '../../providers/cryptos/coins_provider.dart';
import '../shared/coin_card.dart';

class CryptocurrenciesScreen extends StatefulWidget {
  static const routeName = "/cryptocurrencies";

  const CryptocurrenciesScreen({Key? key}) : super(key: key);

  @override
  State<CryptocurrenciesScreen> createState() => _CryptocurrenciesScreenState();
}

class _CryptocurrenciesScreenState extends State<CryptocurrenciesScreen> {
  Future? _cryptosFuture;

  Future _obtainCryptosFuture() {
    return Provider.of<CoinsProvider>(context, listen: false).setCoins(100);
  }

  @override
  void initState() {
    _cryptosFuture = _obtainCryptosFuture();
    super.initState();
  }

  final TextEditingController _filterSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cryptosData = Provider.of<CoinsProvider>(context);
    final coins = cryptosData.coins;
    final filteredCoins = coins.where((coin) {
      if (_filterSearch.text.isEmpty) return true;
      return coin!.name
          .toLowerCase()
          .contains(_filterSearch.text.toLowerCase());
    }).toList();

    return CustomScaffold(
      index: 1,
      body: RefreshIndicator(
        onRefresh: () {
          _cryptosFuture = null;
          _cryptosFuture = _obtainCryptosFuture();
          return _cryptosFuture as Future;
        },
        child: FutureBuilder(
            future: _cryptosFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      _buildSearchBar(),
                      const SizedBox(height: 40),
                      for (int index = 0; index < filteredCoins.length; index++)
                        CoinCard(
                          key: ValueKey(double.parse(
                              filteredCoins[index]!.rank.toString())),
                          coin: filteredCoins[index],
                          theme: theme,
                        ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Row _buildSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          color: Colors.white,
          width: 300,
          height: 40,
          child: TextField(
            onChanged: (change) {
              setState(() {});
            },
            textAlignVertical: TextAlignVertical.bottom,
            controller: _filterSearch,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              hintText: "Search Cryptocurrency",
            ),
          ),
        ),
      ],
    );
  }
}
