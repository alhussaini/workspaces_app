import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/person_widgets/counter_button.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/person_widgets/person_count_display.dart';

class PersonCountControls extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const PersonCountControls({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final personCount = context.read<BookingCubit>().personaNum;

    return Row(
      children: [
        CounterButton(
          icon: Icons.remove,
          onTap: onDecrement,
          enabled: personCount > 1,
        ),
        PersonCountDisplay(),
        CounterButton(
          icon: Icons.add,
          onTap: onIncrement,
          enabled: true,
        ),
      ],
    );
  }
} 