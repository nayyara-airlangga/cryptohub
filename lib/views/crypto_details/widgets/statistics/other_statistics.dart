import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/cryptos/crypto_info.dart';
import '../shared/details_row.dart';
import '../shared/details_divider.dart';

class OtherStatistics extends StatelessWidget {
  const OtherStatistics({
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
                "Other Statistics",
                style: theme.textTheme.headline4?.copyWith(
                  color: Colors.blue,
                  fontSize: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          DetailsRow(
            icon: const Icon(Icons.trending_up),
            statsName: "Number of Markets",
            child: Text(
              coin.numberOfMarkets.toString(),
              style: theme.textTheme.headline5?.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          const DetailsDivider(),
          DetailsRow(
            icon: const Icon(Icons.work_outline),
            statsName: "Number Of Exchanges",
            child: Text(
              coin.numberOfExchanges.toString(),
              style: theme.textTheme.headline5?.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          const DetailsDivider(),
          DetailsRow(
            icon: const RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.info_outline),
            ),
            statsName: "Approved Supply",
            child: coin.approvedSupply
                ? const Icon(Icons.check)
                : const Icon(Icons.close),
          ),
          const DetailsDivider(),
          DetailsRow(
            icon: const RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.info_outline),
            ),
            statsName: "Total Supply",
            child: Text(
              "\$ ${NumberFormat.compact().format(
                double.parse(
                  coin.totalSupply.toString(),
                ),
              )}",
              style: theme.textTheme.headline5?.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          const DetailsDivider(),
          DetailsRow(
            icon: const RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.info_outline),
            ),
            statsName: "Circulating Supply",
            child: Text(
              "\$ ${NumberFormat.compact().format(
                coin.circulatingSupply,
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
