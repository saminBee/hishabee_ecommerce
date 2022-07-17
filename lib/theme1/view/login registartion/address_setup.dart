import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hishabee_ecommerce/theme1/controller/login_registration_controller/login_registration_controller.dart';
import 'package:hishabee_ecommerce/utils.dart';

class SetupAddress extends StatefulWidget {
  @override
  State<SetupAddress> createState() => _SetupAddressState();
}

class _SetupAddressState extends State<SetupAddress> {
  final LoginRegistraionController _loginRegistraionController = Get.find();

  List<String> divisionName = [];
  List<String> areaName = [];
  List<String> districName = [];


  @override
  initState() {
    checkArea();
    super.initState();
    // Add listeners to this class
  }


  checkArea(){
    if(_loginRegistraionController.allSelectedArea.isNotEmpty){
      for(int j = 0; j<_loginRegistraionController.allSelectedArea.length; j++){
        for(int i = 0;i<_loginRegistraionController.area.length; i++){
            if(_loginRegistraionController.allSelectedArea[j]['id'] == _loginRegistraionController.area[i]['id']){
              divisionName.add(_loginRegistraionController.area[i]['name']);
              for(int a = 0; a<_loginRegistraionController.area[i]['districts'].length; a++){
                if(_loginRegistraionController.allSelectedArea[j]['district_id'] == _loginRegistraionController.area[i]['districts'][a]['id']){
                  districName.add(_loginRegistraionController.area[i]['districts'][a]['name']);
                  for(int b = 0; b<_loginRegistraionController.area[i]['districts'][a]['areas'].length; b++){
                    if(_loginRegistraionController.allSelectedArea[j]['area_id'] == _loginRegistraionController.area[i]['districts'][a]['areas'][b]['id']){
                      areaName.add(_loginRegistraionController.area[i]['districts'][a]['areas'][b]['id']);
                    }
                  }
                }
              }
            }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Shipping Address'),
        backgroundColor: hish_blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          children: [
            const Text(
              'Add your const Shipping Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              ...divisionName.map(
                (element) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.black12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$element'),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(6)),
                  child: const Center(
                    child: Icon(
                      Icons.add_circle_outline_sharp,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ])
            // Obx(()=>ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: _loginRegistraionController.allSelectedArea.length,
            //     itemBuilder: (context, index) {
            //       return ;
            //       // InkWell(
            //       //   onTap: (){
            //       //
            //       //   },
            //       //   child: Container(
            //       //     height: 200,
            //       //     width: double.infinity,
            //       //     decoration: BoxDecoration(
            //       //       border: Border.all(color: Colors.black12),
            //       //       borderRadius: BorderRadius.circular(6)
            //       //     ),
            //       //     child: const Center(
            //       //       child: Icon(Icons.add_circle_outline_sharp, size: 40,),
            //       //     ),
            //       //   ),
            //       // );
            //     }
            // )),
          ],
        ),
      ),
    );
  }
}
