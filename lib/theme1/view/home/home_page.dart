import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';
import 'package:hishabee_ecommerce/theme1/model/cart/cart_model_class.dart';
import 'package:hishabee_ecommerce/utils.dart';
import 'package:get/get.dart';

import '../cart/cart.dart';
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
                              Border.all(color: Color(0xFF185ADB).withOpacity(.35), width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      child: TextFormField(
                        onChanged: (value) {
                          _productController.searchProduct(value);
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Search For Product",
                          icon: Icon(Icons.search_outlined),
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
                  )
                ],
              ),
              Obx(()=>CarouselSlider(
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
                  gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
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

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap:(){

                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: hish_blue
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text('Details', style: TextStyle(
                                            fontSize: 10,color: Colors.white
                                          ),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap:(){
                                      _productController.cart.add(CartModelClass(quantity: 1, product: _productController.searchedProduct[index]));
                                      _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.searchedProduct[index]['selling_price'];
                                      print('cart: ${_productController.cart[0]}');
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.orange
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text('Add to Cart', style: TextStyle(
                                              fontSize: 10
                                          ),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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
