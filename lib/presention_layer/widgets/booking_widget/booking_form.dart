import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/time_widgets/time_selection_card.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/date_widgets/date_selection_card.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/person_widgets/person_count_card.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/price_widgets/price_display_card.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/common_widgets/booking_error_message.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/button_widgets/book_now_button.dart';

class BookingForm extends StatelessWidget {
  const BookingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TimeSelectionCard(),
        SizedBox(height: 20.h),
        DateSelectionCard(),
        SizedBox(height: 20.h),
        PersonCountCard(),
        SizedBox(height: 20.h),
        PriceDisplayCard(),
        BookingErrorMessage(),
        SizedBox(height: 30.h),
        BookNowButton(),
      ],
    );
  }
} 