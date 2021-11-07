import 'package:flutter/material.dart';

class DetailsDivider extends StatelessWidget {
  const DetailsDivider({Key? key}) : super(key: key);

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
