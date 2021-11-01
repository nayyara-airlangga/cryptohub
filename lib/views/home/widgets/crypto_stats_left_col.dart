import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/core/crypto_stats.dart';

class CryptoStatsLeftCol extends StatelessWidget {
  final CryptoStats cryptoStats;
  const CryptoStatsLeftCol({Key? key, required this.cryptoStats})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Cryptocurrencies:",
            style: theme.textTheme.bodyText2?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            cryptoStats.total.toString(),
            style: theme.textTheme.bodyText1,
          ),
          const SizedBox(height: 40),
          Text(
            "Total Market Cap:",
            style: theme.textTheme.bodyText2?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            NumberFormat.compact().format(cryptoStats.totalMarketCap),
            style: theme.textTheme.bodyText1,
          ),
          const SizedBox(height: 40),
          Text(
            "Total Markets:",
            style: theme.textTheme.bodyText2?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            NumberFormat.compact().format(cryptoStats.totalMarkets),
            style: theme.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
