import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cryptos/crypto_details_provider.dart';
import 'widgets/detail_headers.dart';
import 'widgets/price_data.dart';
import 'widgets/statistics/statistics.dart';
import 'widgets/coin_description.dart';
import 'widgets/crypto_links.dart';

class CryptoDetailsScreen extends StatefulWidget {
  static const routeName = "/crypto-details";

  const CryptoDetailsScreen({Key? key}) : super(key: key);

  @override
  _CryptoDetailsScreenState createState() => _CryptoDetailsScreenState();
}

class _CryptoDetailsScreenState extends State<CryptoDetailsScreen> {
  late int coinId;

  Future? _cryptoInfofuture;

  Future _obtainCryptoInfoFuture() {
    return Provider.of<CryptoDetailsProvider>(context, listen: false)
        .setCryptoInfo(coinId);
  }

  @override
  void initState() {
    Provider.of<CryptoDetailsProvider>(context, listen: false)
        .disposeCryptoInfo();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    coinId = ModalRoute.of(context)?.settings.arguments as int;

    Provider.of<CryptoDetailsProvider>(context, listen: false)
        .setCryptoInfo(coinId);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinData = Provider.of<CryptoDetailsProvider>(context);
    final coin = coinData.cryptoInfo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoHub'),
      ),
      body: coin == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : RefreshIndicator(
              onRefresh: () {
                _cryptoInfofuture = null;
                _cryptoInfofuture = _obtainCryptoInfoFuture();
                return _cryptoInfofuture as Future;
              },
              child: FutureBuilder(
                future: _cryptoInfofuture,
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
                      key: ValueKey(coin.rank),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          DetailsHeader(coin: coin, theme: theme),
                          const SizedBox(height: 15),
                          const Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "${coin.name} Price Chart",
                                  style: theme.textTheme.headline3?.copyWith(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          PriceData(coin: coin),
                          const SizedBox(height: 60),
                          Statistics(coin: coin),
                          const SizedBox(height: 60),
                          coin.description != null
                              ? CoinDescription(coin: coin)
                              : Container(),
                          const SizedBox(height: 20),
                          CryptoLinks(coin: coin),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
