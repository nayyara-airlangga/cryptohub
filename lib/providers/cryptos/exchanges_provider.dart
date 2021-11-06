import 'package:flutter/foundation.dart';

import '../../utils/helpers/cryptos_helper.dart';
import '../../models/cryptos/exchanges.dart';

class ExchangesProvider with ChangeNotifier {
  final helper = CryptosHelper();

  List<Exchanges?> _exchanges = [];

  List<Exchanges?> get exchanges => [..._exchanges];

  Future<void> setExchanges() async {
    final exchanges = await helper.getExchangesHelper();

    if (exchanges.isEmpty) {
      _exchanges = [];
      notifyListeners();
    } else {
      _exchanges = exchanges;
      notifyListeners();
    }
  }
}
