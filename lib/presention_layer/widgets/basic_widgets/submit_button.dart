import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.press,
    required this.text, required this.height, required this.width,
  });
  final VoidCallback press;
  final String text;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height:height,
      child: RPadding(
        padding: EdgeInsets.symmetric(horizontal: 8.r),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.blue; // اللون عند الضغط
                } else if (states.contains(WidgetState.disabled)) {
                  return MyColors.bottomColor; // اللون إذا كان الزر معطلًا
                } else {
                  return MyColors.bottomColor;
                }
              },
            ),
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                color: MyColors.textInsideButtons, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
