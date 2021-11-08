import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cryptohub/models/cryptos/crypto_info.dart';

class PriceData extends StatelessWidget {
  const PriceData({
    Key? key,
    required this.coin,
    required this.change,
  }) : super(key: key);

  final CryptoInfo coin;
  final double change;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    if (mediaQuery.orientation == Orientation.portrait) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Change in Price: $change%",
                  style: theme.textTheme.headline5?.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Current ${coin.name} Price: \$${NumberFormat.compact().format(
                    double.parse(
                      coin.price,
                    ),
                  )}",
                  style: theme.textTheme.headline5?.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: Text(
              "Change in Price: $change%",
              style: theme.textTheme.headline5?.copyWith(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Current ${coin.name} Price: \$${NumberFormat.compact().format(
                double.parse(
                  coin.price,
                ),
              )}",
              style: theme.textTheme.headline5?.copyWith(
                fontSize: 20,
              ),
            ),
          ),
        ],
      );
    }
  }
}
