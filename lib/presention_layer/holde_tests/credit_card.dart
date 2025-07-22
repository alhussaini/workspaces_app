// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:workspace/constants/my_colors.dart';
// import 'package:workspace/constants/my_strings.dart';
// import 'package:workspace/presention_layer/widgets/basic_widgets/submit_button.dart';

// class CreditCardScreen extends StatefulWidget {
//   @override
//   _CreditCardScreenState createState() => _CreditCardScreenState();
// }

// class _CreditCardScreenState extends State<CreditCardScreen> {
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;

//   void onCreditCardModelChange(CreditCardModel creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel.cardNumber;
//       expiryDate = creditCardModel.expiryDate;
//       cardHolderName = creditCardModel.cardHolderName;
//       cvvCode = creditCardModel.cvvCode;
//       isCvvFocused = creditCardModel.isCvvFocused;
//     });
//     print("Updated cardHolderName: $cardHolderName");
//   }

//   GlobalKey<FormState> mykey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Credit Card Example'),
//       ),
//       body: Column(
//         children: [
//           Directionality(
//             textDirection: TextDirection.ltr,
//             child: CreditCardWidget(
//               isHolderNameVisible: true,
//               enableFloatingCard: true,
//               cardNumber: cardNumber,
//               expiryDate: expiryDate,
//               cardHolderName: cardHolderName,
//               cvvCode: cvvCode,
//               showBackView: isCvvFocused,
//               obscureCardNumber: true,
//               glassmorphismConfig: Glassmorphism(
//                   blurX: 15.0,
//                   blurY: 15.0,
//                   gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Color(0xFF66A185).withOpacity(0.9),
//                         Color(0xFF66A185).withOpacity(0.3),
//                         // Colors.white.withOpacity(0.5),
//                       ])),
//               onCreditCardWidgetChange: (CreditCardBrand) {},
//             ),
//           ),
//           SingleChildScrollView(
//             child: Directionality(
//               textDirection: TextDirection.ltr,
//               child: CreditCardForm(
//                 onCreditCardModelChange: onCreditCardModelChange,
//                 cardNumber: cardNumber,
//                 expiryDate: expiryDate,
//                 cardHolderName: cardHolderName,
//                 cvvCode: cvvCode,
//                 formKey: mykey,
//                 inputConfiguration: InputConfiguration(
//                   cardNumberDecoration: InputDecoration(
//                       label: Align(
//                         alignment: Alignment.topRight,
//                         child: Text(
//                           "رقم البطاقة ",
//                           style: TextStyle(
//                             fontFamily: MyStrings.cairoFont,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       hintText: "xxxx xxxx xxxx xxxx",
//                       hintStyle: TextStyle(
//                         fontFamily: MyStrings.cairoFont,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: MyColors.secoundTextHeadersColor,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Color(0xff212121),
//                           ))),
//                   //////////////////////////////////////////////////////////////////////////////////////////////////////

//                   cardHolderDecoration: InputDecoration(
//                       label: Align(
//                         alignment: Alignment.topRight,
//                         child: Text(
//                           "اسم حامل البطاقة",
//                           style: TextStyle(
//                             fontFamily: MyStrings.cairoFont,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       hintText: "AHMED MOHAMED ",
//                       hintStyle: TextStyle(
//                         fontFamily: MyStrings.cairoFont,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: MyColors.secoundTextHeadersColor,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(
//                             color: Color(0xff212121),
//                           ))),

//                   expiryDateDecoration: InputDecoration(
//                       label: Align(
//                         alignment: Alignment.topRight,
//                         child: Text(
//                           "تاريخ انتهاء الصلاحية",
//                           style: TextStyle(
//                             fontFamily: MyStrings.cairoFont,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       hintText: "شهر/سنة",
//                       hintStyle: TextStyle(
//                         fontFamily: MyStrings.cairoFont,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: MyColors.secoundTextHeadersColor,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                         color: Color(0xff212121),
//                       ))),

//                   cvvCodeDecoration: InputDecoration(
//                       label: Align(
//                         alignment: Alignment.topRight,
//                         child: Text(
//                           "CVV",
//                           style: TextStyle(
//                               fontFamily: MyStrings.cairoFont,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w600,
//                               color: MyColors.myBlack),
//                         ),
//                       ),
//                       hintText: "xxx",
//                       hintStyle: TextStyle(
//                         fontFamily: MyStrings.cairoFont,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: MyColors.secoundTextHeadersColor,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                         color: Color(0xff212121),
//                       ))),
//                 ),
//               ),
//             ),
//           ),
//           SubmitButton(height: 52.h,
//           width: double.infinity,
//               press: () {
//                 if (mykey.currentState!.validate()) {
//                   print("object");
//                 }
//               },
//               text: "اتمام العملية"),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }
