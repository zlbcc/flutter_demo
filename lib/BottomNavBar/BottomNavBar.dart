import 'package:flutter/material.dart';
import '../pages/email/email.dart';
import '../pages/shop/shop.dart';
import '../pages/home/home.dart';

import '../EachView/eachView.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _bottomNavBarState createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<BottomNavBar> {
  final _buttonColor = Colors.blue;

  List<Widget> list = [];
  int _currentIndex = 0;
  List<Widget> _eachView = [];
  // int _eachViewIndex = 0;

  // @override
  initState() {
    list //
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(ShopScreen());

    _eachView
      ..add(EachView('home'))
      ..add(EachView('email'))
      ..add(EachView('shop'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _buttonColor,
            ),
            title: Text(
              'home',
              style: TextStyle(color: _buttonColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _buttonColor,
            ),
            title: Text(
              'email',
              style: TextStyle(color: _buttonColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
              color: _buttonColor,
            ),
            title: Text(
              'shop',
              style: TextStyle(color: _buttonColor),
            ),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
