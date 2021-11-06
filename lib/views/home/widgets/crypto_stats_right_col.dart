import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/cryptos/crypto_stats.dart';

class CryptoStatsRightCol extends StatelessWidget {
  final CryptoStats cryptoStats;

  const CryptoStatsRightCol({Key? key, required this.cryptoStats})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Exchanges:",
            style: theme.textTheme.bodyText2?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            cryptoStats.totalExchanges.toString(),
            style: theme.textTheme.bodyText1,
          ),
          const SizedBox(height: 40),
          Text(
            "Total 24h Volume:",
            style: theme.textTheme.bodyText2?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            NumberFormat.compact().format(cryptoStats.total24hVolume),
            style: theme.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
