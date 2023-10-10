import 'package:flutter/material.dart';
import 'package:foodie_app/screen/main/nav/cart/cart_screen.dart';
import 'package:foodie_app/screen/main/nav/home/home_screen.dart';
import 'package:foodie_app/screen/main/nav/profile/profile_screen.dart';
import 'package:foodie_app/theme/theme_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        selectedItemColor: primaryColorED6E1B,
        selectedLabelStyle: const TextStyle(color: primaryColorED6E1B),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: "Account"),
        ],
      ),
      body: _switchPagesOnIndex(_currentPageIndex)
    );
  }

  _switchPagesOnIndex(int index) {
    switch(index) {
      case 0: {
        return const HomeScreen();
      }
      case 1 : {
        return const CartScreen();
      }
      case 2: {
        return const ProfileScreen();
      }
    }
  }
}