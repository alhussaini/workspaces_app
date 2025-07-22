import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:workspace/data_layer/error/fauiler.dart';
import 'package:workspace/data_layer/models/password_models/request_password_reset.dart';
import 'package:workspace/data_layer/web_servives/password_services/resst_password_service.dart';

class PasswordRepo {
  final ResetPasswordService passwordService;
  PasswordRepo(this.passwordService);
  Future<Either<Failure,RequestPasswordResetResponse>> resetPassword({required String email}) async {
    try {
     var data = await passwordService.resetPassword(email: email);
      print("Response from password repo is $data");
      return right(RequestPasswordResetResponse.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        print("fauiler from login repoz is $e");
        return left(ServerFailure.fromDioError(e));
      } else {// هفصل اني ديسك عشان افهم منك واتس
        print("fauiler from login repoz is $e");
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
