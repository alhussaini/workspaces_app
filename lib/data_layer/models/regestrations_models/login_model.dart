class LoginModel {
  final bool success;
  final LoginData loginData;

  LoginModel({required this.success, required this.loginData});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'],
      loginData: LoginData.fromJson(json['data']),
    );
  }
}
//رد 

class LoginData {
  final String message;
  final String token;
  final String redirect;

  LoginData(
      {required this.message, required this.token, required this.redirect});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
        message: json['message'],
        token: json['token'],
        redirect: json['redirect']);
  }
}
