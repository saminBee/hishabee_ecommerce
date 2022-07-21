import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';
import 'package:get/get.dart';

import '../../../utils.dart';
import '../../model/cart/cart_model_class.dart';
import '../home/product_details.dart';
import '../cart/cart.dart';
class CategorizedProduct extends StatefulWidget {
  int? categoryId;
  String? categoryName;

  CategorizedProduct({this.categoryId, this.categoryName});

  @override
  State<CategorizedProduct> createState() => _CategorizedProductState();
}

class _CategorizedProductState extends State<CategorizedProduct> {
  ProductController _productController = Get.find();


  @override
  void initState() {
    _productController.getCategorizedProduct(widget.categoryId).then((value){
      _productController.categorizedProduct.value = value['data'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title:  Text('${widget.categoryName} Product'),
        backgroundColor: primaryColor,
        actions: [
          Stack(
            children: [
              Positioned(
                  top: 5,
                  right: 5,
                  child: Obx(()=>Text('${_productController.cart.length}',style: TextStyle(
                      color: Colors.orange.withOpacity(.7)
                  ),),)
              ),
              IconButton(
                onPressed: () {
                  Get.to(Cart());
                },
                icon:  Icon(Icons.shopping_cart_outlined,
                  color: Colors.orange.withOpacity(.7),
                ),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Obx(()=>Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
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
        )),
      ),
    );
  }
}
