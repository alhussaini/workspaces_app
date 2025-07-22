import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/date_widgets/start_date_column.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/date_widgets/end_date_column.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/date_widgets/date_separator.dart';

class DateTestPicker extends StatelessWidget {
  const DateTestPicker({super.key});

  void pickDateRange(
      BuildContext context, DateTime firstDate, DateTime lastDate) async {
    final bookingCubit = context.read<BookingCubit>();
    final pickedRange = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      locale: Locale('ar'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: MyColors.bottomColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.grey.shade800,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedRange != null) {
      bookingCubit.updateDates(
        pickerStartdate: pickedRange.start,
        pickerEnddate: pickedRange.end,
      );
      bookingCubit.calculateTotalPrice();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookingCubit = context.read<BookingCubit>();

    return GestureDetector(
      onTap: () {
        pickDateRange(context, bookingCubit.firstDate, bookingCubit.lastDate);
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: MyColors.backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: MyColors.borderColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: StartDateColumn(),
            ),
            DateSeparator(),
            Expanded(
              child: EndDateColumn(),
            ),
          ],
        ),
      ),
    );
  }
} 