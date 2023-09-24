
class RegisterModel {
  final String? userName;
  final String? phone;
  final int? id;
  final String? token;

  RegisterModel({
    this.userName,
    this.phone,
    this.id,
    this.token,

  });
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        userName: json['data']['user']['fullname'],
        phone: json['data']['user']['phone_number'],
        id: json['data']['user']['id'],
        token: json['data']['token'],
      
        );
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
