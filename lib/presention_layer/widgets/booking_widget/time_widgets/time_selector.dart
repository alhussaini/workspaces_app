import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class TimeSelector extends StatelessWidget {
  final String label;
  final String time;
  final VoidCallback onTap;

  const TimeSelector({
    super.key,
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: MyStrings.cairoFont,
              fontSize: 12.sp,
              color: MyColors.mainTextHeadersColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: MyColors.backgroundColor,
              borderRadius: BorderRadius.circular(8.r),
              // border: Border.all(color: MyColors.bottomColor.withOpacity(0.3)),
            ),
            child: Text(
              time,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.bottomColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 