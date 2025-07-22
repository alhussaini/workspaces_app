import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';

class GetUserProfileDataService {
  late Dio dio;
  final String token;
  GetUserProfileDataService(this.token) {
    BaseOptions options = BaseOptions(
        baseUrl: MyStrings.baseUrl2,
        receiveDataWhenStatusError: true,
        headers: {
          //'User-Agent': 'Dart',
          'Content-Type': 'application/json',
          'Authorization': token
        });
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> getUserProfileData() async {
    try {
      Response response = await dio.get(
        'GET-profile',
      );
      print("Response status code: ${response.statusCode}");
      print("Response headers: ${response.headers}");
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
