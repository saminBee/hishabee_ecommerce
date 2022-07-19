import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hishabee_ecommerce/api_services.dart';
import 'package:hishabee_ecommerce/utils.dart';

import '../../../_utils_directory/dialog.dart';

class CheckoutController extends GetxController{
  ApiService _apiService = ApiService();
  final box = GetStorage();
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;

  final division = ''.obs;
  final divisionId = 0.obs;

  final district = ''.obs;
  final districtId = 0.obs;

  final subDistrict = ''.obs;
  final subDistrictId = 0.obs;

  final address = ''.obs;
  final postalCode = ''.obs;
  final mobileNumber = ''.obs;

  final districtWiseDivision = [].obs;
  final divisionWiseArea = [].obs;
  ///add shipping address
  Future<dynamic> addShippingAddress({areaId, districtId, divisionId,address}) async {
    CustomDialog.showLoadingDialog(message: 'Please wait');
    String url = '/customer/shipping_address?shop_id=$shopId&area_id=$areaId&'
        'district_id=$districtId&division_id=$divisionId&address=$address';
    return await _apiService.makeApiRequest(
        method: apiMethods.post, url: url, body: null, headers: {'Authorization': 'Bearer ${box.read('token')}'});
  }

  Future<dynamic> getShippingAddress({areaId, districtId, divisionId}) async {
    CustomDialog.showLoadingDialog(message: 'Please wait');
    String url = '/customer/shipping_address';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: {'Authorization': 'Bearer ${box.read('token')}'});
  }

  Future<dynamic> getAllDistrict({id}) async {
    // CustomDialog.showLoadingDialog(message: 'Please wait');
    String url = '/area/division/$id';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: {'Authorization': 'Bearer ${box.read('token')}'});
  }

  Future<dynamic> getAllArea({id}) async {
    // CustomDialog.showLoadingDialog(message: 'Please wait');
    String url = '/area/district/$id';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: {'Authorization': 'Bearer ${box.read('token')}'});
  }
}