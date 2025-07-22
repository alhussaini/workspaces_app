import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class DateSeparator extends StatelessWidget {
  const DateSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 40.h,
      color: MyColors.bottomColor,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
    );
  }
} 