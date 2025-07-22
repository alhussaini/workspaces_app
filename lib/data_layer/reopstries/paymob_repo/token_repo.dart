import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:workspace/data_layer/error/fauiler.dart';
import 'package:workspace/data_layer/models/paymob_models/paymob_login_model.dart';
import 'package:workspace/data_layer/web_servives/paymob_services/get_token_service.dart';

class TokenRepo {
  final GetTokenService getTokenService;

  TokenRepo({required this.getTokenService});
  Future<Either<Failure,PaymobLoginModel>> getPayMobToken(String apiKey) async {
    try {
      var data =
          await getTokenService.getPayMobToken(apiKey);
      return right(PaymobLoginModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        print("fauiler from token repoz is $e");
        return left(ServerFailure.fromDioError(e));
      } else {
        print("fauiler from token repoz is $e");
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
