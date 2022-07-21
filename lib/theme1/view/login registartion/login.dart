import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hishabee_ecommerce/theme1/controller/login_registration_controller/login_registration_controller.dart';
import 'package:hishabee_ecommerce/theme1/controller/product_controller/product_controller.dart';
import 'package:hishabee_ecommerce/theme1/view/cart/shiping_info.dart';
import 'package:hishabee_ecommerce/theme1/view/home/home_page.dart';
import 'package:hishabee_ecommerce/theme1/view/login%20registartion/registration.dart';
import 'package:hishabee_ecommerce/utils.dart';

import '../../../bottom_nav.dart';
import 'address_setup.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginRegistraionController _loginRegistationController =
      Get.put(LoginRegistraionController());
  final ProductController _productController = Get.find();

  final _formKeyLogin = GlobalKey<FormState>();

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return box.read('token') != null
        ?

        ///profile section
        Scaffold(
            backgroundColor: scaffoldBackgroundColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Profile',
                        style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold,fontFamily: 'Raleway-bold'),
                      ),
                      SizedBox(height: 10,),
                      Card(
                        elevation: 4,
                        color: scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  'assets/placeholders/emptyImage.png',
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_loginRegistationController.profileDetails.value['name'] ?? '[Not Given]'}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${_loginRegistationController.profileDetails.value['mobile_number'] ?? '[Not Given]'}',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(SetupAddress());
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Icon(Icons.location_on,color: primaryColor,),
                                              ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(.35),
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Add Shipping Address',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.arrow_forward_ios_outlined)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                InkWell(
                                  onTap: (){
                                    Fluttertoast.showToast(msg: 'Coming Soon');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child:  Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Icon(Icons.shopping_bag,color: primaryColor,),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.grey.withOpacity(.35),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          const Text(
                                            'Order Hsitory',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.arrow_forward_ios_outlined)
                                    ],
                                  ),
                                ),


                                SizedBox(height: 10,),
                                InkWell(
                                  onTap: (){
                                    Fluttertoast.showToast(msg: 'Coming Soon');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child:  Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Icon(Icons.favorite, color: primaryColor,),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.grey.withOpacity(.35),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          const Text(
                                            'My Favourite',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.arrow_forward_ios_outlined)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                InkWell(
                                  onTap: (){
                                    Fluttertoast.showToast(msg: 'Coming Soon',);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child:  Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Icon(Icons.card_giftcard,color: primaryColor,),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.grey.withOpacity(.35),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          const Text(
                                            'My Card',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.arrow_forward_ios_outlined)
                                    ],
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
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(6)),
                child: InkWell(
                  onTap: () {
                    _loginRegistationController.selectedIndex.value = 0;
                    _productController.cart.value = [];
                    box.remove('token');
                    // Get.to(BottomNav());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Logout',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ))
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: primaryColor,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Welcome',
                              style: TextStyle(
                                  fontSize: 60,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway-bold'),
                            ),
                            Text(
                              'back',
                              style: TextStyle(
                                  fontSize: 60,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Raleway-bold'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              20,
                            ),
                            topRight: Radius.circular(
                              20,
                            ),
                          )),
                      child: Form(
                        key: _formKeyLogin,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Raleway-bold',
                                    fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Your mobile number';
                                  }
                                  if (!RegExp("[0-9]").hasMatch(value)) {
                                    return 'Please Enter a Valid mobile number';
                                  }
                                  return null;
                                },
                                controller: _loginRegistationController
                                    .mobileNumberTextEditingController.value,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {},
                                cursorColor: Colors.black,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(11),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: primaryColor,
                                  ),

                                  // fillColor: kPrimaryLightColor,
                                  // filled: true,
                                  label: const Text('Mobile Number'),

                                  // hintText: 'Mobile',
                                  // border: OutlineInputBorder(
                                  //     borderSide: BorderSide.none,
                                  //     borderRadius: BorderRadius.circular(6)),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFFC9C9C9)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(() => TextFormField(
                                    validator: (value) {
                                      RegExp regex = RegExp(r'^.{8,}$');
                                      if (value!.isEmpty) {
                                        return 'Password is Required';
                                      }
                                      return null;

                                    },
                                    controller: _loginRegistationController
                                        .passwordTextEditingController.value,
                                    onChanged: (value) {},
                                    cursorColor: Colors.black,
                                    obscureText: _loginRegistationController
                                                .flagPassword.value ==
                                            0
                                        ? true
                                        : false,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: primaryColor,
                                        ),
                                        suffixIcon: _loginRegistationController
                                                    .flagPassword.value ==
                                                0
                                            ? IconButton(
                                                onPressed: () {
                                                  _loginRegistationController
                                                      .flagPassword.value = 1;
                                                  // setState(() {
                                                  //   flagPassword = 1;
                                                  // });
                                                },
                                                icon: const Icon(Icons.visibility_off) ,
                                                color: primaryColor,
                                              )
                                            : IconButton(
                                                onPressed: () {
                                                  _loginRegistationController
                                                      .flagPassword.value = 0;
                                                  // setState(() {
                                                  //   flagPassword = 0;
                                                  // });
                                                },
                                                icon:
                                                const Icon(Icons.visibility),
                                                color: primaryColor,
                                              ),
                                        // hintText: 'Password',
                                        label: const Text('Password'),
                                        // border: OutlineInputBorder(
                                        //     borderSide: BorderSide.none,
                                        //     borderRadius:
                                        //         BorderRadius.circular(6)),
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xFFC9C9C9)),
                                        )
                                    ),
                                  )),
                              const SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () async {
                                  if (_formKeyLogin.currentState!.validate()) {
                                    await _loginRegistationController
                                        .login(
                                      mobile: _loginRegistationController
                                          .mobileNumberTextEditingController
                                          .value
                                          .text,
                                      password: _loginRegistationController
                                          .passwordTextEditingController
                                          .value
                                          .text,
                                    )
                                        .then((value) {
                                      box.write(
                                          'token', '${value['access_token']}');
                                    });
                                    await _loginRegistationController
                                        .profileDetailsFunction()
                                        .then((value) {
                                      _loginRegistationController
                                          .profileDetails.value = value;
                                    });
                                    await _loginRegistationController
                                        .getAllArea()
                                        .then((value) {
                                      _loginRegistationController.area.value =
                                          value;
                                    });

                                    await _loginRegistationController
                                        .getAllSelectedArea()
                                        .then((value) {
                                      _loginRegistationController
                                          .allSelectedArea.value = value;
                                    });
                                    _loginRegistationController.checkCustomerShippingAddressArea();
                                    _loginRegistationController
                                        .selectedIndex.value = 0;

                                    // Get.to(const BottomNav());
                                    Get.back();
                                    _loginRegistationController
                                        .mobileNumberTextEditingController.value
                                        .clear();
                                    _loginRegistationController
                                        .passwordTextEditingController.value
                                        .clear();
                                  }
                                },
                                child: Container(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Center(
                                child: TextButton(
                                    onPressed: (){
                                      Get.to(Registration());
                                    },
                                    child: Text('Create Account',style: TextStyle(
                                      color: primaryColor,fontWeight: FontWeight.w600, fontSize: 17
                                    ),)
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     const Text('You don\'t have an account?'),
                              //     TextButton(
                              //         onPressed: () {
                              //           Get.to(Registration());
                              //         },
                              //         child: Text(
                              //           'Sign Up',
                              //           style: TextStyle(color: primaryColor),
                              //         ))
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
