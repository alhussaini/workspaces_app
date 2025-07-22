import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/common_widgets/section_card_wrapper.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/date_widgets/date_test_picker.dart';

class DateSelectionCard extends StatelessWidget {
  const DateSelectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCardWrapper(
      title: "اختيار التاريخ",
      icon: Icons.calendar_month,
      child: BlocBuilder<BookingCubit, BookingState>(
        buildWhen: (previous, current) {
          bool doBuild = (current is BookingWithCalender);
          return doBuild;
        },
        builder: (context, state) {
          return DateTestPicker();
        },
      ),
    );
  }
} 