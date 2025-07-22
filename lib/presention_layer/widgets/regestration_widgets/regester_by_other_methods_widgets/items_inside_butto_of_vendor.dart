import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workspace/constants/my_colors.dart';

class ItemsInsideButtonOfVendor extends StatelessWidget {
  const ItemsInsideButtonOfVendor({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          height: 24.h,
          width: 24.w,
        ),
        SizedBox(width: 15.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: MyColors.vendorTextButton,
          ),
        ),
      ],
    );
  }
}
