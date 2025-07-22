import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class DateDisplay extends StatelessWidget {
  final String date;

  const DateDisplay({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(8.r),
        // border: Border.all(color: MyColors.bottomColor.withOpacity(0.3)),
      ),
      child: Text(
        date,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: MyColors.bottomColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
} 