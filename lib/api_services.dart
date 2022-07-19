import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


import 'utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class ApiService {
  makeApiRequest({method, url, body, headers}) async {
    try {
      http.Response? response;
      Uri apiURL = Uri.parse(BASE_URL + url);
      var header = headers;
      // use storage // getx storage
      if (headers == null) {
        header = {
          "Content-Type": "application/json",
          "Authorization": 'Bearer '
        };
      }
      if (method == apiMethods.post) {
        response = await http.post(apiURL,
            body: convert.jsonEncode(body), headers: header);
        print("Response code: ${response.statusCode}");
        // print('response code from function: ${response.statusCode}');
        print('response code from function: ${response.body}');
        print(apiURL);
        // print(response.body);
      }
      if (method == apiMethods.get) {
        response = await http.get(apiURL, headers: header);
        print("my response code is ${response.statusCode}");
        print('response code from function: ${response.body}');
      }
      if (method == apiMethods.delete) {
        response = await http.delete(apiURL, headers: header);
      }
      if (method == apiMethods.put) {
        response = await http.put(apiURL,
            body: convert.jsonEncode(body), headers: header);
        print('response code from put: $apiURL');
        print('response code from put: ${response.body}');
      }

      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        var res = convert.jsonDecode(response.body);
        print("my response is $res");
        return res;
      } else if (response != null && (response.statusCode == 403)) {
        var res = convert.jsonDecode(response.body);
        print("my response is $res");
        return res;
      }else if(response?.statusCode == 409){
        Get.back();
        Fluttertoast.showToast(msg: 'Account Already Exist');
      }
      else if(response?.statusCode == 401){
        Fluttertoast.showToast(msg: 'Unauthenticated');
      } else {
        var res = convert.jsonDecode(response!.body);

        handleError(res);
      }
    } catch (e) {
      print(e.toString());
      handleError(e);
    }
  }

  handleError(err) {
    var message = 'Something went wrong. Please try again later';
    print(message);
    if (err != null && err['messages'] != null && err['messages'].length > 0) {
      message = err['messages'][0];
    }
    Fluttertoast.showToast(msg: message);
  }
}
