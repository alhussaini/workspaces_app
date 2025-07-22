import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/date_widgets/date_column_label.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/date_widgets/date_display.dart';

class StartDateColumn extends StatelessWidget {
  const StartDateColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingCubit = context.read<BookingCubit>();

    return Column(
      children: [
        DateColumnLabel(text: "من يوم"),
        SizedBox(height: 8.h),
        BlocBuilder<BookingCubit, BookingState>(
          buildWhen: (previous, current) {
            return current is BookingStartDateUpdate ||
                current is BookingWithCalender ||
                current is BookingUpdateBothDates;
          },
          builder: (context, state) {
            return DateDisplay(
              date:
                  '${bookingCubit.startDate.day}/${bookingCubit.startDate.month}/${bookingCubit.startDate.year}',
            );
          },
        ),
      ],
    );
  }
} 