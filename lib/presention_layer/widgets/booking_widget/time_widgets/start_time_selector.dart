import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/time_widgets/time_selector.dart';

class StartTimeSelector extends StatelessWidget {
  final VoidCallback onTap;

  const StartTimeSelector({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bookingCubit = context.read<BookingCubit>();

    return TimeSelector(
      label: "من الساعة",
      time: bookingCubit.startTime.format(context) ,
      onTap: onTap,
    );
  }
} 