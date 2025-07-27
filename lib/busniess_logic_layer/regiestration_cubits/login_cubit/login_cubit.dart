import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:workspace/data_layer/models/secure_storage.dart';
import 'package:workspace/data_layer/reopstries/regestration_repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordlTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  Future<void> login() async {
    if (isClosed) return; // Prevent operations on closed cubit

    emit(LoginLoading());
    try {
      var result = await loginRepo.login(
          emailTextController.text, passwordlTextController.text);

      if (isClosed) return; // Check again after async operation

      result.fold((fauiler) => emit(LoginFauiled(error: fauiler.errorMessage)),
          (success) async{
        await SecureStorage.setAccessToken(success.loginData.token);
        emit(LoginSuccess());
      });
    } catch (e) {
      if (!isClosed) emit(LoginFauiled(error: e.toString()));
    }
  }
}
