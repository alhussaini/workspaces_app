import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workspace/data_layer/reopstries/regestration_repo/sigin_up_repo.dart';

part 'sigin_up_state.dart';

class SiginUpCubit extends Cubit<SiginUpState> {
  SiginUpCubit({required this.signupRepo}) : super(SiginUpInitial());
  SiginUpRepo signupRepo;
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordlTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> register() async {
    emit(SiginUpLoading());
    var result = await signupRepo.signUp(
        nameTextController.text,
        emailTextController.text,
        passwordlTextController.text,
        confirmPasswordTextController.text);
    result.fold((fauiler) {
      emit(SiginUpFauiled(errorMessage: fauiler.errorMessage));
    }, (sucsees) {
      emit(SiginUpSucsess(message: sucsees.message));
    });
  }
}
