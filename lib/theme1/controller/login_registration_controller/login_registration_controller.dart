import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../api_services.dart';
import '../../../utils.dart';

class LoginRegistraionController extends GetxController{

  final ApiService _apiService = ApiService();
  final flagPassword = 0.obs;
  final mobileNumberTextEditingController = TextEditingController().obs;
  final passwordTextEditingController = TextEditingController().obs;
  final profileDetails = Rxn<dynamic>();
  final box = GetStorage();

  @override
  void onInit() async {
    profileDetailsFunction().then((value){
      profileDetails.value = value;
    });
    super.onInit();
  }

  ///login
  Future<dynamic> login({password,mobile}) async {
    String url = '/customer/login?mobile_number=$mobile&password=$password&shop_id=$shopId';
    return await _apiService.makeApiRequest(
        method: apiMethods.post, url: url, body: null, headers: null);
  }

  ///registration
  Future<dynamic> registration({password, name, mobile, email}) async {
    String url = '/customer/register?password=$password&name=$name&'
        'mobile_number=$mobile&email=$email&shop_id=$shopId';
    return await _apiService.makeApiRequest(
        method: apiMethods.post, url: url, body: null, headers: null);
  }

  ///profile details
  Future<dynamic> profileDetailsFunction() async {
    String url = '/customer/profile';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: {'Authorization': 'Bearer ${box.read('token')}'});
  }

}