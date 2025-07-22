import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:workspace/data_layer/error/fauiler.dart';
import 'package:workspace/data_layer/models/regestrations_models/sign_up_model.dart';
import 'package:workspace/data_layer/web_servives/regestration_services/sigin_up_service.dart';

class SiginUpRepo {
  final SiginUpService siginUpService;

  SiginUpRepo({required this.siginUpService});

  Future<Either<Failure, SignUpModel>> signUp(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      var data = await siginUpService.siginUp(
        name,
        email,
        password,
        confirmPassword,
      );
      return right(SignUpModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
