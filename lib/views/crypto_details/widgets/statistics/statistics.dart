import 'package:flutter/material.dart';

import '../../../../models/cryptos/crypto_info.dart';
import 'value_statistics.dart';
import 'other_statistics.dart';

class Statistics extends StatelessWidget {
  const Statistics({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CryptoInfo coin;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (mediaQuery.orientation == Orientation.portrait) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueStatistics(coin: coin),
          const SizedBox(height: 60),
          OtherStatistics(coin: coin),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: ValueStatistics(coin: coin),
          ),
          Expanded(
            child: OtherStatistics(coin: coin),
          ),
        ],
      );
    }
  }
}
