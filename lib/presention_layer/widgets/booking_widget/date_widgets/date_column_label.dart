import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateColumnLabel extends StatelessWidget {
  final String text;

  const DateColumnLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        color: Colors.grey.shade600,
        fontWeight: FontWeight.w500,
      ),
    );
  }
} 