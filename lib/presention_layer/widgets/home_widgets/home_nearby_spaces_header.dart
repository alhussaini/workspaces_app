import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class HomeNearbySpacesHeader extends StatelessWidget {
  final VoidCallback? onViewAllTap;

  const HomeNearbySpacesHeader({
    super.key,
    this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "أقرب المساحات",
          style: TextStyle(fontSize: 18, color: MyColors.bottomColor,fontWeight: FontWeight.bold,fontFamily: MyStrings.cairoFont),
        ),
        GestureDetector(
          onTap: onViewAllTap,
          child: const Text(
            "مشاهدة الكل",
            style: TextStyle(fontSize: 14, color:Colors.grey),
          ),
        ),
      ],
    );
  }
} 