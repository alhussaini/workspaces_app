import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/convert_widgets/convert_button.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/convert_widgets/convert_label.dart';

class ConvertWidget extends StatelessWidget {
  const ConvertWidget(
      {super.key, required this.labelText, required this.buttonText, required this.onPressed});
  final String labelText;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConvertLabel(text: labelText),
          ConvertButton(buttonText: buttonText,onPressed: onPressed,)
        ],
      ),
    );
  }
}
