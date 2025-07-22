import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/regiestration_cubits/login_cubit/login_cubit.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/fields_widgets/field_with_label.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/submit_button.dart';
import 'package:go_router/go_router.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var C = context.read<LoginCubit>();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // ✅ Navigate away
          context.goNamed(MyStrings.homeScreen);
        }
      },
      builder: (context, state) {
        if (state is LoginSuccess) {
          // 🚫 Don't build anything if login succeeded
          return Container(); // Or const SizedBox()
        }

        if (state is LoginInitial || state is LoginFauiled) {
          return buildLoginForm(context, C, state);
        } else if (state is LoginLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            body: Center(child: Text("Unknown error")),
          );
        }
      },
    );
  }

  Form buildLoginForm(BuildContext context, LoginCubit C, LoginState state) {
    return Form(
      key: C.formKey,
      child: Column(
        children: [
          FieldWithLabel(
            isSecure: false,
            text: S.of(context).email,
            controller: C.emailTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              }
              return null;
            },
          ),
          FieldWithLabel(
            isSecure: true,
            text: S.of(context).password,
            controller: C.passwordlTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              }
              if (value.length < 5) {
                return 'Please enter at least 5 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 25.h),
          SubmitButton(
            press: () {
              if (C.formKey.currentState!.validate()) {
                C.login();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Processing Data')),
                );
              }
            },
            text: S.of(context).bouttonSubmitLogin,
            height: 52.h,
            width: double.infinity,
          ),
          SizedBox(
            height: 100.h,
            child: Text(
              state is LoginFauiled ? state.error : "",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
