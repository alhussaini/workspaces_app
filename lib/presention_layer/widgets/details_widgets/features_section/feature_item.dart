import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        height: 40,
        width: 94,
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.bottomColor, width: 1),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: MyStrings.cairoFont,
                fontSize: 10,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
