import 'package:flutter/material.dart';

import '../../views/shared/custom_scaffold.dart';

class CryptocurrenciesScreen extends StatefulWidget {
  static const routeName = "/cryptocurrencies";

  const CryptocurrenciesScreen({Key? key}) : super(key: key);

  @override
  State<CryptocurrenciesScreen> createState() => _CryptocurrenciesScreenState();
}

class _CryptocurrenciesScreenState extends State<CryptocurrenciesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      index: 1,
      body: Container(),
    );
  }
}
