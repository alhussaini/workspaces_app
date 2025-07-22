import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/fields_widgets/label.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/fields_widgets/single_field.dart';

class FieldWithLabel extends StatelessWidget {
  const FieldWithLabel(
      {super.key,
      required this.text,
      required this.controller,
      required this.validator,
      required this.isSecure});
  final String text;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool isSecure;

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: EdgeInsets.symmetric(vertical: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(text: text),
          SingleField(
            isSecure: isSecure,
            controller: controller,
            validator: validator,
          )
        ],
      ),
    );
  }
}
