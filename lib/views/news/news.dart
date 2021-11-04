import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/custom_scaffold.dart';
import '../../providers/crypto_news/crypto_news_provider.dart';
import '../../providers/cryptos/coins_provider.dart';
import '../shared/news_card.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = "/news";

  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future? _cryptoNewsFuture;

  Future? _coinsFuture;

  List<Future> _obtainFutures({String category = "Cryptocurrency"}) {
    return [
      Provider.of<CryptoNewsProvider>(context, listen: false)
          .setCryptoNews(category, 27),
      Provider.of<CoinsProvider>(context, listen: false).setCoins(100),
    ];
  }

  List<String> get getFilteredCategories {
    final filteredCategories = Provider.of<CoinsProvider>(context)
        .coins
        .map((coin) => coin!.name)
        .toList();

    filteredCategories.insert(0, "Cryptocurrency");

    return filteredCategories;
  }

  @override
  void initState() {
    _cryptoNewsFuture = _obtainFutures()[0];
    _coinsFuture = _obtainFutures()[1];
    super.initState();
  }

  String _filterQuery = "Cryptocurrency";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cryptoNewsData = Provider.of<CryptoNewsProvider>(context);
    final newsList = cryptoNewsData.cryptoNewsList;

    return CustomScaffold(
      index: 3,
      body: RefreshIndicator(
        onRefresh: () {
          _cryptoNewsFuture = null;
          _coinsFuture = null;
          _cryptoNewsFuture = _obtainFutures(category: _filterQuery)[0];
          _coinsFuture = _obtainFutures(category: _filterQuery)[1];
          return _cryptoNewsFuture as Future;
        },
        child: FutureBuilder(
          future: _coinsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildCategoriesDropdown(theme);
                }
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: NewsCard(
                    key: ValueKey(
                      newsList[index - 1]!.name.toString(),
                    ),
                    cryptoNews: newsList[index - 1]!,
                    theme: theme,
                  ),
                );
              },
              itemCount: newsList.length + 1,
            );
          },
        ),
      ),
    );
  }

  Container _buildCategoriesDropdown(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 0.2,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                menuMaxHeight: 200,
                elevation: 0,
                dropdownColor: Colors.white,
                icon: const RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 20,
                  ),
                ),
                style: theme.textTheme.bodyText2?.copyWith(
                  color: Colors.black,
                ),
                hint: Text(
                  "Select a category",
                  style: theme.textTheme.bodyText2?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                value: _filterQuery,
                items: getFilteredCategories
                    .map(
                      (filteredCategory) => DropdownMenuItem<String>(
                        value: filteredCategory,
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            filteredCategory,
                            style: theme.textTheme.bodyText2?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _filterQuery = newValue!;
                  });
                  _coinsFuture = _obtainFutures(category: _filterQuery)[0];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
