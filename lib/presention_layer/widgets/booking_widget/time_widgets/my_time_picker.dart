import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/time_widgets/start_time_selector.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/time_widgets/end_time_selector.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/date_widgets/date_separator.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/time_widgets/booking_duration_display.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/time_widgets/my_time_picker_theme.dart';

class MyTimePicker extends StatelessWidget {
  const MyTimePicker({super.key});

  Future<void> _selectTimeOfStart(BuildContext context) async {
    final bookingCubit = context.read<BookingCubit>();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MyTimePickerTheme(child: child!);
      },
    );
    if (pickedTime != null) {
      bookingCubit.updateStartTime(pickerStartTime: pickedTime);
      bookingCubit.calculateBookingDuration();
      bookingCubit.calculateTotalPrice();
    }
  }

  Future<void> _selectTimeOfEnd(BuildContext context) async {
    final bookingCubit = context.read<BookingCubit>();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MyTimePickerTheme(child: child!);
      },
    );
    if (pickedTime != null) {
      bookingCubit.updateEndTime(pickerEndTime: pickedTime);
      bookingCubit.calculateBookingDuration();
      bookingCubit.calculateTotalPrice();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: MyColors.backgroundColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: MyColors.borderColor),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: StartTimeSelector(
                        onTap: () => _selectTimeOfStart(context)),
                  ),
                  SizedBox(width: 5.w,),
                  DateSeparator(),
                  SizedBox(width: 5.w,),
                  Expanded(
                    child:
                        EndTimeSelector(onTap: () => _selectTimeOfEnd(context)),
                  ),
                ],
              ),
              BookingDurationDisplay(),
            ],
          ),
        );
      },
    );
  }
} 