import 'package:flutter/material.dart';

class StatisticsDivider extends StatelessWidget {
  const StatisticsDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 10),
        Divider(
          color: Colors.grey,
          thickness: 0.5,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
