import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/forget_password_cubit/forget_password_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/screens/edit_profile_screen.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/submit_button.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/fields_widgets/field_with_label.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/regestration_icons/arrow_back_icon.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/welcome_widgets/leadinr_text_in_regestration.dart';

class RememberPasswordScreen extends StatelessWidget {
  const RememberPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ForgetPasswordCubit>();

    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              showDialog(
                  context: context,
                  builder: (context) => SuccessDialog(
                      message: state.message,
                      onClose: () {
                        Navigator.pushNamed(context, MyStrings.verifyScreen);
                      }));
            }
          },
          builder: (context, state) {
            if (state is ForgetPasswordLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return RemeberForm(cubit: cubit, height: height);
          },
        ),
      ),
    ));
  }
}

class RemeberForm extends StatelessWidget {
  const RemeberForm({
    super.key,
    required this.cubit,
    required this.height,
  });

  final ForgetPasswordCubit cubit;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: ArrowBackIcon(height: height)),
          LeadingTextInRegestration(text: "هل نسيت كلمة السر "),
          RPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Text(
              "لا تقلق! أدخل عنوان بريدك الإلكتروني أدناه وسنرسل لك رمزًا لإعادة تعيين كلمة المرور.",
              maxLines: 2,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.verifyTextColor),
            ),
          ),
          FieldWithLabel(
            isSecure: false,
            text: S.of(context).email,
            controller: cubit.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            builder: (context, state) {
              if (state is ForgetPasswordFauiler) {
                return SizedBox(
                  height: 40.h,
                  child: Text(state.errorMessage),
                );
              }
              return Container();
            },
          ),
          SizedBox(
            height: height / 20,
          ),
          SubmitButton(
            press: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.resetPassword();
              }
            },
            text: "إرسال الرمز",
            height: 52.h,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
