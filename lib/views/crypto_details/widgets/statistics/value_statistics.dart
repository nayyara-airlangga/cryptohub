import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/cryptos/crypto_info.dart';
import 'shared/statistics_divider.dart';
import 'shared/statistics_row.dart';

class ValueStatistics extends StatelessWidget {
  const ValueStatistics({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CryptoInfo coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Value Statistics",
                style: theme.textTheme.headline4?.copyWith(
                  color: Colors.blue,
                  fontSize: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          StatisticsRow(
            icon: const Icon(
              Icons.monetization_on_outlined,
            ),
            statsName: "Price to USD",
            child: Text(
              "\$ ${NumberFormat.compact().format(
                double.parse(
                  coin.price,
                ),
              )}",
              style: theme.textTheme.headline5?.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          const StatisticsDivider(),
          StatisticsRow(
            icon: const Icon(Icons.tag),
            statsName: "Rank",
            child: Text(
              coin.rank.toString(),
              style: theme.textTheme.headline5?.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          const StatisticsDivider(),
          StatisticsRow(
            icon: const Icon(
              Icons.watch_later_outlined,
            ),
            statsName: "24h Volume",
            child: Text(
              "\$ ${NumberFormat.compact().format(
                double.parse(
                  coin.volume.toString(),
                ),
              )}",
              style: theme.textTheme.headline5?.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          const StatisticsDivider(),
          StatisticsRow(
            icon: const Icon(
              Icons.monetization_on_outlined,
            ),
            statsName: "Market Cap",
            child: Text(
              "\$ ${NumberFormat.compact().format(
                double.parse(
                  coin.marketCap.toString(),
                ),
              )}",
              style: theme.textTheme.headline5?.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          const StatisticsDivider(),
          StatisticsRow(
            icon: const Icon(
              Icons.trending_up_outlined,
            ),
            statsName: "All Time High",
            child: Text(
              "\$ ${NumberFormat.compact().format(
                double.parse(
                  coin.allTimeHigh['price'],
                ),
              )}",
              style: theme.textTheme.headline5?.copyWith(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
