import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:workspace/data_layer/error/fauiler.dart';
import 'package:workspace/data_layer/models/paymob_models/payment_request.dart';
import 'package:workspace/data_layer/models/paymob_models/paymob_response_model.dart';
import 'package:workspace/data_layer/web_servives/paymob_services/payment_request_service.dart';


class PaymentRequestRepo {
  final PaymentRequestService paymentRequestService;

  PaymentRequestRepo({required this.paymentRequestService});

  Future<Either<Failure,PaymobResponseModel>> paymentRequest(
      PaymentRequest paymentRequest) async {
    try {
      var data = await paymentRequestService.paymentRequest(paymentRequest);
      print("Response from createOrder repo: $data");
      return Right(PaymobResponseModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        print("Failure in createOrder repo: $e");
        return Left(ServerFailure.fromDioError(e));
      } else {
        print("Unexpected error: $e");
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}