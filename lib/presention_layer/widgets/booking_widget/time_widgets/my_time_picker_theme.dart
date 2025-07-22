import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';

class MyTimePickerTheme extends StatelessWidget {
  final Widget child;

  const MyTimePickerTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(
          primary: MyColors.bottomColor,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: MyColors.bottomColor,
        ),
        textTheme: TextTheme(
          displayMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: MyColors.bottomColor,
          ),
        ),
      ),
      child: child,
    );
  }
} 