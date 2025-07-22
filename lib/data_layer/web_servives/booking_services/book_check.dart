import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';

class BookCheckService {
  late Dio dio;
  BookCheckService() {
    BaseOptions options = BaseOptions(
        baseUrl: MyStrings.baseUrl2,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        headers: {
          //'User-Agent': 'Dart',
          'Content-Type': 'application/json',
          
        });
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> bookPolling(int bookingId) async {
    try {
      Response response =
          await dio.get('check-booking-status', queryParameters: {
        'booking_id': bookingId,
      });
      print("Response status code: ${response.statusCode}");
      print("Response data: ${response.data}");
      return response.data;
    } catch (e) {
      if (e is DioException) {
        print("DioError type: ${e.type}");
        print("DioError message: ${e.message}");
        print("DioError response: ${e.response?.data}");
        print(
            "DioError status code: ${e.response?.statusCode}"); //وانا عامل جمل طباعة كتير
      }
      rethrow;
    }
  }
}
