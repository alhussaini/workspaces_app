import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:go_router/go_router.dart';

class BookingAppBar extends StatelessWidget {
  const BookingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: MyColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 48.w),
          Expanded(
            child: Text(
              "احجز الان",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: MyStrings.cairoFont,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: MyColors.bottomColor,
              ),
            ),
          ),
          IconButton(
            onPressed: () => context.pop(),
            icon: Directionality(
              textDirection: TextDirection.ltr,
              child: Icon(
                Icons.arrow_back,
                color: MyColors.bottomColor,
                size: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 