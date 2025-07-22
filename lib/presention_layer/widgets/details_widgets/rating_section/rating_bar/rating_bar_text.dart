import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class RatingBarText extends StatelessWidget {
  const RatingBarText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: MyStrings.poppinsFont,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: MyColors.mainTextHeadersColor),
      ),
    );
  }
}
