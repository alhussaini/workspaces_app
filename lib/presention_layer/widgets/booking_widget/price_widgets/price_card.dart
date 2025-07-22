import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class PriceCard extends StatelessWidget {
  final String text;
  final bool isPrice;

  const PriceCard({
    super.key,
    required this.text,
    required this.isPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: MyColors.backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color:
             MyColors.bottomColor ,// with obacity
              
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
           
                 Icons.monetization_on_rounded
               ,
            color: MyColors.bottomColor,
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.bottomColor ,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
} 