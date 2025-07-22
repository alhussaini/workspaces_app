import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';

class StarbustText extends StatelessWidget {
  const StarbustText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 4, horizontal: 16),
      child: SizedBox(
        child: Text(
          'Starbust',
          style: TextStyle(
              fontFamily: 'IBM Plex Sans',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: MyColors.myRed),
        ),
      ),
    );
  }
}
