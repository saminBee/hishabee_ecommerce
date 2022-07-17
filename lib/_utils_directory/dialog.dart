import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hishabee_ecommerce/utils.dart';

class CustomDialog{
  static void showLoadingDialog({String? message}) {
    Get.defaultDialog(
      radius: 4.0,
      title: "",
      barrierDismissible: false,
      content: Container(
        height: 85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/placeholders/bee.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                  const SpinKitFadingCircle(
                    color: hish_blue,
                    //size: 0.0,
                  ),
                ],
              ),
            ),
            message == null
                ? Container()
                : Text(
              message.capitalizeFirst!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: hish_blue,
                  fontFamily: 'Roboto',
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}