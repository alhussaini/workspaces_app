import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/regester_by_other_methods_widgets/buttons_of_vendors.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/regester_by_other_methods_widgets/text_divider.dart';

class ButtonsAndTextDivider extends StatelessWidget {
  const ButtonsAndTextDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RPadding(
        padding: EdgeInsets.symmetric(vertical: 16.r),
        child: Column(
          children: [TextDivider(), ButtonsOfVendors()],
        ),
      ),
    );
  }
}
