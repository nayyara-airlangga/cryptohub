import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiKey = dotenv.env['API_KEY'];

final apiHeaders = {
  "x-bingapis-sdk": "true",
  "x-rapidapi-host": "bing-news-search1.p.rapidapi.com",
  "x-rapidapi-key": apiKey as String,
};

const baseUrl = "bing-news-search1.p.rapidapi.com";

class CryptoNewsApi {
  Future<String> getCryptoNews(String newsCategory, int count) async {
    final url = Uri.https(baseUrl,
        "/news/search?q=$newsCategory&safeSearch=Off&textFormat=Raw&freshness=Day&count=$count");
    final res = await http.get(url, headers: apiHeaders);

    if (res.statusCode != 200) {
      return "An Error Occured";
    }

    return res.body;
  }
}
