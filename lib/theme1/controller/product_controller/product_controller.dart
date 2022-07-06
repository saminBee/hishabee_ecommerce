import 'package:get/get.dart';
import 'package:hishabee_ecommerce/api_services.dart';
import 'package:hishabee_ecommerce/theme1/model/product/all_products.dart';
import 'package:hishabee_ecommerce/utils.dart';

class ProductController extends GetxController {
  final ApiService _apiService = ApiService();

  final products = [].obs;
  final searchedProduct = [].obs;
  final categories = [].obs;
  final cart = [].obs;

  @override
  void onInit() {
    super.onInit();
    getAllProduct().then((value){
        products.value = value['data'];
        searchedProduct.value = value['data'];
     });
    getAllCategory().then((value){
      categories.value = value;
    });
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


  ///api for get all the products
  Future<dynamic> getAllProduct() async {
    String url = '/online-shop/products?shop_id=$shopId&page=1&category=true';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: null);
  }

  Future<dynamic> getAllCategory() async {
    String url = '/product/product_sub_categories?shop_id=$shopId';
    return await _apiService.makeApiRequest(
        method: apiMethods.get, url: url, body: null, headers: null);
  }
}
