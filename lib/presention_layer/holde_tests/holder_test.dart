// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:workspace/constants/my_colors.dart';
// import 'package:workspace/presention_layer/widgets/new_book_widgets/time_picker/my_time_duration.dart';
// import 'package:workspace/presention_layer/widgets/new_book_widgets/time_picker/time_picker_trigger_tile.dart';

// class HolderTest extends StatefulWidget {
//   const HolderTest({super.key});

//   @override
//   _HolderTestState createState() => _HolderTestState();
// }

// class _HolderTestState extends State<HolderTest> {
//   // Variables to store selected times
//   TimeOfDay? _startTime;
//   TimeOfDay? _endTime;

//   // Function to show time picker dialog

//   Future<void> _selectTime(bool isStartTime) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             colorScheme: ColorScheme.light(
//               primary: MyColors.bottomColor, // Change the primary color
//               onPrimary: Colors.white, // Change text color on the primary color
//               surface:
//                   MyColors.backgroundColor, // Background color of the dialog
//               onSurface: MyColors.bottomColor, // Text color on the surface
//             ),
//             textTheme: TextTheme(
//               displayMedium: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: MyColors.bottomColor),
//               // Customize time text
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (pickedTime != null) {
//       setState(() {
//         if (isStartTime) {
//           _startTime = pickedTime;
//         } else {
//           _endTime = pickedTime;
//         }
//       });
//     }
//   }

//   String _calculateBookingDuration() {
//     if (_startTime == null || _endTime == null) {
//       return 'من فضلك اختر توقيت بداية ونهاية الحجز';
//     }
//     int startMinutes = _startTime!.hour * 60 + _startTime!.minute;
//     int endMinutes = _endTime!.hour * 60 + _endTime!.minute;
//     int durationInMinutes;
//     if (endMinutes == startMinutes) {
//       return "24 س";
//     } else if (endMinutes > startMinutes) {
//       durationInMinutes = endMinutes - startMinutes;
//     } else {
//       durationInMinutes = (24 * 60 - startMinutes) + endMinutes;
//     }

//     int hours = durationInMinutes ~/ 60;
//     int minutes = durationInMinutes % 60;
//     return '$hours س و$minutes دقيقة';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RPadding(
//       padding: EdgeInsets.all(16.0.r),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TimePickerTriggerTile(
//               title: "من الساعة",
//               text: _startTime?.format(context) ?? " بداية الحجز",
//               onTap: () => _selectTime(true)),
//           MyTimeDuration(text: _calculateBookingDuration()),
//           TimePickerTriggerTile(
//               title: "الي الساعة",
//               text: _endTime?.format(context) ?? " نهاية الحجز",
//               onTap: () => _selectTime(false)),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
