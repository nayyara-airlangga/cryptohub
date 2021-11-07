import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'shared/details_row.dart';
import 'shared/details_divider.dart';
import '../../../models/cryptos/crypto_info.dart';

class CryptoLinks extends StatelessWidget {
  const CryptoLinks({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CryptoInfo coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Links about ${coin.name}",
                style: theme.textTheme.headline4?.copyWith(
                  color: Colors.blue,
                  fontSize: 26,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          for (final link in coin.links)
            Column(
              children: [
                DetailsRow(
                  statsName:
                      "${link['type'][0].toUpperCase()}${link['type'].substring(1)}",
                  child: GestureDetector(
                    onTap: () async {
                      if (link['url'] != null && await canLaunch(link['url'])) {
                        await launch(
                          link['url'],
                          enableJavaScript: true,
                        );
                      }
                    },
                    child: Text(
                      link['name'],
                      style: theme.textTheme.headline5?.copyWith(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const DetailsDivider(),
              ],
            ),
        ],
      ),
    );
  }
}
