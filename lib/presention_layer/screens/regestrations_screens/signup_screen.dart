import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/regiestration_cubits/sigin_up/sigin_up_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/screens/edit_profile_screen.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/convert_widgets/convert_widget.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/sigin_up/sigin_up_form.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/welcome_widgets/welcome_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: BlocConsumer<SiginUpCubit, SiginUpState>(
        listener: (context, state) {
          if (state is SiginUpSucsess) {
            showDialog(
                context: context,
                builder: (context) =>
                    SuccessDialog(message: state.message, onClose: () {}));
          }
        },
        builder: (context, state) {
          if (state is SiginUpLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SignUpBody(height: height);
        },
      ),
    );
  }
}

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Align(
        alignment: Alignment.topRight,
        child: Column(
          children: [
            SizedBox(
              height: height / 16,
            ),
            WelcomeWidget(
                headText: '${S.of(context).welcomeStatementInSignUp}\n',
                secondText: S.of(context).theGuidingStatmentInSignUp),
            SizedBox(
              height: height / 35,
            ),
            SiginUpForm(height: height / 35),
            buildConfirmPolicy(),
            SizedBox(
              height: height / 43,
            ),
            ConvertWidget(
              labelText: S.of(context).convertLabelInSigUp,
              buttonText: S.of(context).bouttonConvertInSigUp,
              onPressed: () {
                Navigator.pushNamed(context, MyStrings.loginScreen);
              },
            ),
          ],
        ),
      ),
    ));
  }
}

buildConfirmPolicy() {
  return RPadding(
      padding: EdgeInsets.all(16.0.r),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(
                    text: 'بالضغط على ',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: '،تسجيل مستخدم جديد',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    ),
                  ),
                  const TextSpan(
                    text: 'فانت توافق علي ',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: 'سياسة الاستخدام \n',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Privacy tapped');
                      },
                  ),
                  const TextSpan(
                    text: 'والخصوصية',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ]));
}
