import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (newIndex) {
        setState(() {
          currentIndex = newIndex;
        });

        switch (newIndex) {
          case 0:
            Navigator.pushReplacementNamed(context, "/");
            break;

          default:
            break;
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
  }
}
