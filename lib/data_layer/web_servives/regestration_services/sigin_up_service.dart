import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';

class SiginUpService {
  late Dio dio;
  SiginUpService() {
    BaseOptions options = BaseOptions(
        baseUrl: MyStrings.baseUrl1,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        headers: {'Content-Type': 'application/json'});
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> siginUp(String name, String email,
      String password, String confirmPassword) async {
    Map<String, dynamic> requestBody = {
      'username':name,
      'email': email,
      'password': password,
    };
    Response response = await dio.post('register', data: requestBody);
    return response.data;
  }
}
