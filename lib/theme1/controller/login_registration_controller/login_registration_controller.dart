import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hishabee_ecommerce/_utils_directory/dialog.dart';

import '../../../api_services.dart';
import '../../../utils.dart';

class LoginRegistraionController extends GetxController{

  final ApiService _apiService = ApiService();
  final flagPassword = 0.obs;
  final mobileNumberTextEditingController = TextEditingController().obs;
  final passwordTextEditingController = TextEditingController().obs;
  final profileDetails = Rxn<dynamic>();
  final box = GetStorage();
  final selectedIndex = 0.obs;

  ///shipping address list and
  final allSelectedArea = [].obs;
  final area = [].obs;
  final districtId = 0.obs;
  final areaId = 0.obs;
  final divisionId = 0.obs;
  final divisionName = 'Division'.obs;
  final areaName = 'Area'.obs;
  final districtName = 'District'.obs;
  @override
  void onInit() async {
    await profileDetailsFunction().then((value){
      profileDetails.value = value;
    });

    await getAllArea().then((value){
      area.value = value;
    });

    await getAllSelectedArea().then((value){
      allSelectedArea.value = value;
      print('selected Area : ${allSelectedArea.value}');
    });
    super.onInit();
  }



  ///login
  Future<dynamic> login({password,mobile}) async {
    CustomDialog.showLoadingDialog(message: 'Please wait');
    String url = '/customer/login?mobile_number=$mobile&password=$password&shop_id=$shopId';
    return await _apiService.makeApiRequest(
        method: apiMethods.post, url: url, body: null, headers: null);
  }

  ///registration
  Future<dynamic> registration({password, name, mobile, email}) async {
    CustomDialog.showLoadingDialog(message: 'Creating Profile');
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

  ///area
  Future<dynamic> getAllArea() async {
    String url = '/area/all';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: null);
  }
  Future<dynamic> getAllSelectedArea() async {
    String url = '/customer/shipping_address';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: {'Authorization': 'Bearer ${box.read('token')}'});
  }

}