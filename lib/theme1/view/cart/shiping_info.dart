import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hishabee_ecommerce/theme1/controller/cart_checkout/checkout_controller.dart';
import 'package:hishabee_ecommerce/theme1/controller/login_registration_controller/login_registration_controller.dart';
import 'package:hishabee_ecommerce/utils.dart';

import '../../../bottom_nav.dart';
import 'delivery_info.dart';

class ShippingInfo extends StatelessWidget {

  final CheckoutController _checkoutController = Get.put(CheckoutController());
  final LoginRegistraionController _loginRegistraionController = Get.find();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hish_blue,
        title: const Text('Shipping Info'),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text('Name'),
                  // const SizedBox(height: 10,),
                  // TextFormField(
                  //   validator: (value){
                  //     if(value!.isEmpty){
                  //       return 'Name is required';
                  //     }
                  //   },
                  //   controller: _checkoutController.nameController.value,
                  //   textInputAction: TextInputAction.next,
                  //   keyboardType: TextInputType.text,
                  //   decoration:  InputDecoration(
                  //     hintText: "Name",
                  //     hintStyle:
                  //     TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //       borderSide: const BorderSide(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //       borderSide: const BorderSide(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //       borderSide: BorderSide(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //       errorBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(6.0),
                  //         borderSide: BorderSide(
                  //           color: Colors.black,
                  //         ),
                  //       )
                  //   ),
                  // ),
                  // const SizedBox(height: 10,),
                  // const Text('Email'),
                  // const SizedBox(height: 10,),
                  // TextFormField(
                  //   validator: (value){
                  //     if(value!.isEmpty){
                  //       return 'Email is required';
                  //     }
                  //   },
                  //   controller: _checkoutController.emailController.value,
                  //   textInputAction: TextInputAction.done,
                  //   keyboardType: TextInputType.emailAddress,
                  //   decoration:  InputDecoration(
                  //     hintText: "Email",
                  //     hintStyle:
                  //     TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(6.0),
                  //         borderSide: const BorderSide(
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //       borderSide: BorderSide(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //       borderSide: BorderSide(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //       errorBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(6.0),
                  //         borderSide: BorderSide(
                  //           color: Colors.black,
                  //         ),
                  //       )
                  //   ),
                  // ),
                  // const SizedBox(height: 10,),
                  const Text('Add Your Shipping Address', style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: 10,),
                  const Text('Division'),
                  const SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.black)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(()=>Text('${_checkoutController.division.value}')),
                          IconButton(onPressed: (){
                            _showDivisionDialog(context);
                          }, icon: Icon(Icons.arrow_drop_down_outlined))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text('District'),
                  const SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(()=>Text('${_checkoutController.district.value}')),
                          IconButton(onPressed: (){
                            _showDistrictDialog(context);
                          }, icon: Icon(Icons.arrow_drop_down_outlined))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text('Subdistrict'),
                  const SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.black)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(()=>Text('${_checkoutController.subDistrict.value}')),
                          IconButton(onPressed: (){
                            _showAreaDialog(context);
                          }, icon: Icon(Icons.arrow_drop_down_outlined))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text('Address'),
                  const SizedBox(height: 10,),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Address is required';
                      }
                    },
                    initialValue: _checkoutController.address.value,
                    keyboardType: TextInputType.text,
                    enabled: true,
                      textInputAction: TextInputAction.next,
                    decoration:  InputDecoration(
                      hintText: "Address",
                      hintStyle:
                      TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text('Postal Code'),
                  const SizedBox(height: 10,),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Postal Code is required';
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    initialValue: _checkoutController.postalCode.value,
                    keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    decoration:  InputDecoration(
                      hintText: "Postal Code",
                      hintStyle:
                      TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  // const Text('Mobile Number'),
                  // const SizedBox(height: 10,),
                  // TextFormField(
                  //   validator: (value){
                  //     if(value!.isEmpty){
                  //       return 'Mobile Number is required';
                  //     }
                  //   },
                  //   initialValue: _checkoutController.mobileNumber.value,
                  //   keyboardType: TextInputType.number,
                  //     textInputAction: TextInputAction.done,
                  //   inputFormatters:[
                  //     LengthLimitingTextInputFormatter(11),
                  //     FilteringTextInputFormatter.digitsOnly
                  //   ],
                  //   decoration:  InputDecoration(
                  //     hintText: "Mobile Number",
                  //     hintStyle:
                  //     TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(6.0),
                  //         borderSide: const BorderSide(
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //       borderSide: BorderSide(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //       borderSide: BorderSide(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     errorBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(6.0),
                  //       borderSide: BorderSide(
                  //         color: Colors.black,
                  //       ),
                  //     )
                  //   ),
                  // ),
                  // SizedBox(height: 10,),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: InkWell(
                      onTap: () async{
                        if(_formKey.currentState!.validate()){
                          await _checkoutController.addShippingAddress(
                            areaId: _checkoutController.subDistrictId.value,
                            divisionId: _checkoutController.divisionId.value,
                            districtId: _checkoutController.districtId.value
                          );
                          await _checkoutController.getShippingAddress().then((value){
                            _loginRegistraionController.allSelectedArea.value = value;
                            for(int i = 0;i<_loginRegistraionController.area.length; i++){
                              if(_checkoutController.divisionId.value == _loginRegistraionController.area[i]['id']){
                                _loginRegistraionController.selectedDivision.add(_loginRegistraionController.area[i]['name']);
                                for(int a = 0; a<_loginRegistraionController.area[i]['districts'].length; a++){
                                  if(_checkoutController.districtId.value == _loginRegistraionController.area[i]['districts'][a]['id']){
                                    _loginRegistraionController.selectedDistrict.add(_loginRegistraionController.area[i]['districts'][a]['name']);
                                    for(int b = 0; b<_loginRegistraionController.area[i]['districts'][a]['areas'].length; b++){
                                      if(_checkoutController.subDistrictId.value == _loginRegistraionController.area[i]['districts'][a]['areas'][b]['id']){
                                        _loginRegistraionController.selectedArea.add(_loginRegistraionController.area[i]['districts'][a]['areas'][b]['name']);
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          });
                          Get.back();
                          Get.back();
                          Get.back();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: hish_blue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child:  Text('Add Address',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              ),),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
_showDivisionDialog(BuildContext context){
    return showDialog(
      context: context,
      builder: (context) => Material(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Obx(
                      () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: _loginRegistraionController.allDivision.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          _checkoutController.division.value = _loginRegistraionController.allDivision[index];
                          _checkoutController.divisionId.value = _loginRegistraionController.allDivisionId[index];
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${_loginRegistraionController.allDivision[index]}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      child: Text(
                        'Close',
                        style: TextStyle(
                            color: hish_blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onPressed: () {
                        Get.back();
                        // controller.getAllProduct();
                        // Get.back();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
}
_showDistrictDialog(BuildContext context){
  return showDialog(
    context: context,
    builder: (context) => Material(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width / 1.5,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width / 1.2,
              child: Obx(
                    () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: _loginRegistraionController.allDistrict.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        _checkoutController.district.value = _loginRegistraionController.allDistrict[index];
                        _checkoutController.districtId.value = _loginRegistraionController.allDistrictId[index];
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${_loginRegistraionController.allDistrict[index]}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Spacer(),
                  TextButton(
                    child: Text(
                      'Close',
                      style: TextStyle(
                          color: hish_blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    onPressed: () {
                      Get.back();
                      // controller.getAllProduct();
                      // Get.back();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

  _showAreaDialog(BuildContext context){
    return showDialog(
      context: context,
      builder: (context) => Material(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Obx(
                      () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: _loginRegistraionController.allArea.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          _checkoutController.subDistrict.value = _loginRegistraionController.allArea[index];
                          _checkoutController.subDistrictId.value = _loginRegistraionController.allAreaId[index];
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${_loginRegistraionController.allArea[index]}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      child: Text(
                        'Close',
                        style: TextStyle(
                            color: hish_blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onPressed: () {
                        Get.back();
                        // controller.getAllProduct();
                        // Get.back();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
