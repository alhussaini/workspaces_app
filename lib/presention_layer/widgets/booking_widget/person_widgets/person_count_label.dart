import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class PersonCountLabel extends StatelessWidget {
  const PersonCountLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "عدد الأشخاص",
      style: TextStyle(
        fontFamily: MyStrings.cairoFont,
        fontSize: 16.sp,
        color: MyColors.bottomColor,
        // color: Colors.grey.shade800,
        fontWeight: FontWeight.w600,
      ),
    );
  }
} 