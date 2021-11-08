import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiKey = dotenv.env['API_KEY'];

final apiHeaders = {
  "x-rapidapi-host": "coinranking1.p.rapidapi.com",
  "x-rapidapi-key": apiKey as String,
};

const baseUrl = "coinranking1.p.rapidapi.com";

class CryptoApi {
  Future<String> getCryptos(int? limit) async {
    final url = Uri.https(baseUrl, "/coins", {"limit": "$limit"});
    final res = await http.get(url, headers: apiHeaders);

    if (res.statusCode != 200) {
      return "An Error Occured";
    }

    return res.body;
  }

  Future<String> getCryptoDetails(int coinId) async {
    final url = Uri.https(baseUrl, "/coin/$coinId");
    final res = await http.get(url, headers: apiHeaders);

    if (res.statusCode != 200) {
      return "An Error Occured";
    }

    return res.body;
  }

  Future<String> getCryptoHistory(int coinId, String timePeriod) async {
    final url = Uri.https(baseUrl, "/coin/$coinId/history/$timePeriod");
    final res = await http.get(url, headers: apiHeaders);

    if (res.statusCode != 200) {
      return "An Error Occured";
    }

    return res.body;
  }

  Future<String> getExchanges() async {
    final url = Uri.https(baseUrl, "/exchanges");
    final res = await http.get(url, headers: apiHeaders);

    if (res.statusCode != 200) {
      return "An Error Occured";
    }

    return res.body;
  }
}
