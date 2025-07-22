import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class MyTimer extends StatefulWidget {
  const MyTimer({super.key});

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  int countdown = 60;
  Timer? timer;
  bool isButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      countdown = 60;
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "لم تستلم الرمز؟ ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            GestureDetector(
              onTap: countdown == 0 ? (){resetTimer();
              } : null,
              child: Text(
                countdown > 0
                    ? 'انتظر قليلا' // Show countdown
                    : 'أعد ارسال الرمز', // Show resend option
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: countdown > 0
                        ? MyColors.textHintsColor
                        : MyColors.bottomColor,
                    decoration: TextDecoration.underline,
                    decorationColor: countdown > 0
                        ? MyColors.textHintsColor
                        : MyColors.bottomColor),
              ),
            ),
          ],
        ),
        Text(
          "أعد ارسال الرمز بعد${formatDuration(countdown)}",
          style: TextStyle(
            fontSize: 14.sp,
            color: MyColors.verifyTextColor,
          ),
        )
      ],
    );
  }
}

String formatDuration(int seconds) {
  final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
  final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
  return '$minutes:$remainingSeconds';
}
