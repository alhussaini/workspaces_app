import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';

class SharingRoomsText extends StatelessWidget {
  const SharingRoomsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        'المساحات المشتركه 25.00 / 3 ساعات',
        style: TextStyle(
            color: MyColors.mainTextHeadersColor,
            fontSize: 12,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
