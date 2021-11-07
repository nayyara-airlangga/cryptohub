import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/cryptos/crypto_info.dart';

class CoinDescription extends StatelessWidget {
  const CoinDescription({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CryptoInfo coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            bottom: 10,
          ),
          child: Text(
            "What is ${coin.name}?",
            style: theme.textTheme.headline4?.copyWith(
              fontSize: 26,
              color: Colors.blue,
            ),
          ),
        ),
        Html(
          key: ValueKey(coin.rank),
          data: coin.description,
          onLinkTap: (url, _, __, ___) async {
            if (url != null && await canLaunch(url)) {
              await launch(
                url,
                enableJavaScript: true,
              );
            }
          },
          style: {
            "h3": Style(
              fontSize: const FontSize(
                26,
                units: "px",
              ),
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
            ),
            "p": Style(
              fontSize: const FontSize(
                18,
                units: "px",
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
            ),
          },
        ),
      ],
    );
  }
}
