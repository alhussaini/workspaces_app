import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/presention_layer/widgets/booking_widget/common_widgets/section_card_header.dart';

class SectionCardWrapper extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const SectionCardWrapper({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 10,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionCardHeader(title: title, icon: icon),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.w),
            child: child,
          ),
        ],
      ),
    );
  }
} 