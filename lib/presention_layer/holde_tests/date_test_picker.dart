// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
// import 'package:workspace/constants/my_colors.dart';
// import 'package:workspace/presention_layer/widgets/new_book_widgets/date_time_picker/date_time_trigger.dart';

// class DateTestPicker extends StatelessWidget {
//   const DateTestPicker({super.key});

//   void pickDateRange(
//       BuildContext context, DateTime firstDate, DateTime lastDate) async {
//     final bookingCubit = context.read<BookingCubit>();
//     final pickedRange = await showDateRangePicker(
//         context: context,
//         firstDate: firstDate,
//         lastDate: lastDate,
//         locale: Locale('ar'));
//     if (pickedRange != null) {
//       bookingCubit.updateDates(
//           pickerStartdate: pickedRange.start, pickerEnddate: pickedRange.end);
//       bookingCubit.calculateTotalPrice();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bookingCubit = context.read<BookingCubit>();
//     return RPadding(
//       padding: EdgeInsets.symmetric(horizontal: 8.r),
//       child: Builder(
//         builder: (BuildContext context) {
//           return GestureDetector(
//             onTap: () {
//               pickDateRange(
//                   context, bookingCubit.firstDate, bookingCubit.lastDate);
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 8.r),
//               margin: EdgeInsets.symmetric(horizontal: 8.r),
//               decoration: BoxDecoration(
//                 color: MyColors.backgroundColor,
//                 borderRadius: BorderRadius.circular(12.r),
//                 border: Border.all(color: MyColors.bottomColor, width: 1.5),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Column(
//                     children: [
//                       Text('من يوم'),
//                       BlocBuilder<BookingCubit, BookingState>(
//                         buildWhen: (previous, current) {
//                           bool doBuild = (current is BookingStartDateUpdate ||
//                               current is BookingWithCalender ||
//                               current is BookingUpdateBothDates);
//                           return doBuild;
//                         },
//                         builder: (context, state) {
//                           return DateTimeTrigger(
//                               text:
//                                   '${bookingCubit.startDate.day}/${bookingCubit.startDate.month}/${bookingCubit.startDate.year}');
//                         },
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: 20.w,
//                   ),
//                   Column(
//                     children: [
//                       Text('الي يوم'),
//                       BlocBuilder<BookingCubit, BookingState>(
//                         buildWhen: (previous, current) {
//                           bool doBuild = (current is BookingEndDateUbdate ||
//                               current is BookingWithCalender ||
//                               current is BookingUpdateBothDates);
//                           return doBuild;
//                         },
//                         builder: (context, state) {
//                           return DateTimeTrigger(
//                               text:
//                                   '${bookingCubit.endDate.day}/${bookingCubit.endDate.month}/${bookingCubit.endDate.year}');
//                         },
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
