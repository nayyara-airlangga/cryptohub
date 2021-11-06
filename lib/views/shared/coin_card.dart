import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/core/coin.dart';
import '../../views/crypto_details/crypto_details.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    Key? key,
    required this.coin,
    required this.theme,
  }) : super(key: key);

  final Coin? coin;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          CryptoDetailsScreen.routeName,
          arguments: coin!.id,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${coin!.rank}. ${coin!.name}",
                  style: theme.textTheme.headline6,
                ),
                SvgPicture.network(
                  coin!.iconUrl,
                  height: 45,
                  width: 45,
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(
              thickness: 0.8,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Price: ${NumberFormat.compact().format(double.parse(coin!.price))} USD",
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "Market Cap: ${NumberFormat.compact().format(coin!.marketCap)} USD",
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "Daily Change: ${coin!.change}% USD",
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
