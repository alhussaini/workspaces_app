import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/data_layer/models/paymob_models/payment_request.dart';

class PaymentRequestService {
  late Dio dio;

  PaymentRequestService() {
    BaseOptions options = BaseOptions(
      baseUrl: MyStrings.paymobUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> paymentRequest(PaymentRequest paymentRequest) async {
    try {
      final response = await dio.post(
        'ecommerce/orders',
        data: paymentRequest.toJson(),
      );

      print("Response status code: ${response.statusCode}");
      print("Response data: ${response.data}");

      return response.data;
    } catch (e) {
      if (e is DioException) {
        print("DioError type: ${e.type}");
        print("DioError message: ${e.message}");
        print("DioError response: ${e.response?.data}");
        print("DioError status code: ${e.response?.statusCode}");
        rethrow;
      }
      rethrow;
    }
  }
}