// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:workspace/constants/my_colors.dart';
// import 'package:workspace/presention_layer/widgets/new_book_widgets/date_time_picker/date_time_trigger.dart';

// class DateTimePickerTest extends StatefulWidget {
//   const DateTimePickerTest({super.key});

//   @override
//   State<DateTimePickerTest> createState() => _DateTimePickerTestState();
// }

// class _DateTimePickerTestState extends State<DateTimePickerTest> {
//   DateTime widgetPicked = DateTime.now();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       helpText: 'اختر اليوم الذي تريده للحجز',
//       cancelText: 'الغاء',
//       confirmText: 'اختر',
//       selectableDayPredicate: (DateTime date) {
//         // Disable weekends
//         return date.weekday != DateTime.saturday &&
//             date.weekday != DateTime.sunday;
//       },
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             // Customize the primary color
//             primaryColor: MyColors.bottomColor,
//             // Customize the color scheme
//             colorScheme: ColorScheme.light(
//               primary: MyColors.bottomColor, // Header background color
//               onPrimary: Colors.white, // Header text color
//               surface: MyColors.backgroundColor, // Calendar background color
//               onSurface: MyColors.bottomColor, // Calendar text color
//             ),
//             // Customize the text button theme
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: MyColors.bottomColor, // Button text color
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (picked != null) {
//       setState(() {
//         widgetPicked = picked;
//       });

//       print('Selected date: ${picked}');
//       print('Selected date: $widgetPicked');
//     } else {
//       print('No date selected');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: MyColors.backgroundColor,
//         body: Column(
//           children: [
//             SizedBox(
//               height: 100.h,
//             ),
//             Center(
//               child: DateTimeTrigger(
//                   text:
//                       "${widgetPicked.day}/${widgetPicked.month}/${widgetPicked.year}"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
