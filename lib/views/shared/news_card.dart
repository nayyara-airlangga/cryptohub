import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../../models/crypto_news/crypto_news.dart';

const placeholderImageUrl =
    "https://cpng.pikpng.com/pngl/s/550-5506683_rethinking-icon-news-placeholder-clipart.png";

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.cryptoNews,
    required this.theme,
  }) : super(key: key);

  final CryptoNews cryptoNews;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(cryptoNews.url)) {
          launch(
            cryptoNews.url,
            enableJavaScript: true,
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    cryptoNews.name,
                    style: theme.textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.network(
                    cryptoNews.image == null
                        ? placeholderImageUrl
                        : cryptoNews.image?['thumbnail']['contentUrl'],
                    width: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Text(
                    cryptoNews.description,
                    style: theme.textTheme.bodyText2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Image.network(
                  cryptoNews.provider[0]['image'] == null
                      ? placeholderImageUrl
                      : cryptoNews.provider[0]['image']['thumbnail']
                          ['contentUrl'],
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: Text(cryptoNews.provider[0]['name']),
                  fit: FlexFit.tight,
                ),
                const Spacer(),
                Text(
                  timeago.format(
                    DateTime.parse(cryptoNews.datePublished),
                  ),
                  overflow: TextOverflow.visible,
                  style: theme.textTheme.bodyText2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
