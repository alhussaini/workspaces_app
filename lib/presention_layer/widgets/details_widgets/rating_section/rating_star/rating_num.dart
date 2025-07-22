import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class RatingNum extends StatelessWidget {
  const RatingNum({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: MyStrings.poppinsFont,
          fontSize: 38,
          fontWeight: FontWeight.w700,
          color: MyColors.myRed),
    );
  }
}
