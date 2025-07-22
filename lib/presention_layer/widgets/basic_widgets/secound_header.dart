import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class SecoundHeader extends StatelessWidget {
  const SecoundHeader({super.key, required this.text, required this.fontSize});
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 2),
      child: Text(
        text,
        style: TextStyle(
            height: 1.5,
            fontFamily: MyStrings.cairoFont,
            color: MyColors.myRed,
            fontSize: 14,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
