import 'package:flutter/cupertino.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:get/get.dart';
import 'package:hishabee_ecommerce/api_services.dart';
import 'package:hishabee_ecommerce/theme1/model/product/all_products.dart';
import 'package:hishabee_ecommerce/theme1/model/shop_response_model/shop_response_model.dart';
import 'package:hishabee_ecommerce/utils.dart';

import '../../model/cart/cart_model_class.dart';

class ProductController extends GetxController {
  final ApiService _apiService = ApiService();

  final products = [].obs;
  final searchedProduct = [].obs;
  final categories = [].obs;
  final cart = <dynamic>[].obs;
  final categorizedProduct = [].obs;
  final totalCartValue = 0.0.obs;
  final shippingCost = 0.0.obs;
  final shop = Rxn<dynamic>();

  // final cartPackage = FlutterCart();

  ///page
  final pageNumber = 1.obs;
  final lastPage = 0.obs;

  @override
  void onInit() async {
    super.onInit();

    ///get shop response model
    await getShopResponseModel().then((value){
      shop.value = value;
    });
    ///get all product
    await getAllProduct(pageNumber: pageNumber.value).then((value){
      lastPage.value = value['last_page'];
        products.value = value['data'];
        searchedProduct.value = value['data'];
     });

    ///get all category
    await getAllCategory().then((value){
      categories.value = value;
    });
    productScrollController.value = ScrollController()..addListener(_scrollListener);
  }

  ///scroll controller
  final productScrollController = ScrollController().obs;
  void _scrollListener() {
    print(productScrollController.value.position.extentAfter);
    if (productScrollController.value.position.extentAfter == 0.0) {
      if(lastPage.value != pageNumber.value){
        getAllProduct(pageNumber: ++pageNumber.value).then((value){
          products.addAll(value['data']);
          searchedProduct.addAll(value['data']);

          // searchProductListCount.value = searchProductListCount.value +
          //     getOnlineProductListModelFromJson(value['data']).length;

        });
      }
    }
  }

  ///search products
  searchProduct(String searchTextFieldText){
    List result = [];
    if (searchTextFieldText.isEmpty) {
      result = products.value;
    } else {
      result = products.value
          .where((item) =>
          item['name']
              .toLowerCase()
              .contains(searchTextFieldText.toLowerCase()))
          .toList();
      print(result);
    }
    searchedProduct.value = result;
  }

  ///all shop response model
  Future<dynamic> getShopResponseModel() async {
    String url = '/subscription/verify?shop_id=$shopId';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: null);
  }
  ///api for get all the products
  Future<dynamic> getAllProduct({pageNumber}) async {
    String url = '/online-shop/products?shop_id=$shopId&page=$pageNumber&category=true';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: null);
  }

  Future<dynamic> getAllCategory() async {
    String url = '/product/product_sub_categories?shop_id=$shopId';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: null);
  }

  ///categorized product search
  Future<dynamic> getCategorizedProduct(id) async {
    String url = '/product/product_by_sub_categories?shop_id=$shopId&ids=[$id]&page=1';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: null);
  }
}
