import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:hishabee_ecommerce/theme1/view/cart/shiping_info.dart';
import 'package:hishabee_ecommerce/utils.dart';

import 'delivery_info.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final ProductController _productController = Get.find();

  @override
  // void initState() {
  //   for(int i = 0;i<_productController.cart.length;i++){
  //     totalCartValue.value = totalCartValue.value + _productController.cart[i].product['selling_price'];
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Cart'),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Obx(() => ListView.builder(
                    itemCount: _productController.cart.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    _productController
                                                .cart[index].product['image_url'] ==
                                            null
                                        ? Container(
                                            height: 100,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Image.asset(
                                              'assets/placeholders/emptyImage.png',
                                              fit: BoxFit.fill,
                                            ))
                                        : Container(
                                            height: 100,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    '${_productController.cart[index].product['image_url']}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                    Positioned(
                                        top: 0,
                                        right: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(.35),
                                              shape: BoxShape.circle,
                                            ),
                                            child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _productController.totalCartValue
                                                        .value = _productController
                                                            .totalCartValue.value -
                                                        (_productController
                                                                    .cart[index]
                                                                    .product[
                                                                'selling_price'] *
                                                            _productController
                                                                .cart[index]
                                                                .quantity);
                                                    _productController.shippingCost
                                                        .value = _productController
                                                            .shippingCost.value -
                                                        (_productController
                                                                    .cart[index]
                                                                    .product[
                                                                'shipping_cost'] *
                                                            _productController
                                                                .cart[index]
                                                                .quantity);
                                                    _productController.cart
                                                        .removeAt(index);
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.dangerous,
                                                  color: Colors.black54,
                                                )),
                                          ),
                                        )),
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (_productController
                                                              .cart[index].quantity >
                                                          1) {
                                                        --_productController
                                                            .cart[index].quantity;
                                                        // if(_productController.cart[index].quantity == 0){
                                                        //   _productController.cart.remove(_productController.cart[index].product);
                                                        // }
                                                        _productController
                                                                .totalCartValue
                                                                .value =
                                                            _productController
                                                                    .totalCartValue
                                                                    .value -
                                                                _productController
                                                                        .cart[index]
                                                                        .product[
                                                                    'selling_price'];
                                                        _productController
                                                                .shippingCost.value =
                                                            _productController
                                                                    .shippingCost
                                                                    .value -
                                                                _productController
                                                                        .cart[index]
                                                                        .product[
                                                                    'shipping_cost'];
                                                      }
                                                    });
                                                  },
                                                  child: Icon(Icons.remove)),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                  '${_productController.cart[index].quantity}'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    ++_productController
                                                        .cart[index].quantity;
                                                    _productController.totalCartValue
                                                        .value = _productController
                                                            .totalCartValue.value +
                                                        _productController.cart[index]
                                                            .product['selling_price'];
                                                    _productController.shippingCost
                                                        .value = _productController
                                                            .shippingCost.value +
                                                        _productController.cart[index]
                                                            .product['shipping_cost'];
                                                  });
                                                },
                                                child: Icon(Icons.add),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${_productController.cart[index].product['name']}',
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w700),
                                    ),
                                    Obx(() => Text(
                                          '৳ ${_productController.cart[index].product['selling_price'] * _productController.cart[index].quantity}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                      // for(int i = 0; i<_productController.cart.length;i++){
                      //   if(_productController.cart[index]['name'] > 1){
                      //
                      //   }
                      // }
                      // return Card(
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Expanded(child: Text('${_productController.cart[index].product['name']}')),
                      //           Expanded(
                      //             flex: 2,
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                   child: Row(
                      //                     children: [
                      //                       IconButton(
                      //                           onPressed: () {
                      //
                      //                             setState((){
                      //                               if(_productController.cart[index].quantity > 1){
                      //                                 --_productController.cart[index].quantity;
                      //                                 // if(_productController.cart[index].quantity == 0){
                      //                                 //   _productController.cart.remove(_productController.cart[index].product);
                      //                                 // }
                      //                                 _productController.totalCartValue.value = _productController.totalCartValue.value - _productController.cart[index].product['selling_price'];
                      //                                 _productController.shippingCost.value = _productController.shippingCost.value - _productController.cart[index].product['shipping_cost'];
                      //                               }
                      //                             });
                      //
                      //                           },
                      //                           icon: const Icon(Icons.remove_circle_outline)),
                      //                       Text('${_productController.cart[index].quantity}'),
                      //                       IconButton(
                      //                           onPressed: () {
                      //                             setState((){
                      //                               ++_productController.cart[index].quantity;
                      //                               _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.cart[index].product['selling_price'];
                      //                               _productController.shippingCost.value = _productController.shippingCost.value + _productController.cart[index].product['shipping_cost'];
                      //                             });
                      //                             print(_productController.cart[index].quantity);
                      //                           },
                      //                           icon: const Icon(Icons.add_circle_outline_sharp)),
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 Obx(()=> Text('৳ ${
                      //                     _productController.cart[index].product['selling_price'] * _productController.cart[index].quantity
                      //                 }')),
                      //                 IconButton(
                      //                     onPressed: (){
                      //                       setState((){
                      //
                      //                         _productController.totalCartValue.value =
                      //                             _productController.totalCartValue.value - (_productController.cart[index].product['selling_price'] * _productController.cart[index].quantity);
                      //                         _productController.shippingCost.value = _productController.shippingCost.value - (_productController.cart[index].product['shipping_cost']  * _productController.cart[index].quantity);
                      //                         _productController.cart.removeAt(index);
                      //                       });
                      //                     },
                      //                     icon: Icon(Icons.dangerous, color: Colors.red,))
                      //               ],
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ));
                    },
                  )),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Get.to(DeliveryInfo());
                  },
                  child: Container(
                    decoration: BoxDecoration(color: primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Continue to Shipping',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Total: ',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              Obx(() => Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      '৳${_productController.totalCartValue.value}',
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  ))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
