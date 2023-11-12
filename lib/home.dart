import 'package:flutter/material.dart';
import 'package:ghost_bank/Screens/account.dart';
import 'package:ghost_bank/Screens/homepage.dart';
import 'package:ghost_bank/Screens/scan.dart';
import 'package:ghost_bank/Screens/transactions.dart';
import 'package:ghost_bank/Screens/wallet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [
    HomePage(),
    const Wallet(),
    const Scan(),
    const Transactions(),
    const Account()
  ];
  int currentNav = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentNav,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentNav = value;
            });
          },
          elevation: 80,
          selectedLabelStyle: const TextStyle(color: Colors.greenAccent),
          selectedItemColor: Colors.green,
          selectedIconTheme: const IconThemeData(),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentNav,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/assets/images/home.png',
                height: 28,
                color: Colors.grey,
              ),
              activeIcon: Image.asset(
                'lib/assets/images/home.png',
                color: Colors.green,
                height: 28,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/assets/images/wallet.png',
                  height: 28,
                  color: Colors.grey,
                ),
                activeIcon: Image.asset(
                  'lib/assets/images/wallet.png',
                  color: Colors.green,
                  height: 28,
                ),
                label: 'Wallet'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/assets/images/scan.png',
                  height: 28,
                  color: Colors.grey,
                ),
                activeIcon: Image.asset(
                  'lib/assets/images/scan.png',
                  color: Colors.green,
                  height: 28,
                ),
                label: 'Scan'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/assets/images/file.png',
                  height: 28,
                  color: Colors.grey,
                ),
                activeIcon: Image.asset(
                  'lib/assets/images/file.png',
                  color: Colors.green,
                  height: 28,
                ),
                label: 'Transactions'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/assets/images/person.png',
                  height: 28,
                  color: Colors.grey,
                ),
                activeIcon: Image.asset(
                  'lib/assets/images/person.png',
                  color: Colors.green,
                  height: 28,
                ),
                label: "Account")
            // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Account'),
          ]),
    );
  }
}
