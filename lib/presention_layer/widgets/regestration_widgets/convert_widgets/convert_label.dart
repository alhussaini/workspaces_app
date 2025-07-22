import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConvertLabel extends StatelessWidget {
  const ConvertLabel({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color(0xff000000),
          fontSize: 14.sp,
          fontWeight: FontWeight.w700),
    );
  }
}
