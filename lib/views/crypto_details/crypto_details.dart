import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../providers/cryptos/crypto_details_provider.dart';
import '../../providers/cryptos/coin_history_provider.dart';
import '../../models/cryptos/graph_data.dart';
import 'widgets/detail_headers.dart';
import 'widgets/price_data.dart';
import 'widgets/statistics/statistics.dart';
import 'widgets/coin_description.dart';
import 'widgets/crypto_links.dart';
import 'widgets/price_chart.dart';
import 'utils/format_date.dart';
import 'utils/format_price.dart';
import 'utils/time.dart';

class CryptoDetailsScreen extends StatefulWidget {
  static const routeName = "/crypto-details";

  const CryptoDetailsScreen({Key? key}) : super(key: key);

  @override
  _CryptoDetailsScreenState createState() => _CryptoDetailsScreenState();
}

class _CryptoDetailsScreenState extends State<CryptoDetailsScreen> {
  late int coinId;

  String timePeriod = "7d";

  Future? _cryptoInfoFuture;

  Future? _coinHistoryFuture;

  List<Future> _obtainFutures({String timePeriod = "7d"}) {
    return [
      Provider.of<CryptoDetailsProvider>(context, listen: false)
          .setCryptoInfo(coinId),
      Provider.of<CoinHistoryProvider>(context, listen: false)
          .setCoinHistory(coinId, timePeriod),
    ];
  }

  @override
  void initState() {
    Provider.of<CryptoDetailsProvider>(context, listen: false)
        .disposeCryptoInfo();
    Provider.of<CoinHistoryProvider>(context, listen: false)
        .disposeCoinHistory();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    coinId = ModalRoute.of(context)?.settings.arguments as int;

    Provider.of<CryptoDetailsProvider>(context, listen: false)
        .setCryptoInfo(coinId);
    Provider.of<CoinHistoryProvider>(context, listen: false)
        .setCoinHistory(coinId, timePeriod);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinData = Provider.of<CryptoDetailsProvider>(context);
    final coinHistoryData = Provider.of<CoinHistoryProvider>(context);
    final coin = coinData.cryptoInfo;
    final changeRate = coinHistoryData.coinHistory?.change;
    final historyList = coinHistoryData.coinHistory?.history
        .map(
          (history) => GraphData(
            date: formatDate(
              history['timestamp'],
            ),
            price: formatPrice(
              history['price'],
            ),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoHub'),
      ),
      body: coin == null || historyList == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : RefreshIndicator(
              onRefresh: () {
                _cryptoInfoFuture = null;
                _coinHistoryFuture = null;
                _cryptoInfoFuture = _obtainFutures(timePeriod: timePeriod)[0];
                _coinHistoryFuture = _obtainFutures(timePeriod: timePeriod)[1];
                return _cryptoInfoFuture as Future;
              },
              child: FutureBuilder(
                future: _coinHistoryFuture,
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
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              _buildPeriodDropdown(theme),
                            ],
                          ),
                          const SizedBox(height: 20),
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
                          PriceData(
                            coin: coin,
                            change: changeRate!,
                          ),
                          const SizedBox(height: 30),
                          PriceChart(historyList: historyList),
                          const SizedBox(height: 30),
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

  Container _buildPeriodDropdown(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          menuMaxHeight: 200,
          elevation: 0,
          dropdownColor: Colors.white,
          icon: const RotatedBox(
            quarterTurns: 3,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
            ),
          ),
          style: theme.textTheme.bodyText2?.copyWith(
            color: Colors.black,
          ),
          hint: Text(
            "Select a time period",
            style: theme.textTheme.bodyText2?.copyWith(
              color: Colors.grey,
            ),
          ),
          value: timePeriod,
          items: times
              .map(
                (time) => DropdownMenuItem<String>(
                  value: time,
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      time,
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (String? newValue) {
            setState(() {
              timePeriod = newValue!;
            });
            _coinHistoryFuture = null;
            _coinHistoryFuture = _obtainFutures(
              timePeriod: timePeriod,
            )[1];
          },
        ),
      ),
    );
  }
}
