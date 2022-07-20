import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';
import 'package:hishabee_ecommerce/utils.dart';

import '../../view/cart/cart.dart';
import '../cart/cart_model_class.dart';

class ProductDetails extends StatelessWidget {
  int? productIndex;
  ProductDetails({this.productIndex});

  final ProductController _productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3D8E8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: [
                Positioned(
                    top: 5,
                    right: 5,
                    child: Obx(()=>Text('${_productController.cart.length}',style: TextStyle(
                        color: hish_blue.withOpacity(.7)
                    ),),)
                ),
                IconButton(
                  onPressed: () {
                    Get.to(Cart());
                  },
                  icon:  Icon(Icons.shopping_cart_outlined,
                    color: hish_blue.withOpacity(.7),
                  ),
                ),
              ],
            ),
          )
        ],
        leading: SizedBox(
          height: 40,
          width: 40,
          child: IconButton(
            icon: Icon(Icons.arrow_back_outlined,color: Colors.black,),
            onPressed: (){
              Get.back();
            },
          ),
        ),
      ),
      body:  SafeArea(
          child:  Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _productController.searchedProduct[productIndex!]['image_url'] == null ||
                      _productController.searchedProduct[productIndex!]['image_url'] == '' ||
                      _productController.searchedProduct[productIndex!]['image_url'] == 'null'
                      ? AspectRatio(
                    aspectRatio: 1,
                      child: Center(child: Image.asset('assets/placeholders/emptyImage.png',height: 300,width: 300,))):
                  AspectRatio(
                    aspectRatio: 1,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          // height: 200,
                          // width: MediaQuery.of(context).size.width,
                          imageUrl: _productController.searchedProduct[productIndex!]['image_url'],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${_productController.searchedProduct[productIndex!]['name']}',  style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600
                            ),),
                            Text('In Stock: ${_productController.searchedProduct[productIndex!]['stock']}')
                          ],
                        ),
                      ),
                      // SizedBox(height: 20,),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                        child: Text('Details: ', style: TextStyle(
                          fontSize: 18
                        ),),
                      ),
                      SizedBox(height: 10,),
                       Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
                        child: _productController.searchedProduct[productIndex!]['description'] == null ? const Text('[Not Given]', style: TextStyle(
                            fontSize: 18
                        ),):
                        Text('${_productController.searchedProduct[productIndex!]['description']}', style: TextStyle(
                            fontSize: 18
                        ),),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xFFD3D8E8),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Price: ৳${_productController.searchedProduct[productIndex!]['selling_price']}',style: const TextStyle(
                                      fontSize: 18
                                    ),),
                                    const SizedBox(height: 20,),

                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: InkWell(
                                    onTap: (){
                                      bool itemFound = false;
                                      for(var i=0;i<_productController.cart.length;i++)
                                      {
                                        if(_productController.cart.isNotEmpty && _productController.searchedProduct[productIndex!]['id'] == _productController.cart[i].product['id']){
                                          itemFound = true;
                                          _productController.cart[i].quantity++;
                                          _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[productIndex!]['selling_price'];
                                          _productController.shippingCost.value = _productController.shippingCost.value + _productController.searchedProduct[productIndex!]['shipping_cost'];
                                          Fluttertoast.showToast(msg: 'Product Number Increased');
                                          break;
                                        }else{
                                          print('Item Not Exists');
                                        }
                                      }
                                      if(itemFound == false){
                                        _productController.cart.add(CartModelClass(quantity: 1, product: _productController.searchedProduct[productIndex!]));
                                        _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[productIndex!]['selling_price'];
                                        _productController.shippingCost.value = _productController.shippingCost.value + _productController.searchedProduct[productIndex!]['shipping_cost'];
                                        Fluttertoast.showToast(msg: 'Product Added');
                                        // print(itemFound);
                                        // print(itemFound);
                                        // Get.defaultDialog(
                                        //     title: 'Product is Already Added on the Cart',
                                        //     onCancel: (){
                                        //       Get.back();
                                        //     },
                                        //     middleText: ''
                                        // );
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: hish_blue,
                                          borderRadius: BorderRadius.circular(6)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Add to Cart',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white
                                          ),),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
