import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../models/core/exchanges.dart';

class ExchangesRow extends StatefulWidget {
  const ExchangesRow({
    Key? key,
    required this.exchanges,
    required this.theme,
  }) : super(key: key);

  final Exchanges exchanges;
  final ThemeData theme;

  @override
  _ExchangesRowState createState() => _ExchangesRowState();
}

class _ExchangesRowState extends State<ExchangesRow> {
  bool _isClicked = false;

  @override
  void initState() {
    exchanges = widget.exchanges;
    theme = widget.theme;
    super.initState();
  }

  late Exchanges exchanges;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = !_isClicked;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              key: ValueKey(double.parse(exchanges.rank.toString())),
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                border: const Border.symmetric(
                  vertical: BorderSide(
                    color: Colors.grey,
                    width: 0.4,
                  ),
                  horizontal: BorderSide(
                    color: Colors.grey,
                    width: 0.6,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${exchanges.rank}.",
                                style: theme.textTheme.headline6,
                              ),
                              const SizedBox(width: 10),
                              SvgPicture.network(
                                exchanges.iconUrl,
                                width: 30,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            exchanges.name,
                            style: theme.textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "\$${NumberFormat.compact().format(exchanges.volume)}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      NumberFormat.compact()
                          .format(
                            exchanges.numberOfMarkets,
                          )
                          .toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${NumberFormat.compact().format(
                        exchanges.marketShare,
                      )}%",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              child: _isClicked
                  ? Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border.symmetric(
                          vertical: BorderSide(
                            color: Colors.grey,
                            width: 0.4,
                          ),
                          horizontal: BorderSide(
                            color: Colors.grey,
                            width: 0.6,
                          ),
                        ),
                      ),
                      child: Html(data: exchanges.description ?? ""),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
