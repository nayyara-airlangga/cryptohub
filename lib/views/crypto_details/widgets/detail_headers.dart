import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/cryptos/crypto_info.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
    required this.coin,
    required this.theme,
  }) : super(key: key);

  final CryptoInfo coin;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.network(
          coin.iconUrl,
          height: 40,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            "${coin.name} (${coin.slug})",
            style: theme.textTheme.headline3?.copyWith(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
