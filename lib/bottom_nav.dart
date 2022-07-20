import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hishabee_ecommerce/theme1/controller/login_registration_controller/login_registration_controller.dart';
import 'package:hishabee_ecommerce/theme1/view/category/categories.dart';
import 'package:hishabee_ecommerce/theme1/view/home/home_page.dart';
import 'package:hishabee_ecommerce/theme1/view/login%20registartion/login.dart';
import 'package:hishabee_ecommerce/utils.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  LoginRegistraionController _loginRegistraionController = Get.put(LoginRegistraionController());
  final box = GetStorage();

  static  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Categories(),
    Login(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _loginRegistraionController.selectedIndex.value = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      resizeToAvoidBottomInset: false,
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
            label: 'Profile',
          ),
        ],
        currentIndex: _loginRegistraionController.selectedIndex.value,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[_loginRegistraionController.selectedIndex.value],
    ));
  }
}
