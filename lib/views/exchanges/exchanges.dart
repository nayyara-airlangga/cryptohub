import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/custom_scaffold.dart';
import '../../providers/cryptos/exchanges_provider.dart';
import 'widgets/exchanges_row.dart';
import 'widgets/exchanges_title_headers.dart';

class ExchangesScreen extends StatefulWidget {
  static const routeName = "/exchanges";

  const ExchangesScreen({Key? key}) : super(key: key);

  @override
  _ExchangesScreenState createState() => _ExchangesScreenState();
}

class _ExchangesScreenState extends State<ExchangesScreen> {
  Future? _exchangesFuture;

  Future _getExchangesFuture() {
    return Provider.of<ExchangesProvider>(context, listen: false)
        .setExchanges();
  }

  @override
  void initState() {
    _exchangesFuture = _getExchangesFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final exchangesData = Provider.of<ExchangesProvider>(context);
    final exchangesList = exchangesData.exchanges;

    return CustomScaffold(
      index: 2,
      body: RefreshIndicator(
        onRefresh: () {
          _exchangesFuture = null;
          _exchangesFuture = _getExchangesFuture();
          return _exchangesFuture as Future;
        },
        child: FutureBuilder(
          future: _exchangesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
            return ListView.builder(
              itemCount: exchangesList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const ExchangesTitleHeaders();
                }
                return ExchangesRow(
                  exchanges: exchangesList[index - 1]!,
                  theme: theme,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
