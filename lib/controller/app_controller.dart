import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:khdne/constants.dart';

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

  ImagePicker picker = ImagePicker();
  File? image;
  Future<File?> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
      return image;
    } else {
      print('No image selected');

      return null;
    }
  }

  RegisterModel? registerModel;

  final String baseUrl = 'http://taskflutter.futurecode-projects.com/api/';
  registerUser({
    required String endPoint,
    required String fullName,
    required String phoneNumber,
    required String password,
    required String passwordConfirmation,
    required File image,
  }) async {
    var headers = {'Accept': 'application/json'};
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl$kRegisterUrl'));
    request.fields.addAll({
      'fullname': fullName,
      'phone_number': phoneNumber,
      'password': password,
      'password_confirmation': passwordConfirmation
    });
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    request.headers.addAll(headers);

    http.StreamedResponse streamedResponse = await request.send();

    if (streamedResponse.statusCode == 200) {
      var response = await http.Response.fromStream(streamedResponse);
      Map<String, dynamic> data = jsonDecode(response.body);

      registerModel = RegisterModel.fromJson(data);
      print(registerModel?.userName ?? 'Not found');
      update();
      Get.snackbar(' Register Success', 'You have registered successfully');
    } else if (streamedResponse.statusCode == 422) {
      var response = await http.Response.fromStream(streamedResponse);
      Map<String, dynamic> failureData = jsonDecode(response.body);
     

      failure = RegisterFailure.fromJson(failureData);
      Get.snackbar('Failed', '${failure!.message}');
    } else {
      print(streamedResponse.reasonPhrase);
      Get.snackbar(
          'Failed', 'error with satus code: ${streamedResponse.statusCode}');
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
