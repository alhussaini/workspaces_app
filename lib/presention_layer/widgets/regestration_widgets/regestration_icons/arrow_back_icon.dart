import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class ArrowBackIcon extends StatelessWidget {
  const ArrowBackIcon({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: EdgeInsets.only(top: 24.r, left: 22.r),
      child: SizedBox(
        height: height / 14,
        child: Icon(
          Icons.arrow_back,
          color: MyColors.bottomColor,
        ),
      ),
    );
  }
}
