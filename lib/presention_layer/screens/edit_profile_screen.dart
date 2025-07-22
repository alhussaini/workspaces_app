import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/edit_profle_cubit.dart/edit_profile_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/presention_layer/screens/profile_screen.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/fields_widgets/field_with_label.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<EditProfileCubit>();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: MyColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Container(),
          elevation: 0,
          actions: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: MyColors.bottomColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        body: BlocListener<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileSuccess) {
              showDialog(
                context: context,
                builder: (context) => SuccessDialog(
                  message: 'Profile updated successfully',
                  onClose: () {
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: Align(
                alignment: Alignment.topRight,
                child: EditForm(
                  editProfileCubit: myCubit,
                )),
          ),
        ),
      ),
    );
  }
}

class EditForm extends StatelessWidget {
  const EditForm({
    super.key,
    required this.editProfileCubit,
  });
  final EditProfileCubit editProfileCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        if (state is EditProfileInitial || state is EditProfileSuccess) {
          return FormBody(editProfileCubit: editProfileCubit);
        } else if (state is EditProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Text("unKnown User"),
          );
        }
      },
    );
  }
}

class FormBody extends StatelessWidget {
  const FormBody({
    super.key,
    required this.editProfileCubit,
  });

  final EditProfileCubit editProfileCubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: editProfileCubit.formKey,
      child: Column(
        children: [
          EditMyProfileTextAndIcon(),
          SizedBox(height: 15.h),
          FieldWithLabel(
            isSecure: false,
              text: "الاسم الكامل",
              controller: editProfileCubit.fullNmae,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                if (value.length < 5) {
                  return 'Please enter at least 5 characters';
                }
                return null;
              }),
          FieldWithLabel(
            isSecure: false,
              text: "رقم الهاتف",
              controller: editProfileCubit.phoneNumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                if (value.length < 5) {
                  return 'Please enter at least 5 characters';
                }
                return null;
              }),
          FieldWithLabel(
            isSecure: false,
              text: "كلمة المرور",
              controller: editProfileCubit.password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                if (value.length < 5) {
                  return 'Please enter at least 5 characters';
                }
                return null;
              }),
          FieldWithLabel(
            isSecure: false,
              text: "تأكيد كلمة المرور",
              controller: editProfileCubit.confirmPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                if (value.length < 5) {
                  return 'Please enter at least 5 characters';
                }
                return null;
              }),
          UserTypeDropdown(
            cubit: editProfileCubit,
          ),
          BlocBuilder<EditProfileCubit, EditProfileState>(
            builder: (context, state) {
              if (state is EditProfileFailure) {
                return Text(
                  state.errorMessage,
                  style: TextStyle(fontSize: 16, color: Colors.red),
                );
              } else {
                return SizedBox();
              }
            },
          ),
          SizedBox(
            height: 100.h,
          ),
          EditProfileButtons(),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
}

class EditProfileButtons extends StatelessWidget {
  const EditProfileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Cancel Button (الغاء)
        Container(
          height: 50.h,
          width: 120.w,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: MyColors.bottomColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextButton(
            onPressed: () {
              // Add your cancel action here
              print('الغاء pressed');
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'الغاء',
              style: TextStyle(
                color: MyColors.bottomColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        SizedBox(width: 20.w),

        // Save Button (حفظ)
        Container(
          height: 50.h,
          width: 120.w,
          decoration: BoxDecoration(
            color: MyColors.bottomColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextButton(
            onPressed: () {
              // Add your save action here
              context.read<EditProfileCubit>().saveProfileData();
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'حفظ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserTypeDropdown extends StatelessWidget {
  const UserTypeDropdown({super.key, required this.cubit});
  final EditProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'يرجى تحديد حالتك فضلاً.',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BlocBuilder<EditProfileCubit, EditProfileState>(
              builder: (context, state) {
                if (state is EditProfileStatus) {
                  return StatusField(cubit: cubit);
                }
                return StatusField(cubit: cubit);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StatusField extends StatelessWidget {
  const StatusField({
    super.key,
    required this.cubit,
  });

  final EditProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<UserType>(
      value: cubit.selectedUserType,
      isExpanded: true,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        border: InputBorder.none,
      ),
      onChanged: (UserType? newValue) {
        cubit.validateUserType(newValue);
      },
      items: UserType.values.map((UserType item) {
        return DropdownMenuItem<UserType>(
          value: item,
          child: Row(
            children: [
              Icon(
                item == cubit.selectedUserType
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: item == cubit.selectedUserType
                    ? MyColors.bottomColor
                    : Colors.grey,
              ),
              SizedBox(width: 12),
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 16,
                  color: item == cubit.selectedUserType
                      ? MyColors.bottomColor
                      : Colors.black,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String message;
  final VoidCallback onClose;

  const SuccessDialog({
    super.key,
    required this.message,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: MyColors.bottomColor,
              size: 48,
            ),
            SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
