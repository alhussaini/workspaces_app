import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/person_widgets/person_count_controls.dart';

class PersonsNum extends StatefulWidget {
  const PersonsNum({super.key});

  @override
  State<PersonsNum> createState() => _PersonsNumState();
}

class _PersonsNumState extends State<PersonsNum> {
  void increment(BuildContext context) {
    setState(() {
      context.read<BookingCubit>().personaNum++;
    });
    context.read<BookingCubit>().calculateTotalPrice();
  }

  void decrement(BuildContext context) {
    setState(() {
      if (context.read<BookingCubit>().personaNum > 1) {
        context.read<BookingCubit>().personaNum--;
      }
    });
    context.read<BookingCubit>().calculateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // PersonCountLabel(),
          PersonCountControls(
            onIncrement: () => increment(context),
            onDecrement: () => decrement(context),
          ),
        ],
      ),
    );
  }
} 