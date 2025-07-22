import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/user_profile/user_profile_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.access_time,
            color: MyColors.bottomColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        // actions: [
        //   Directionality(
        //     textDirection: TextDirection.ltr,
        //     child: IconButton(
        //       icon: Icon(
        //         Icons.arrow_back,
        //         color: MyColors.bottomColor,
        //       ),
        //       onPressed: () {},
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: RPadding(
          padding: EdgeInsets.all(20.0.r),
          child: BlocBuilder<UserProfileCubit, UserProfileState>(
            builder: (context, state) {
              if (state is UserProfileLoaded) {
                return Column(
                  children: [
                    // Profile Image Section
                    ProfileImageWidget(),

                    SizedBox(height: 24.h),

                    // Name Section
                    ProfileNameWidget(
                      name: state.userProfileModel.user.fullName,
                    ),

                    SizedBox(height: 32),

                    // Stats Section
                    ProfileStatsWidget(),

                    SizedBox(height: 32),

                    // Edit Profile Button
                    EditProfileButton(),

                    SizedBox(height: 40),

                    // About Section
                    
                  ],
                );
              } else if (state is UserProfileInitial) {
                context.read<UserProfileCubit>().getUserProfileData();
                return Center(
                  child: Text("انتظر حتي تحميل الداتا"),
                );
              } else if (state is UserProfileLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserProfileFailure) {
                return Center(
                  child: Text("حدث خطا"),
                );
              } else {
                return Center(
                  child: Text(
                      " حدث خطا غير مدرج في قائمة الاخطاء يالك من غبي جدا "),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.cover,
          )),
    );
  }
}

class ProfileNameWidget extends StatelessWidget {
  const ProfileNameWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2E7D7B),
        letterSpacing: 0.5,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class ProfileStatsWidget extends StatelessWidget {
  const ProfileStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const StatItem(number: '350', label: 'الذين التابعوا'),
        Container(
          width: 1,
          height: 40,
          color: Colors.grey[300],
        ),
        const StatItem(number: '346', label: 'المتابعون'),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String number;
  final String label;

  const StatItem({
    super.key,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE91E63),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200.h,
        height: 95.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.bottomColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MyStrings.editScreen);
          },
          child: EditMyProfileTextAndIcon(),
        ));
  }
}

class EditMyProfileTextAndIcon extends StatelessWidget {
  const EditMyProfileTextAndIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تعديل حسابي',
          style: TextStyle(
            color: MyColors.bottomColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Icon(
          Icons.edit_outlined,
          color: MyColors.bottomColor,
          size: 20,
        ),
      ],
    );
  }
}

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'عني',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE91E63),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'لي آلل ايعلين الكالب الكودريس كل سئيكي كاليغ آن انتولرم\nمحيطة ليم آن عدد واجوين الكان الشقيص قبل ساعة اليتالي آي\nفمتحمل بالوايانت فعئو و سحوان و نسيير',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
              height: 1.6,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
