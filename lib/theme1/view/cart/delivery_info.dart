import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hishabee_ecommerce/theme1/controller/login_registration_controller/login_registration_controller.dart';
import 'package:hishabee_ecommerce/utils.dart';

class DeliveryInfo extends StatelessWidget {
  final cashOnDelivery = 0.obs;
  final pickUp = 0.obs;

  LoginRegistraionController _loginRegistraionController = Get.find();
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
