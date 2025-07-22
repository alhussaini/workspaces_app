import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpiningImage extends StatelessWidget {
  const OpiningImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 232, 221, 221),
              spreadRadius: 1,
              blurRadius: 50,
              offset: Offset(0, 1),
            )
          ]),
      child: RPadding(
        padding: EdgeInsets.only(bottom: 10.r),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)), // ضمان عدم تجاوز الحدود
          child: Image.asset(
            image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
