import 'package:flutter/material.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';
import 'package:get/get.dart';
class Cart extends StatelessWidget {

  final ProductController _productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _productController.cart.length,
          shrinkWrap: true,
          itemBuilder: (context, index){

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(_productController.cart[index]['name']),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
