import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51.h,
      width: 167.w,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateOutlinedBorder.resolveWith(
                (Set<WidgetState> states) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  side: BorderSide(color: MyColors.borderColor));
            }),
            backgroundColor: WidgetStateColor.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.blue; // اللون عند الضغط
                } else if (states.contains(WidgetState.disabled)) {
                  return Colors.transparent; // اللون إذا كان الزر معطلًا
                } else {
                  return MyColors.backgroundColor;
                }
              },
            ),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          )),
    );
  }
}
