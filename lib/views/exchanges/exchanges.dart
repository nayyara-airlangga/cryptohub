import 'package:cryptohub/models/core/exchanges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../shared/custom_scaffold.dart';
import '../../providers/cryptos/exchanges_provider.dart';

class ExchangesScreen extends StatefulWidget {
  static const routeName = "/exchanges";

  const ExchangesScreen({Key? key}) : super(key: key);

  @override
  _ExchangesScreenState createState() => _ExchangesScreenState();
}

class _ExchangesScreenState extends State<ExchangesScreen> {
  Future? _exchangesFuture;

  Future _getExchangesFuture() {
    return Provider.of<ExchangesProvider>(context, listen: false)
        .setExchanges();
  }

  @override
  void initState() {
    _exchangesFuture = _getExchangesFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final exchangesData = Provider.of<ExchangesProvider>(context);
    final exchangesList = exchangesData.exchanges;

    return CustomScaffold(
      index: 2,
      body: RefreshIndicator(
        onRefresh: () {
          _exchangesFuture = null;
          _exchangesFuture = _getExchangesFuture();
          return _exchangesFuture as Future;
        },
        child: FutureBuilder(
          future: _exchangesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
            return ListView.builder(
              itemCount: exchangesList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Exchanges",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "24h Trade Volume",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Markets",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Change",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return _buildExchangesRow(exchangesList[index - 1]!, theme);
              },
            );
          },
        ),
      ),
    );
  }

  Container _buildExchangesRow(Exchanges exchanges, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      key: ValueKey(double.parse(exchanges.rank.toString())),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          vertical: BorderSide(
            color: Colors.grey,
            width: 0.4,
          ),
          horizontal: BorderSide(
            color: Colors.grey,
            width: 0.6,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${exchanges.rank}.",
                        style: theme.textTheme.headline6,
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.network(
                        exchanges.iconUrl,
                        width: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    exchanges.name,
                    style: theme.textTheme.headline6,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Text(
              "\$${NumberFormat.compact().format(exchanges.volume)}",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              NumberFormat.compact()
                  .format(
                    exchanges.numberOfMarkets,
                  )
                  .toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              "${NumberFormat.compact().format(
                exchanges.marketShare,
              )}%",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
