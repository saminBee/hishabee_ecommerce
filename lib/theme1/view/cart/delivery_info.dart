import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hishabee_ecommerce/theme1/controller/login_registration_controller/login_registration_controller.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';
import 'package:hishabee_ecommerce/utils.dart';

class DeliveryInfo extends StatelessWidget {
  final cashOnDelivery = 0.obs;
  final pickUp = 0.obs;

  final LoginRegistraionController _loginRegistraionController = Get.find();
  final ProductController _productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hish_blue,
        titleSpacing: 0,
        title: const Text('Delivery Info'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Delivery System',style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500
                ),),
                const SizedBox(height: 10,),
                Row(
                  children:  [
                    Expanded(
                      child: Obx(()=>InkWell(
                        onTap: (){
                          cashOnDelivery.value = 1;
                          pickUp.value = 0;
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            side: BorderSide(
                              color: cashOnDelivery.value == 1? hish_blue : Colors.transparent
                            )
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Cash on Delivery'),
                          ),
                        ),
                      )),
                    ),
                    Expanded(
                      child: Obx(()=>InkWell(
                        onTap: (){
                          pickUp.value = 1;
                          cashOnDelivery.value = 0;
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(
                                  color: pickUp.value == 1? hish_blue : Colors.transparent
                              )
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Pick Up'),
                          ),
                        ),
                      )),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                const Text('Select Address',style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500
                ),),
                const SizedBox(height: 10,),
                Obx(()=>ListView.builder(
                    shrinkWrap: true,
                    itemCount: _loginRegistraionController.allSelectedArea.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${_loginRegistraionController.allSelectedAddress[index]},'
                              '${_loginRegistraionController.selectedArea[index]},'
                              '${_loginRegistraionController.selectedDistrict[index]}, '
                              '${_loginRegistraionController.selectedDivision[index]}'),
                        ),
                      );
                    })),
                SizedBox(height: 10,),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                               const Text('Summary', style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600
                              ),),
                              Container(
                                decoration:  BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(6)
                                ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Items: ${_productController.cart.length}', style: const TextStyle(
                                      color: Colors.white
                                    ),),
                                  ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Divider(color: Colors.grey.withOpacity(.35),thickness: 1.5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text('Product'.toUpperCase(),),
                                  Text('Total'.toUpperCase())
                                ],
                              ),
                              Divider(color: Colors.grey.withOpacity(.35),thickness: 1.5,),
                              SizedBox(height: 10,),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: _productController.cart.length,
                                  itemBuilder: (context, index){
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${_productController.cart[index].product['name']} X ${_productController.cart[index].quantity}'.toUpperCase(),
                                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                                        Text('৳ ${
                                            _productController.cart[index].product['selling_price'] * _productController.cart[index].quantity
                                        }'.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)

                                      ],
                                    );
                                  }
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sub Total: '.toUpperCase()),
                                  Text('৳ ${_productController.totalCartValue.value}'.toUpperCase()),
                                ],
                              ),
                              Divider(color: Colors.grey.withOpacity(.35),thickness: 1.5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Shipping: '.toUpperCase()),
                                  Text('৳ ${_productController.shippingCost.value}'.toUpperCase()),
                                ],
                              ),
                              Divider(color: Colors.grey.withOpacity(.35),thickness: 1.5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total: '.toUpperCase()),
                                  Text('৳ ${_productController.shippingCost.value + _productController.totalCartValue.value}'.toUpperCase()),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
