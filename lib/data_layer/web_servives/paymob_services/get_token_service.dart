import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';

class GetTokenService {
  late Dio dio;
  GetTokenService() {
    BaseOptions options = BaseOptions(
      baseUrl: MyStrings.paymobUrl,
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
      }
    );
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> getPayMobToken(String apiKey) async {
    try {
      Map<String, dynamic> requestBody = {
        'api_key': apiKey,
      };
      Response response = await dio.post('auth/tokens',data: requestBody);
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
