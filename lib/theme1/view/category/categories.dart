import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';
import 'package:get/get.dart';
class Categories extends StatelessWidget {

  final ProductController _productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: ListView.builder(
            itemCount: _productController.categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      _productController.categories[index]['icon'] == null ?
                          Container():
                      CachedNetworkImage(
                        imageUrl: _productController.categories[index]['icon'],
                        height: 30,
                      ),
                      SizedBox(width: 10,),
                      Text(_productController.categories[index]['name'])
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
