import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/generated/l10n.dart';

class VariatyBookText extends StatelessWidget {
  const VariatyBookText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: '${S.of(context).waitingBook}\n',
              style: TextStyle(
                  fontFamily: MyStrings.cairoFont,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: MyColors.myBlack),
              children: [
                TextSpan(
                    text: S.of(context).lettleWait,
                    style: TextStyle(
                      fontFamily: MyStrings.cairoFont,
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: MyColors.darkgrey2,
                    ))
              ])),
    );
  }
}
