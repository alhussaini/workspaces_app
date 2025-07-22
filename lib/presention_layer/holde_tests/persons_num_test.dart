import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';

class PersonsNumTest extends StatefulWidget {
  const PersonsNumTest({super.key});

  @override
  State<PersonsNumTest> createState() => _PersonsNumTestState();
}

class _PersonsNumTestState extends State<PersonsNumTest> {
  int num = 1;
  incrrment() {
    setState(() {
      num++;
    });
  }

  decrrment() {
    setState(() {
      num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: MyColors.bottomColor, width: 1.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "عدد الاشخاص",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    AddOrMinusIcon(
                        icon: Icon(
                          Icons.add,
                          color: MyColors.bottomColor,
                        ),
                        onTap: incrrment),
                    Text(
                      num.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: MyColors.bottomColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AddOrMinusIcon(
                        icon: Icon(
                          Icons.remove,
                          color: MyColors.bottomColor,
                        ),
                        onTap: decrrment),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddOrMinusIcon extends StatelessWidget {
  const AddOrMinusIcon({super.key, required this.icon, required this.onTap});
  final Icon icon;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 50.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
