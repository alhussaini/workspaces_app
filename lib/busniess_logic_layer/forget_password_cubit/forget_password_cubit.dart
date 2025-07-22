import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:workspace/data_layer/reopstries/password_repo/password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.passwordRepo) : super(ForgetPasswordInitial());
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PasswordRepo passwordRepo;

  Future<void> resetPassword() async {
    emit(ForgetPasswordLoading());
    var result =
        await passwordRepo.resetPassword(email: email.text);
    result.fold((failure) {
      emit(ForgetPasswordFauiler(errorMessage: failure.errorMessage));
    }, (success) {
      emit(ForgetPasswordSuccess(message: success.data.message));
    });
  }
}
