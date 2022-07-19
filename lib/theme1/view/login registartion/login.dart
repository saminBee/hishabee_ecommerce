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
    Size size = MediaQuery.of(context).size;
    return
      box.read('token') != null ?
        ///profile section
    Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: _loginRegistationController.profileDetails.value['name'] ?? '[Not Given]',
                readOnly: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                cursorColor: Colors.black,
                inputFormatters:[
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person, color: Colors.amber,),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6.0))),
              ),
              SizedBox(height: 20,),
              TextFormField(
                initialValue: _loginRegistationController.profileDetails.value['mobile_number'] ?? '[Not Given]',
                readOnly: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                cursorColor: Colors.black,
                inputFormatters:[
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone, color: Colors.amber,),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6.0))),
              ),
              SizedBox(height: 20,),
              TextFormField(
                initialValue: _loginRegistationController.profileDetails.value['website'] ?? '[Not Given]',
                readOnly: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                cursorColor: Colors.black,
                inputFormatters:[
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.map, color: Colors.amber,),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6.0))),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                initialValue: _loginRegistationController.profileDetails.value['address'] ?? '[Not Given]',
                readOnly: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                cursorColor: Colors.black,
                inputFormatters:[
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on, color: Colors.amber,),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6.0))),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                initialValue: _loginRegistationController.profileDetails.value['nid_number'] ?? '[Not Given]',
                readOnly: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                cursorColor: Colors.black,
                inputFormatters:[
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.insert_drive_file_sharp, color: Colors.amber,),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6.0))),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Get.to(ShippingInfo());
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: hish_blue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('Add Shipping Address', style: TextStyle(
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
                color: hish_blue,
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
                child: Text('logout',
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
      body: Form(
        key: _formKeyLogin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
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
                prefixIcon: const Icon(Icons.person, color: Colors.amber,),

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
                    prefixIcon: const Icon(Icons.lock, color: Colors.amber,),
                    suffixIcon: _loginRegistationController.flagPassword.value == 0 ?
                    IconButton(
                      onPressed: (){
                        _loginRegistationController.flagPassword.value = 1;
                        // setState(() {
                        //   flagPassword = 1;
                        // });

                      },
                      icon: Icon(Icons.visibility),color: Colors.grey,) :
                    IconButton(
                      onPressed: (){
                        _loginRegistationController.flagPassword.value = 0;
                        // setState(() {
                        //   flagPassword = 0;
                        // });
                      },
                      icon: Icon(Icons.visibility_off),color: Colors.grey,),
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
                    color: hish_blue,
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
                      }, child: const Text('Sign Up'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
