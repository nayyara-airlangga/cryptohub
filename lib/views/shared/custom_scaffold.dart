import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../cryptocurrencies/cryptocurrencies.dart';
import '../exchanges/exchanges.dart';
import '../news/news.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  final int index;

  const CustomScaffold({Key? key, required this.body, required this.index})
      : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  AppBar _buildAppBar() => AppBar(
        title: const Text('CryptoHub'),
      );

  BottomNavigationBar _buildBottomNavbar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });

          if (_currentIndex == 0) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          } else if (_currentIndex == 1) {
            Navigator.pushReplacementNamed(
                context, CryptocurrenciesScreen.routeName);
          } else if (_currentIndex == 2) {
            Navigator.pushReplacementNamed(context, ExchangesScreen.routeName);
          } else {
            Navigator.pushReplacementNamed(context, NewsScreen.routeName);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Cryptocurrencies",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.autorenew),
            label: "Exchanges",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: "News",
          ),
        ],
      );

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  late int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: widget.body,
      bottomNavigationBar: _buildBottomNavbar(),
    );
  }
}
