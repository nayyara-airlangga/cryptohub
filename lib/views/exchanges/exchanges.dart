import 'package:flutter/material.dart';

import '../shared/custom_scaffold.dart';

class ExchangesScreen extends StatefulWidget {
  static const routeName = "/exchanges";

  const ExchangesScreen({Key? key}) : super(key: key);

  @override
  _ExchangesScreenState createState() => _ExchangesScreenState();
}

class _ExchangesScreenState extends State<ExchangesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      index: 2,
      body: Container(),
    );
  }
}
