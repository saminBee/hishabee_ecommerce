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
        child: Obx(()=>ListView.builder(
          itemCount: _productController.cart.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // for(int i = 0; i<_productController.cart.length;i++){
            //   if(_productController.cart[index]['name'] > 1){
            //
            //   }
            // }
            return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text('${_productController.cart[index].product['name']}')),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {

                                        setState((){
                                          if(_productController.cart[index].quantity > 1){
                                            --_productController.cart[index].quantity;
                                            // if(_productController.cart[index].quantity == 0){
                                            //   _productController.cart.remove(_productController.cart[index].product);
                                            // }
                                            _productController.totalCartValue.value = _productController.totalCartValue.value - _productController.cart[index].product['selling_price'];
                                            _productController.shippingCost.value = _productController.shippingCost.value - _productController.cart[index].product['shipping_cost'];
                                          }
                                        });

                                      },
                                      icon: const Icon(Icons.remove_circle_outline)),
                                  Text('${_productController.cart[index].quantity}'),
                                  IconButton(
                                      onPressed: () {
                                        setState((){
                                          ++_productController.cart[index].quantity;
                                          _productController.totalCartValue.value = _productController.totalCartValue.value + _productController.cart[index].product['selling_price'];
                                          _productController.shippingCost.value = _productController.shippingCost.value + _productController.cart[index].product['shipping_cost'];
                                        });
                                        print(_productController.cart[index].quantity);
                                      },
                                      icon: const Icon(Icons.add_circle_outline_sharp)),
                                ],
                              ),
                            ),
                            Obx(()=> Text('৳ ${
                                _productController.cart[index].product['selling_price'] * _productController.cart[index].quantity
                            }')),
                            IconButton(
                                onPressed: (){
                                  setState((){

                                    _productController.totalCartValue.value =
                                        _productController.totalCartValue.value - (_productController.cart[index].product['selling_price'] * _productController.cart[index].quantity);
                                    _productController.shippingCost.value = _productController.shippingCost.value - (_productController.cart[index].product['shipping_cost']  * _productController.cart[index].quantity);
                                    _productController.cart.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.dangerous, color: Colors.red,))
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          },
        )),
      ),
      bottomSheet: InkWell(
        onTap: (){
          Get.to(DeliveryInfo());
        },
        child: Container(
          decoration:  BoxDecoration(
              color: primaryColor
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Continue to Shipping',style: TextStyle(color: Colors.white, fontSize: 16),),
                Row(
                  children: [
                    const Text('Total: ',style: TextStyle(color: Colors.white, fontSize: 16),),
                    Obx(()=>Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text('৳${_productController.totalCartValue.value}',style: const TextStyle(color: Colors.black),),
                        ))),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
