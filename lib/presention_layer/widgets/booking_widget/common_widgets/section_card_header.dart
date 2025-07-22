import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class SectionCardHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionCardHeader({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: MyColors.backgroundColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              icon,
              color: MyColors.bottomColor,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            title,
            style: TextStyle(
              fontFamily: MyStrings.cairoFont,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: MyColors.bottomColor,
            ),
          ),
        ],
      ),
    );
  }
} 