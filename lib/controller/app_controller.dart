import 'dart:convert';


import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:khdne/models/register_model.dart';

class AppController extends GetxController {
  bool passwordLoginVisibility = true;
  changePasswordLoginVisibility() {
    passwordLoginVisibility = !passwordLoginVisibility;
    update();
  }

  bool passwordRegisterVisibility = true;
  changePasswordRegisterVisibility() {
    passwordRegisterVisibility = !passwordRegisterVisibility;
    update();
  }

  bool confirmPasswordVisibility = true;
  changeconfirmPVisibility() {
    confirmPasswordVisibility = !confirmPasswordVisibility;
    update();
  }

  RegisterModel? registerModel;

  final String baseUrl = 'http://taskflutter.futurecode-projects.com/api/';
  registerUser(
      {required String endPoint,
      required String fullName,
      required String phoneNumber,
      required String password,
      required String passwordConfirmation,
      }) async {
    Uri url = Uri.parse('$baseUrl$endPoint');
    http.Response response = await http.post(url, headers: {
      'Accept': 'application/json',
      'Connection': 'keep-alive',
    }, body: {
      'fullname': fullName,
      'phone_number': phoneNumber,
      'password': password,
      'password_confirmation': passwordConfirmation
    });
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      registerModel = RegisterModel.fromJson(data);
      Get.snackbar(' Register Success', 'You have registered successfully');
      update();
      if (registerModel != null) {
        print(registerModel!.message);
        Get.snackbar('Failed', '${registerModel!.message}');
      }
    } else if (response.statusCode == 422) {
      Map<String, dynamic> failureData = jsonDecode(response.body);
      failure = RegisterFailure.fromJson(failureData);
      Get.snackbar('Failed', '${failure!.message}');
    }else {
      Get.snackbar('Failed', 'error with satus code: ${response.statusCode}');
    }
  }

  RegisterModel? loginModel;
  RegisterFailure? failure;
  loginUser({
    required String endPoint,
    required String phoneNumber,
    required String password,
  }) async {
    Uri url = Uri.parse('$baseUrl$endPoint');
    http.Response response = await http.post(url, headers: {
      'Connection': 'keep-alive',
    }, body: {
      'phone_number': phoneNumber,
      'password': password,
    });
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      loginModel = RegisterModel.fromJson(data);
        Get.snackbar(' Login Success', 'You have logined successfully');
      update();
    } else if (response.statusCode == 422) {
      Map<String, dynamic> failureData = jsonDecode(response.body);
      failure = RegisterFailure.fromJson(failureData);
      Get.snackbar('Failed', '${failure!.message}');
    } else {
      print('error with satus code: ${response.statusCode}');
    }
  }
}
