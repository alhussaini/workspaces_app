import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/regester_by_other_methods_widgets/items_inside_butto_of_vendor.dart';

class VendorButton extends StatelessWidget {
  const VendorButton({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 161.w,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
            side: BorderSide(color: MyColors.borderColor),
          ),
        ),
        onPressed: () {},
        child: ItemsInsideButtonOfVendor(
          image: image,
          text: text,
        ),
      ),
    );
  }
}
