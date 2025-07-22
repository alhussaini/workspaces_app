import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required this.percentage});
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LinearProgressIndicator(
        value: percentage,
        minHeight: 6,
        backgroundColor: MyColors.ratingBarColor,
        valueColor: AlwaysStoppedAnimation<Color>(MyColors.bottomColor),
        borderRadius: BorderRadius.circular(8), // حواف ناعمة للشريط
      ),
    );
  }
}
