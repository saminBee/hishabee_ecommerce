import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hishabee_ecommerce/splash_screen.dart';
import 'package:hishabee_ecommerce/theme1/view/home/home_page.dart';
import 'package:get/get.dart';
import 'package:hishabee_ecommerce/utils.dart';
void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'Hishabee Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        inputDecorationTheme: InputDecorationTheme(

        )
      ),
      home: SplashScreen(),
    );
  }
}
