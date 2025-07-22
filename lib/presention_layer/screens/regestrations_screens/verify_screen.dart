// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pinput/pinput.dart';
// import 'package:workspace/constants/my_colors.dart';
// import 'package:workspace/generated/l10n.dart';
// import 'package:workspace/presention_layer/widgets/regestration_widgets/regestration_icons/arrow_back_icon.dart';
// import 'package:workspace/presention_layer/widgets/regestration_widgets/veify_widgets/my_timer.dart';
// import 'package:workspace/presention_layer/widgets/regestration_widgets/welcome_widgets/leadinr_text_in_regestration.dart';

// class VerifyScreen extends StatefulWidget {
//   const VerifyScreen({super.key});

//   @override
//   State<VerifyScreen> createState() => _VerifyScreenState();
// }

// class _VerifyScreenState extends State<VerifyScreen> {
  

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: MyColors.backgroundColor,
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               ArrowBackIcon(height: height),
//               SizedBox(
//                 height: height / 15,
//               ),
//               verifyText(context),
//               SizedBox(
//                 height: height / 30,
//               ),
//               Align(
//                 alignment: Alignment.topRight,
//                 child: RPadding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.r),
//                   child: Text(
//                     "ادخل الكود",
//                     style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                         color: MyColors.textHintsColor),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: height / 40,
//               ),
//               Center(child: buildPin(pinController, validator)),
//               RPadding(
//                 padding: EdgeInsets.only(top: 16.0.r),
//                 child: Center(
//                   child: Text(
//                     _errorMessage,
//                     style: const TextStyle(color: Colors.red, fontSize: 14),
//                   ),
//                 ),
//               ),
//               MyTimer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget verifyText(BuildContext context) {
//   return Align(
//     alignment: Alignment.topRight,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         LeadingTextInRegestration(
//           text: S.of(context).verifyYourAccount,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               S.of(context).textUnderVerifyAccount,
//               style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w400,
//                   color: MyColors.verifyTextColor),
//             ),
//             Text(
//               "ahmedazy.uxui@gmail.com",
//               style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w400,
//                   color: MyColors.verifyTextColor),
//             ),
//           ],
//         ),
//         Text(
//           S.of(context).enterCodeToVerify,
//           style: TextStyle(
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w400,
//             color: MyColors.verifyTextColor,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget buildPin(TextEditingController pinController, validator) {
//   return Directionality(
//     textDirection: TextDirection.ltr,
//     child: Pinput(
//       length: 6,
//       controller: pinController,
//       defaultPinTheme: PinTheme(
//           height: 70.h,
//           width: 60.w,
//           decoration: BoxDecoration(
//               border: Border.all(color: MyColors.verifyBorderColor),
//               borderRadius: BorderRadius.circular(8))),
//       onCompleted: (validator){
//         if(pinController.text.isNotEmpty){
//         }
//       },
//     ),
//   );
// }
