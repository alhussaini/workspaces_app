import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget(
      {super.key, required this.headText, required this.secondText});
  final String headText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: headText,
        style: TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: MyColors.mainTextHeadersColor,
        ),
        children: [
          TextSpan(
            text: secondText, // النص الثانوي
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.secoundTextHeadersColor,
            ),
          ),
        ],
      ),
    );
  }
}
