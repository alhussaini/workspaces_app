import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/convert_widgets/convert_widget.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/fields_widgets/signin_form.dart';
import 'package:workspace/presention_layer/widgets/regestration_widgets/welcome_widgets/welcome_widget.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {// new (statfull)
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size.height;
    var notifySize = MediaQuery.of(context).padding.top;

    return GestureDetector(
       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),// new
    behavior: HitTestBehavior.opaque,//new
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: SafeArea(
            child: Align(
          alignment: Alignment.topRight,
          child: SingleChildScrollView(
            child: SizedBox(
              height: (pageSize - notifySize),
              child: RPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeWidget(
                      headText: '${S.of(context).welcomeStatementInLogin}\n',
                      secondText: '${S.of(context).theGuidingStatmentInLogin}\n',
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    SigninForm(),
                    SizedBox(
                      height: 12.h,
                    ),
                    ConvertWidget(
                      labelText: S.of(context).convertLabelInLogin,
                      buttonText: S.of(context).bouttonConvertInLogin,
                      onPressed: () {
                       context.pushReplacementNamed(MyStrings.registerScreen);
                      },
                    ),
                    Expanded(child: Container()),
                    // ButtonsAndTextDivider()
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
