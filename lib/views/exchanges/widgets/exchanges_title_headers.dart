import 'package:flutter/material.dart';

class ExchangesTitleHeaders extends StatelessWidget {
  const ExchangesTitleHeaders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Row(
        children: const [
          Expanded(
            child: Text(
              "Exchanges",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              "24h Trade Volume",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              "Markets",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              "Change",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
