import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/book_poll_cubit/booking_boll_cubit.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/submit_button.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/button_widgets/booking_loading_button.dart';

class BookNowButton extends StatelessWidget {
  const BookNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBollCubit, BookingBollState>(
      builder: (context, state) {
        if (state is BookingBollPending) {
          return BookingLoadingButton();
        }
        return SubmitButton(
          press: () {
            context.read<BookingCubit>().bookRequest();
          },
          text: S.of(context).bookNow,
          height: 52.h,
          width: double.infinity,
        );
      },
    );
  }
} 