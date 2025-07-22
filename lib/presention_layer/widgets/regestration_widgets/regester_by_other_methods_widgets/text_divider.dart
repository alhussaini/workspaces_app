import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/generated/l10n.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(child: Divider()),
      Text(
        S.of(context).textDividerInRegestration,
        style: TextStyle(
            color: MyColors.secoundTextHeadersColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400),
      ),
      Expanded(child: Divider()),
    ]);
  }
}
