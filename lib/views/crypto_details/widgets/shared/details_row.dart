import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    Key? key,
    this.icon,
    required this.statsName,
    required this.child,
  }) : super(key: key);

  final Widget? icon;
  final String statsName;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        icon ?? Container(),
        const SizedBox(width: 10),
        Text(
          statsName,
          style: theme.textTheme.bodyText2?.copyWith(fontSize: 18),
        ),
        const Spacer(),
        child,
      ],
    );
  }
}
