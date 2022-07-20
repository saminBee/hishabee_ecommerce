import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hishabee_ecommerce/theme1/controller/login_registration_controller/login_registration_controller.dart';
import 'package:hishabee_ecommerce/theme1/view/cart/shiping_info.dart';
import 'package:hishabee_ecommerce/theme1/view/home/home_page.dart';
import 'package:hishabee_ecommerce/theme1/view/login%20registartion/registration.dart';
import 'package:hishabee_ecommerce/utils.dart';

import '../../../bottom_nav.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginRegistraionController _loginRegistationController = Get.put(LoginRegistraionController());

  final _formKeyLogin = GlobalKey<FormState>();

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return
      box.read('token') != null ?
        ///profile section
    Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Profile', style: TextStyle(
                  fontSize: 34
                ),),
                SizedBox(height: 30,),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text('${_loginRegistationController.profileDetails.value['name'] ?? '[Not Given]'}',style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600
                                ),),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Mobile: ${_loginRegistationController.profileDetails.value['mobile_number'] ?? '[Not Given]'}',
                                    style: TextStyle(fontSize: 18),),
                                    Text('Website: ${_loginRegistationController.profileDetails.value['website'] ?? '[Not Given]'}',
                                      style: TextStyle(fontSize: 18),),
                                    Text('Address: ${_loginRegistationController.profileDetails.value['address'] ?? '[Not Given]'}',
                                      style: TextStyle(fontSize: 18),),
                                    Text('NID: ${_loginRegistationController.profileDetails.value['nid_number'] ?? '[Not Given]'}',
                                      style: TextStyle(fontSize: 18),),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -30,
                      child: CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 40,
                        child: ClipRRect(
                          child: Image.asset('assets/placeholders/emptyImage.png',color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    Get.to(ShippingInfo());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Add Shipping Address',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                          Icon(Icons.arrow_forward_ios_outlined)
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(6)
            ),
            child: InkWell(
              onTap: (){
                _loginRegistationController.selectedIndex.value = 0;
                box.remove('token');
                // Get.to(BottomNav());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Logout',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ),
          ),
        )
    ):
    Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Welcome', style: TextStyle(
                        fontSize: 56, color: Colors.white,fontWeight: FontWeight.w800,
                      ),),
                      Text('back', style: TextStyle(
                          fontSize: 56, color: Colors.white,fontWeight: FontWeight.w800,
                      ),),
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
                        30,
                      ),
                      topRight: Radius.circular(
                        30,
                      ),
                    )
                ),
                child: Form(
                  key: _formKeyLogin,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20, bottom: 10),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Raleway', fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter Your mobile number';
                        }
                        if(!RegExp("[0-9]").hasMatch(value)){
                          return 'Please Enter a Valid mobile number';
                        }
                        return null;
                      },
                      controller: _loginRegistationController.mobileNumberTextEditingController.value,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {},
                      cursorColor: Colors.black,
                      inputFormatters:[
                        LengthLimitingTextInputFormatter(11),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          prefixIcon:  Icon(Icons.person, color: primaryColor,),

                          // fillColor: kPrimaryLightColor,
                          filled: true,
                          hintText: 'Mobile',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(6)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(6.0))),
                    ),
                  ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Obx(()=>TextFormField(
                          validator: (value){
                            RegExp regex =  RegExp(r'^.{8,}$');
                            if(value!.isEmpty){
                              return 'Password is Required';
                            }
                            // if(!regex.hasMatch(value)){
                            //   return 'Please Enter Valid Password(minimum: 8 character)';
                            // }
                          },
                          controller: _loginRegistationController.passwordTextEditingController.value,
                          onChanged: (value) {},
                          cursorColor: Colors.black,
                          obscureText: _loginRegistationController.flagPassword.value == 0 ? true : false,
                          decoration: InputDecoration(
                              prefixIcon:  Icon(Icons.lock, color: primaryColor,),
                              suffixIcon: _loginRegistationController.flagPassword.value == 0 ?
                              IconButton(
                                onPressed: (){
                                  _loginRegistationController.flagPassword.value = 1;
                                  // setState(() {
                                  //   flagPassword = 1;
                                  // });

                                },
                                icon: Icon(Icons.visibility),color: primaryColor,) :
                              IconButton(
                                onPressed: (){
                                  _loginRegistationController.flagPassword.value = 0;
                                  // setState(() {
                                  //   flagPassword = 0;
                                  // });
                                },
                                icon: Icon(Icons.visibility_off),color: primaryColor,),
                              // fillColor: kPrimaryLightColor,
                              filled: true,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6.0))),
                        )),
                      ),
                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: InkWell(
                          onTap: () async {
                            if(_formKeyLogin.currentState!.validate()){
                              await _loginRegistationController.login(
                                mobile: _loginRegistationController.mobileNumberTextEditingController.value.text,
                                password: _loginRegistationController.passwordTextEditingController.value.text,
                              ).then((value){
                                box.write('token', '${value['access_token']}');
                              });
                              await _loginRegistationController.profileDetailsFunction().then((value){
                                _loginRegistationController.profileDetails.value = value;
                              });
                              await _loginRegistationController.getAllArea().then((value){
                                _loginRegistationController.area.value = value;
                              });

                              await _loginRegistationController.getAllSelectedArea().then((value){
                                _loginRegistationController.allSelectedArea.value = value;
                              });
                              _loginRegistationController.checkArea();
                              _loginRegistationController.selectedIndex.value = 0;
                              // Get.to(const BottomNav());
                              Get.back();
                              _loginRegistationController.mobileNumberTextEditingController.value.clear();
                              _loginRegistationController.passwordTextEditingController.value.clear();
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
                              child: Text('Login',textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.white
                              ),),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children:  [
                            const Text('You don\'t have an account?'),
                            TextButton(
                                onPressed: (){
                                  Get.to(Registration());
                                }, child:  Text('Sign Up', style: TextStyle(color: primaryColor),))
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
    );
  }
}
