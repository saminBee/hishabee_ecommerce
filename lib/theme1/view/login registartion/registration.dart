import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hishabee_ecommerce/bottom_nav.dart';
import 'package:hishabee_ecommerce/theme1/controller/login_registration_controller/login_registration_controller.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';

import '../../../utils.dart';
import '../cart/shiping_info.dart';

class Registration extends StatelessWidget {

  final _formKeyRegistration = GlobalKey<FormState>();
  final passwordObsecure = 0.obs;
  final confirmPasswordObsecure = 0.obs;
  final LoginRegistraionController _loginRegistraionController = Get.find();
  final ProductController _productController = Get.find();
  final box = GetStorage();
  final TextEditingController _mailTextEditingController = TextEditingController();
  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _mobileNumberTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  final TextEditingController _confirmPasswordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height /3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                      Text('Welcome to', style: TextStyle(
                        fontSize: 48, color: Colors.white,fontWeight: FontWeight.w800,
                      ),),
                      Text('${_productController.shop.value['shop']['name']}', style: TextStyle(
                        fontSize: 48, color: Colors.white,fontWeight: FontWeight.w800,
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height /1.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        30,
                      ),
                      topRight: Radius.circular(
                        30,
                      ),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                  child: Form(
                    key: _formKeyRegistration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Text(
                            "SIGNUP",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),

                        TextFormField(
                          validator: (value){
                            RegExp regex =  RegExp(r'^.{3,}$');
                            if(value!.isEmpty){
                              return 'Name more than 3 character are Required';
                            }
                            if(!regex.hasMatch(value)){
                              return 'Name more than 3 character are Required';
                            }
                          },
                          controller: _nameTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {},
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              prefixIcon:  Icon(Icons.person, color: primaryColor,),

                              // fillColor: kPrimaryLightColor,
                              filled: true,
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          // validator: (value){
                          //   RegExp regex =  RegExp('0-9');
                          //   if(value!.isEmpty){
                          //     return 'Mobile Number need to be 11 digits';
                          //   }
                          //   if(!regex.hasMatch(value)){
                          //     return 'Mobile Number need to be 11 digits';
                          //   }
                          // },
                          controller: _mobileNumberTextEditingController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {},
                          cursorColor: Colors.black,
                          textInputAction: TextInputAction.next,
                          inputFormatters:[
                            LengthLimitingTextInputFormatter(11),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              prefixIcon:  Icon(Icons.phone, color: primaryColor,),

                              // fillColor: kPrimaryLightColor,
                              filled: true,
                              hintText: 'Mobile Number',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          // validator: (value){
                          //   if(value!.isEmpty){
                          //     return 'Please Enter Your Email';
                          //   }
                          //   if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]").hasMatch(value)){
                          //     return 'Please Enter a Valid Email';
                          //   }
                          //   return null;
                          // },
                          controller: _mailTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {},
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              prefixIcon:  Icon(Icons.mail, color: primaryColor,),

                              // fillColor: kPrimaryLightColor,
                              filled: true,
                              hintText: 'Email (Optional)',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        SizedBox(height: 10),
                        Obx(()=>TextFormField(
                          validator: (value){
                            // RegExp regex =  RegExp(r'^.{8,}$');
                            if(value!.isEmpty){
                              return 'Password is Required';
                            }
                            // if(!regex.hasMatch(value)){
                            //   return 'Please Enter Valid Password(minimum: 8 character)';
                            // }
                          },
                          controller: _passwordTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          obscureText: passwordObsecure.value == 0 ? true : false,
                          onChanged: (value) {},
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              prefixIcon:  Icon(Icons.lock, color: primaryColor,),
                              suffixIcon: passwordObsecure.value == 0 ?  IconButton(
                                onPressed: (){
                                  passwordObsecure.value = 1;
                                },
                                icon: Icon(Icons.visibility),
                                color: primaryColor,
                              ) : IconButton(
                                onPressed: (){
                                  passwordObsecure.value = 0;
                                },
                                icon: Icon(Icons.visibility_off),
                                color: primaryColor,
                              ),
                              // fillColor: kPrimaryLightColor,
                              filled: true,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),),
                        const SizedBox(height: 10),
                        Obx(()=>TextFormField(
                          validator: (value){
                            if(_passwordTextEditingController.text != _confirmPasswordTextEditingController.text){
                              return 'Password don\'t match';
                            }
                            return null;
                          },
                          controller: _confirmPasswordTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: confirmPasswordObsecure.value == 0 ? true : false,
                          onChanged: (value) {},
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              prefixIcon:  Icon(Icons.lock, color: primaryColor,),
                              suffixIcon: confirmPasswordObsecure.value == 0 ?
                              IconButton(
                                onPressed: (){
                                  confirmPasswordObsecure.value = 1;
                                },
                                icon:  Icon(Icons.visibility),color: primaryColor,) :
                              IconButton(
                                onPressed: (){
                                  confirmPasswordObsecure.value = 0;
                                },
                                icon:  Icon(Icons.visibility_off),color: primaryColor,),
                              // fillColor: kPrimaryLightColor,
                              filled: true,
                              hintText: 'Confirm Password',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6.0))),
                        )),
                        // RoundedButton(
                        //   text: "SIGNUP",
                        //   press: () {
                        //     _signIn(_mailTextEditingController.text, _passwordTextEditingController.text, context);
                        //   },
                        // ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: InkWell(
                            onTap: () async {
                              if(_formKeyRegistration.currentState!.validate()){
                                await _loginRegistraionController.registration(
                                    name: _nameTextEditingController.value.text,
                                    mobile: _mobileNumberTextEditingController.value.text,
                                    password: _passwordTextEditingController.value.text,
                                    email: _mailTextEditingController.value.text
                                ).then((value){
                                  box.write('token', '${value['access_token']}');
                                });
                                await _loginRegistraionController.profileDetailsFunction().then((value){
                                  _loginRegistraionController.profileDetails.value = value;
                                });
                                await _loginRegistraionController.getAllArea().then((value){
                                  _loginRegistraionController.area.value = value;
                                });

                                await _loginRegistraionController.getAllSelectedArea().then((value){
                                  _loginRegistraionController.allSelectedArea.value = value;
                                });
                                _loginRegistraionController.checkArea();
                                _loginRegistraionController.selectedIndex.value = 0;
                                Get.back();
                                Get.back();
                                Fluttertoast.showToast(msg: 'Account Created');
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text('Sign Up',textAlign: TextAlign.center,style: TextStyle(
                                    color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    ));}
}
