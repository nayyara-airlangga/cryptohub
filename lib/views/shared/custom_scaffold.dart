import 'package:flutter/material.dart';

import 'bottom_navbar.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;

  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  AppBar _buildAppBar() => AppBar(
        title: const Text('CryptoHub'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: widget.body,
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
