import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController{
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final division = ''.obs;
  final district = ''.obs;
  final subDistrict = ''.obs;
  final address = ''.obs;
  final postalCode = ''.obs;
  final mobileNumber = ''.obs;
}