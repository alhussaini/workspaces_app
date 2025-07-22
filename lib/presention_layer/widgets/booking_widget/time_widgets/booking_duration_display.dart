import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/constants/my_colors.dart';

class BookingDurationDisplay extends StatelessWidget {
  const BookingDurationDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingCubit = context.read<BookingCubit>();

    if (bookingCubit.bookDuration.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: MyColors.backgroundColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            "المدة: ${bookingCubit.bookDuration}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: MyColors.bottomColor,
            ),
          ),
        ),
      ],
    );
  }
} 