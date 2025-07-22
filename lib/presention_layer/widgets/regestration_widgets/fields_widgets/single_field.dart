import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class SingleField extends StatefulWidget {
  final TextEditingController controller;
  const SingleField({
    super.key,
    required this.controller,
    required this.validator,
    required this.isSecure,
  });

  final FormFieldValidator<String>? validator;
  final bool isSecure;

  @override
  State<SingleField> createState() => _SingleFieldState();
}

class _SingleFieldState extends State<SingleField> {//neww stat and sections
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");//new
    return RPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.r,
      ),
      child: TextFormField(
        obscureText:widget.isSecure,
         focusNode: _focusNode,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.borderColor, width: 2.0.w),
            borderRadius: BorderRadius.circular(68.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.bottomColor, width: 3.0.w),
            borderRadius: BorderRadius.circular(68.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0.w),
            borderRadius: BorderRadius.circular(68.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 3.0.w),
            borderRadius: BorderRadius.circular(68.r),
          ),
        ),
      ),
    );
  }
}
