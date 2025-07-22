import 'package:flutter/material.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/common_widgets/section_card_wrapper.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/time_widgets/my_time_picker.dart';

class TimeSelectionCard extends StatelessWidget {
  const TimeSelectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCardWrapper(
      title: "اختيار الوقت",
      icon: Icons.access_time_rounded,
      child: MyTimePicker(),
    );
  }
} 