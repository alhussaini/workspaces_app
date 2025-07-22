import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  final TextEditingController fullNmae = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UserType? selectedUserType;
  void setUserType(UserType type) {
    selectedUserType = type;
    emit(EditProfileStatus()); // Rebuild UI
  }

  String? validateUserType(UserType? type) {
    if (selectedUserType == null) {
      return 'Please select a user type';
    } else {
      setUserType(type!);
    }
    return null;
  }

  void saveProfileData() {
    emit(EditProfileSuccess());
  }
}

enum UserType {
  student('طالب'),
  freelancer('عمل حر'),
  company('شركة');

  final String label;
  const UserType(this.label);
}
