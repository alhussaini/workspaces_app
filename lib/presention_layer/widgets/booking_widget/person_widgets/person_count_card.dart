import 'package:flutter/material.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/common_widgets/section_card_wrapper.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/person_widgets/persons_num.dart';

class PersonCountCard extends StatelessWidget {
  const PersonCountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCardWrapper(
      title: "عدد الأشخاص",
      icon: Icons.people_rounded,
      child: PersonsNum(),
    );
  }
} 