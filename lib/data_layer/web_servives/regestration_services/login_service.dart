import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/helpers/dio_helper.dart';

class LoginService {
  final DioHelper dioHelper;
  LoginService({required this.dioHelper});
  // LoginService() {
  //   BaseOptions options = BaseOptions(
  //       baseUrl: MyStrings.baseUrl1,
  //       receiveDataWhenStatusError: true,
  //       connectTimeout: Duration(seconds: 60),
  //       receiveTimeout: Duration(seconds: 60),
  //       headers: {
  //         'User-Agent': 'Dart',
  //         'Content-Type': 'application/json',
  //       });
  //   dio = Dio(options);
  // }
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      Map<String, dynamic> requestBody = {
        'username_or_email': email,
        'password': password,
      };

      print("Attempting login with email: $email");
      print("Login endpoint: ${MyStrings.baseUrl1}login");
      final options = RequestOptions(
        method: "POST",
        path: "login",
         extra: {
          'baseUrl': MyStrings.baseUrl1,
        },
      data: requestBody,
      );

      Response response = await dioHelper.dio.fetch(options);
      print("Response status code: ${response.statusCode}");
      print("Response data: ${response.data}");

      return response.data;
    } catch (e) {
      if (e is DioException) {
        print("DioError type: ${e.type}");
        print("DioError message: ${e.message}");
        print("DioError response: ${e.response?.data}");
        print("DioError status code: ${e.response?.statusCode}");
      }
      rethrow;
    }
  }
}
