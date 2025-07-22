import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/submit_button.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/fields_widgets/field_with_label.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/fields_widgets/label.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/welcome_widgets/leadinr_text_in_regestration.dart';

class CompeleteInformationsScreen extends StatelessWidget {
  const CompeleteInformationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 16,
              ),
              LeadingTextInRegestration(
                  text: S.of(context).compeleteInfoHeader),
              LeadingTextInRegestration(text: S.of(context).account),
              TextUnderLeading(),
              Align(
                  alignment: Alignment.topRight,
                  child: RPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Label(text: "الحالة"),
                  )),
              UserState(),
              FieldWithLabel(
                isSecure: false,
                text: "رقم التليفون",
                controller: textEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height / 30,
              ),
              SubmitButton(press: () {}, text: "تفعيل الحساب",height: 52.h,width: double.infinity,)
            ],
          ),
        ),
      ),
    ));
  }
}

class UserState extends StatefulWidget {
  const UserState({super.key});

  @override
  State<UserState> createState() => _UserStateState();
}

class _UserStateState extends State<UserState> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: DropdownMenu(
          width: width * 0.95,
          trailingIcon: Icon(
            Icons.arrow_downward,
            size: 25,
            color: MyColors.bottomColor,
          ),
          hintText: "set state",
          helperText: "",
          menuStyle: MenuStyle(
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                  vertical: 12.r, horizontal: 8.r), // Add padding
            ),
            backgroundColor: WidgetStateProperty.all<Color>(
                MyColors.backgroundColor), // Background color
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: MyColors.bottomColor, width: 1.w)),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor:
                MyColors.backgroundColor, // Background color of the input field
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: MyColors.borderColor, width: 1.5.w),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: MyColors.bottomColor, width: 2.0.w),
            ),
          ),
          dropdownMenuEntries: <DropdownMenuEntry<String>>[
            DropdownMenuEntry(value: "student", label: "طالب"),
            DropdownMenuEntry(value: "freelancer", label: "عمل حر"),
            DropdownMenuEntry(value: "company", label: "شركة"),
          ]),
    );
  }
}

class TextUnderLeading extends StatelessWidget {
  const TextUnderLeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "قبل تفعيل حسابك، نحتاج لبعض المعلومات الإضافيه لتقديم أفضل تجربة ممكنة.",
            style: TextStyle(
              fontSize: 14.sp,
              color: MyColors.secoundTextHeadersColor,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
          ),
          Text(
            'يرجى تعبئة الحقول التالية ، الأمر لن يستغرق وقتًا طويلًا.',
            style: TextStyle(
              fontSize: 14.sp,
              color: MyColors.secoundTextHeadersColor,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
