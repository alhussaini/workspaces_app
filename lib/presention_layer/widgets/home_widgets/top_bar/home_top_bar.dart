// Updated home_top_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/theme_cubit/theme_cubit.dart';
import 'package:workspace/busniess_logic_layer/user_profile/user_profile_cubit.dart';
import 'package:workspace/constants/my_colors.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        final isDarkMode = themeState is ThemeDark;
       
        return Row(
          children: [
            // Name section - takes up remaining space
            Expanded(
              child: BlocBuilder<UserProfileCubit, UserProfileState>(
                builder: (context, state) {
                  if (state is UserProfileInitial) {
                    context.read<UserProfileCubit>().getUserProfileData();
                    return HelloName(
                      text: "هلا اخي",
                      isDarkMode: isDarkMode,
                    );
                  } else if (state is UserProfileLoading) {
                    return CircularProgressIndicator(
                      color: isDarkMode ? Colors.white : MyColors.bottomColor,
                    );
                  } else if (state is UserProfileLoaded) {
                    return HelloName(
                      text: "هلا ${state.userProfileModel.user.fullName}",
                      isDarkMode: isDarkMode,
                    );
                  } else if (state is UserProfileFailure) {
                    return HelloName(
                      text: state.error,
                      isDarkMode: isDarkMode,
                    );
                  }
                  return HelloName(
                    text: "يوجد خطأ في تحميل الاسم نعتذر",
                    isDarkMode: isDarkMode,
                  );
                },
              ),
            ),
            // Icons section - fixed width
            Icon(
              Icons.notifications,
              size: 28.sp,
              color: isDarkMode ? Colors.white70 : MyColors.bottomColor,
            ),
            const SizedBox(width: 10),
                 IconButton(icon: Icon(Icons.menu_rounded,
                  size: 28.sp,
                  color: isDarkMode ? Colors.white70 : MyColors.bottomColor,),
                  onPressed: (){
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
          ],
        );
      },
    );
  }
}

class HelloName extends StatelessWidget {
  const HelloName({
    super.key,
    required this.text,
    required this.isDarkMode,
  });
 
  final String text;
  final bool isDarkMode;
 
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: isDarkMode ? Colors.white70 : Colors.grey,
      ),
      textAlign: TextAlign.right,
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:workspace/busniess_logic_layer/user_profile/user_profile_cubit.dart';
// import 'package:workspace/constants/my_colors.dart';

// class HomeTopBar extends StatelessWidget {
//   const HomeTopBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Row(
//           children: [
//             Icon(
//               Icons.notifications,
//               size: 28,
//               color: MyColors.bottomColor,
//             ),
//             const SizedBox(width: 10),

//             Builder(
//               builder: (context) => GestureDetector(
//                 onTap: () => Scaffold.of(context).openDrawer(),
//                 child: Icon(
//                   Icons.menu_rounded,
//                   size: 28,
//                   color: MyColors.bottomColor,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: BlocBuilder<UserProfileCubit, UserProfileState>(
//                 builder: (context, state) {
//                   if (state is UserProfileInitial) {
//                     context.read<UserProfileCubit>().getUserProfileData();
//                     return HelloName(
//                       text: "هلا اخي",
//                     );
//                   } else if (state is UserProfileLoading) {
//                     return CircularProgressIndicator();
//                   } else if (state is UserProfileLoaded) {
//                     return HelloName(
//                       text: "هلا ${state.userProfileModel.user.fullName}",
//                     );
//                   } else if (state is UserProfileFailure) {
//                     return HelloName(text: state.error,);
//                   }
//                   return HelloName(text: "يوجد خطأ في تحميل الاسم نعتذر",);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class HelloName extends StatelessWidget {
//   const HelloName({
//     super.key,
//     required this.text,
//   });
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 14, color: Colors.grey),
//       textAlign: TextAlign.right,
//     );
//   }
// }
