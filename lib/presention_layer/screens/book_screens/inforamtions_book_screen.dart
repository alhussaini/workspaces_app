import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/book_poll_cubit/booking_boll_cubit.dart';
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/booking_app_bar.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/booking_form.dart';
import 'package:go_router/go_router.dart';

class InforamtionsBookScreen extends StatelessWidget {
  const InforamtionsBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookCubit = context.read<BookingCubit>();
    bookCubit.triggerPage();

    return BlocListener<BookingCubit, BookingState>(
      listener: (context, state) async {
        if (state is BookingPendingStatus) {
          context
              .read<BookingBollCubit>()
              .bookBollrequest(state.bookId, state.amount);
          await Future.delayed(Duration(milliseconds: 200));
          print('Navigating to HomeScreen');
          context.goNamed( MyStrings.homeScreen);
        } else if (state is BookingFauiler) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red.shade400,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              BookingAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        BookingForm(),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
