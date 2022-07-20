import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';
import 'package:hishabee_ecommerce/theme1/model/cart/cart_model_class.dart';
import 'package:hishabee_ecommerce/utils.dart';
import 'package:get/get.dart';

import 'product_details.dart';
import '../cart/cart.dart';
import '../login registartion/address_setup.dart';
class HomePage extends StatelessWidget {

  final ProductController _productController = Get.put(ProductController());
  final productInCart = 1.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: primaryColor, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      child: TextFormField(
                        onChanged: (value) {
                          _productController.searchProduct(value);
                        },
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(
                          hintText: "Search For Product",
                          icon: Icon(Icons.search_outlined,color: primaryColor,),
                          hintStyle:
                              TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: 5,
                        right: 5,
                          child: Obx(()=>Text('${_productController.cart.length}',style: TextStyle(
                              color: primaryColor
                          ),),)
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(Cart());
                          },
                          icon:  Icon(Icons.shopping_cart_outlined,
                            color: primaryColor,
                          ),
                      ),
                    ],
                  )
                ],
              ),
              Obx(()=>InkWell(
                onTap: (){
                  Get.to(SetupAddress());
                },
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 100,
                    autoPlay: true,
                  ),
                  items: _productController.shop.value == null ? []: jsonDecode(_productController.shop.value['shop']['sliders']).map<Widget>((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                imageUrl: i,
                              )),
                        );
                      },
                    );
                  }).toList(),
                ),
              )),
              const SizedBox(height: 20,),
              const Text('All Products', style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold
              ),),
              Obx(()=>Expanded(
                child: GridView.builder(
                  controller: _productController.productScrollController.value,
                  itemCount: _productController.searchedProduct.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Card(
                            child: InkWell(
                              onTap: (){
                                Get.to(ProductDetails(productIndex: index,));
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: _productController.searchedProduct[index]['image_url'] == null ||
                                            _productController.searchedProduct[index]['image_url'] == '' ||
                                            _productController.searchedProduct[index]['image_url'] == 'null'
                                          ? Image.asset('assets/placeholders/emptyImage.png'): CachedNetworkImage(
                                          imageUrl: _productController.searchedProduct[index]['image_url'],
                                          height: 70,
                                        ),
                                      ),
                                    ),
                                    Text('${_productController.searchedProduct[index]['name']}',textAlign: TextAlign.center,),

                                    Text('৳${_productController.searchedProduct[index]['selling_price']}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap:(){
                              bool itemFound = false;
                              for(var i=0;i<_productController.cart.length;i++)
                              {
                                if(_productController.cart.isNotEmpty && _productController.searchedProduct[index]['id'] == _productController.cart[i].product['id']){
                                  itemFound = true;
                                  _productController.cart[i].quantity++;
                                  _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[index]['selling_price'];
                                  _productController.shippingCost.value = _productController.shippingCost.value + _productController.searchedProduct[index]['shipping_cost'];
                                  Fluttertoast.showToast(msg: 'Product Number Increased');
                                  break;
                                }else{
                                  print('Item Not Exists');
                                }
                              }
                              if(itemFound == false){
                                _productController.cart.add(CartModelClass(quantity: 1, product: _productController.searchedProduct[index]));
                                _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[index]['selling_price'];
                                _productController.shippingCost.value = _productController.shippingCost.value + _productController.searchedProduct[index]['shipping_cost'];
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
                              // else{
                              //   _productController.cart.add(CartModelClass(quantity: 1, product: _productController.searchedProduct[index]));
                              //   _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[index]['selling_price'];
                              // }


                              // if(_productController.cart.isEmpty){
                              //   _productController.cart.add(CartModelClass(quantity: 1, product: _productController.searchedProduct[index]));
                              //   _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[index]['selling_price'];
                              // }
                              // else{
                              //   for(int i = 0; i<_productController.cart.length;i++){
                              //     if(_productController.cart[i].product['id'] == _productController.searchedProduct[index]['id']){
                              //       Get.defaultDialog(
                              //           title: 'Product is Already Added on the Cart',
                              //           onCancel: (){
                              //             Get.back();
                              //           },
                              //           middleText: ''
                              //       );
                              //       // break;
                              //     }
                              //     if(_productController.cart[i].product['id'] != _productController.searchedProduct[index]['id']){
                              //       _productController.cart.add(CartModelClass(quantity: 1, product: _productController.searchedProduct[index]));
                              //       _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[index]['selling_price'];
                              //       // break;
                              //     }
                              //   }
                              // }
                              // _productController.cart.forEach((element) {
                              //   print(element);
                              //   if(element.contains(_productController.searchedProduct[index])){
                              //     Get.defaultDialog(
                              //         title: 'Product is Already Added on the Cart',
                              //         onCancel: (){
                              //           Get.back();
                              //         },
                              //         middleText: ''
                              //     );
                              //   }else{
                              //     _productController.cart.add(CartModelClass(quantity: 1, product: _productController.searchedProduct[index]));
                              //     _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[index]['selling_price'];
                              //   }
                              // });
                              // print('cart:  ${_productController.cart.contains(_productController.searchedProduct[index])}');
                              // print('cart:  ${_productController.cart[0].product['id']}');
                              // print('product: ${_productController.searchedProduct[index]['id']}');
                              // if(_productController.cart.isEmpty){
                              //   _productController.cart.add(CartModelClass(quantity: 1, product: _productController.searchedProduct[index]));
                              //   _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[index]['selling_price'];
                              // }
                              // for(int i = 0; i<_productController.cart.length;i++){
                              //
                              //   if(_productController.cart[i].product['id'] == _productController.searchedProduct[index]['id']){
                              //     Get.defaultDialog(
                              //         title: 'Product is Already Added on the Cart',
                              //         onCancel: (){
                              //           Get.back();
                              //         },
                              //         middleText: ''
                              //     );
                              //     break;
                              //   }else{
                              //     _productController.cart.add(CartModelClass(quantity: 1, product: _productController.searchedProduct[index]));
                              //     _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[index]['selling_price'];
                              //   }
                              // }
                            },
                            child: Container(
                              decoration:  BoxDecoration(
                                  color: primaryColor,
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text('Add to Cart', style: TextStyle(
                                      fontSize: 10,color: Color(0xFFFFFFFF)
                                  ),),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
