import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hishabee_ecommerce/theme1/view/category/categories.dart';
import 'package:hishabee_ecommerce/theme1/view/home/home_page.dart';
import 'package:hishabee_ecommerce/theme1/view/login%20registartion/login.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final box = GetStorage();
  int _selectedIndex = 0;
  static  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Categories(),
    Login(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
