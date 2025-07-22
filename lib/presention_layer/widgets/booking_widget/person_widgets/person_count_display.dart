import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class PersonCountDisplay extends StatelessWidget {
  const PersonCountDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: MyColors.bottomColor),
        // border: Border.all(color: MyColors.bottomColor.withOpacity(0.3)),
      ),
      child: Text(
        context.read<BookingCubit>().personaNum.toString(),
        style: TextStyle(
          fontFamily: MyStrings.cairoFont,
          fontSize: 16.sp,
          color: MyColors.bottomColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
} 