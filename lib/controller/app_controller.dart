import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:khdne/constants.dart';

import 'package:khdne/models/register_model.dart';
import 'package:khdne/models/vehicle_model.dart';
import 'package:khdne/views/add_vehicle/add_vehicle.dart';

import 'package:khdne/views/login_screen.dart';

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
  //File? image;
  Future<File?> getImage({File? image}) async {
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
  bool registerProcess = false;
  registerUser({
    required String endPoint,
    required String fullName,
    required String phoneNumber,
    required String password,
    required String passwordConfirmation,
    required File image,
  }) async {
    registerProcess = true;
    update();
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

      // registerModel = RegisterModel.fromJson(data);
      //print(registerModel?.userName ?? 'Not found');

      registerProcess = false;
      update();
      Get.to(() => const LoginScreen());
    } else if (streamedResponse.statusCode == 422) {
      var response = await http.Response.fromStream(streamedResponse);
      Map<String, dynamic> failureData = jsonDecode(response.body);

      failure = RegisterFailure.fromJson(failureData);
      registerProcess = false;
      update();
      Get.snackbar('Failed', '${failure!.message}');
    } else {
      print(streamedResponse.reasonPhrase);
      registerProcess = false;
      update();
      Get.snackbar(
          'Failed', 'error with satus code: ${streamedResponse.statusCode}');
    }
  }

  RegisterModel? loginModel;
  RegisterFailure? failure;
  bool loginProcess = false;
  loginUser({
    required String endPoint,
    required String phoneNumber,
    required String password,
  }) async {
    loginProcess = true;
    update();
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
      loginProcess = false;
      update();
      Get.snackbar(' Login Success', 'You have logined successfully');
      Get.to(() => const AddVehicle());
    } else if (response.statusCode == 422) {
      Map<String, dynamic> failureData = jsonDecode(response.body);
      failure = RegisterFailure.fromJson(failureData);
      loginProcess = false;
      update();
      Get.snackbar('Failed', '${failure!.message}');
    } else {
      print('error with satus code: ${response.statusCode}');
    }
  }

  Map<String, File> imagesMap = {};

  addImage({required File image}) {
    imagesMap.addAll({'$image': image});

    update();
  }

  removeImage({required File image}) {
    imagesMap.remove('$image');

    update();
  }

  bool addVehiclePross = false;
  VehicleModel? vehicleModel;
  addNewVehicle({required VehicleModel model, required String token}) async {
    addVehiclePross = true;
    update();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl$kVehicleUrl'));
    request.fields.addAll({
      'vehicle_type_id': model.vehicleType,
      'board_number': model.vehicleNumber,
      'model': model.vehicleModel,
      'color': model.vehicleColor
    });
    request.files.add(await http.MultipartFile.fromPath(
        'vehicle_image', model.vehicleImage.path));
    request.files.add(await http.MultipartFile.fromPath(
        'board_image', model.boardImage.path));
    request.files
        .add(await http.MultipartFile.fromPath('id_image', model.idImage.path));
    request.files.add(await http.MultipartFile.fromPath(
        'mechanic_image', model.mechanicImage.path));
    request.files.add(await http.MultipartFile.fromPath(
        'delegate_image', model.delegateImage.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      addVehiclePross = false;
      update();
      print('********* add successfully');
      Get.snackbar('Success', 'Your vehicle has been added successfly');
    } else {
      print(response.reasonPhrase);
      print('*********Failed  adding ');
       addVehiclePross = false;
      update();
      Get.snackbar('Failed', 'There is an error when adding your vehicle');
    }
  }
}
