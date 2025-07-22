import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:workspace/data_layer/error/fauiler.dart';
import 'package:workspace/data_layer/models/regestrations_models/login_model.dart';
import 'package:workspace/data_layer/web_servives/regestration_services/login_service.dart';

class LoginRepo {
  final LoginService loginService;

  LoginRepo({required this.loginService});

  Future<Either<Failure, LoginModel>> login(
      String email, String password) async {
    try {
      var data = await loginService.login(email, password);
      print("Response from login repo is $data");
      return right(LoginModel.fromJson(data));
      
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
