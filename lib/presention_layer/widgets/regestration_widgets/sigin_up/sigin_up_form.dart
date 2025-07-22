import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/regiestration_cubits/sigin_up/sigin_up_cubit.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/submit_button.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/fields_widgets/field_with_label.dart';

class SiginUpForm extends StatelessWidget {
  const SiginUpForm({
    super.key,
    required this.height,
  });
  final double height;

  @override 
  Widget build(BuildContext context) {
    return RegisterForm(
      height: height,
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    var cubitc = context.read<SiginUpCubit>();
    return Form(
      key: cubitc.formKey,
      child: Column(
        children: [
          FieldWithLabel(
            isSecure: false,
            text: S.of(context).fullName,
            controller: cubitc.nameTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              }
              return null;
            },
          ),
          FieldWithLabel(
            isSecure: false,
            text: S.of(context).email,
            controller: cubitc.emailTextController,
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
          FieldWithLabel(
            isSecure: true,
            text: S.of(context).password,
            controller: cubitc.passwordlTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              }
              return null;
            },
          ),
          FieldWithLabel(isSecure:true ,
            text: S.of(context).reconfirmPassword,
            controller: cubitc.confirmPasswordTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              }
              return null;
            },
          ),
          BlocBuilder<SiginUpCubit, SiginUpState>(
            builder: (context, state) {
              if (state is SiginUpFauiled) {
                return SizedBox(
                  height: 100.h,
                  child: Text(state.errorMessage),
                );
              }
              return Container();
            },
          ),
          SizedBox(
            height: height,
          ),
          SubmitButton(
            press: () {
              if (cubitc.confirmPasswordTextController.text !=
                  cubitc.passwordlTextController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Passwords do not match'),
                  ),
                );
              }
            else  if ((cubitc.formKey.currentState!.validate())) {
                cubitc.register();
              }
            },
            text: S.of(context).bouttonSubmitSiginUp,
            height: 52.h,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
