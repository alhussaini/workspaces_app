import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/data_layer/models/book_models/booking_request_body_model.dart';

class BookRequestService {
  late Dio dio;
  final String token;

  BookRequestService({required this.token}) {
    print('book token is $token');
    BaseOptions options = BaseOptions(
        baseUrl: MyStrings.baseUrl2,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        headers: {
          //'User-Agent': 'Dart',
          'Content-Type': 'application/json',
          'Authorization': token
        });
    print('secound token is$token');
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> bookRequestService(
      BookingRequestBodyModel bookingRequestBody) async {
    try {
      Map<String, dynamic> requestBody = bookingRequestBody.toJson();
      Response response = await dio.post('book', data: requestBody);
      print("Response status code from book request: ${response.statusCode}");
      print("Response data from book request: ${response.data}");
      return response.data;
    } catch (e) {
      if (e is DioException) {
        print("DioError type from book request: ${e.type}");
        print("DioError message from book request: ${e.message}");
        print("DioError response from book request: ${e.response?.data}");
        print(
            "DioError status code from book request: ${e.response?.statusCode}"); //وانا عامل جمل طباعة كتير
      }
      rethrow;
    }
  }
}
