import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';
import 'package:get/get.dart';

import '../../../utils.dart';
class CategorizedProduct extends StatefulWidget {
  int? categoryId;

  CategorizedProduct({this.categoryId});

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
      appBar: AppBar(),
      body: SafeArea(
        child: Obx(()=>GridView.builder(
          itemCount: _productController.categorizedProduct.length,
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
                      child: CachedNetworkImage(
                        imageUrl: 'https://hishabee.fra1.digitaloceanspaces.com/business-manager/9/mRG4csXxQELM7egTjD88wUrbI0Rb6uXtKHmEenx1.jpg',
                        height: 70,
                      ),
                    ),
                  ),
                  Text('${_productController.categorizedProduct[index]['name']}'),

                  Text('৳${_productController.categorizedProduct[index]['selling_price']}'),

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
                                      fontSize: 12,color: Colors.white
                                  ),),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap:(){
                              _productController.cart.add(_productController.categorizedProduct[index]);
                              // for(int i = 0;i< _productController.cart.length;i++){
                              //   if(_productController.searchedProduct[index]['id'] != _productController.cart[i]['id']){
                              //
                              //   }else{
                              //
                              //   }
                              // }
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.orange
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text('Add to Cart', style: TextStyle(
                                      fontSize: 12
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
        )),
      ),
    );
  }
}
