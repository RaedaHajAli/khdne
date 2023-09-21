
class RegisterModel {
  final String? userName;
  final String? phone;
  final int? id;
  final String? token;
  final String? message;
  RegisterModel({
    this.userName,
    this.phone,
    this.id,
    this.token,
    this.message,
  });
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        userName: json['data']['fullname'],
        phone: json['data']['phone_number'],
        id: json['data']['id'],
        token: json['data']['token'],
        message: json['message']);
  }
}

class RegisterFailure {
  final dynamic message;
  RegisterFailure({
    this.message,
  });
  factory RegisterFailure.fromJson(Map<String, dynamic> json) {
    return RegisterFailure(message: json['message']);
  }


  
}
