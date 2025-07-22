import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/regester_by_other_methods_widgets/vendor_button.dart';

class ButtonsOfVendors extends StatelessWidget {
  const ButtonsOfVendors({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: RPadding(
        padding: EdgeInsets.symmetric(vertical: 8.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VendorButton(image: 'assets/images/google.svg', text: 'Google'),
            VendorButton(image: 'assets/images/facebook.svg', text: 'Facebook'),
          ],
        ),
      ),
    );
  }
}
