import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return RPadding(
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 4.r),
        child: Text(
          text,
          style: TextStyle(color: MyColors.textHintsColor, fontSize: 12.sp),
        ));
  }
}
