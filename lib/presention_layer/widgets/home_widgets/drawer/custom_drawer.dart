// custom_drawer.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/theme_cubit/theme_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state is ThemeDark;
        
        return Drawer(
          backgroundColor: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          child: SafeArea(
            child: Column(
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'الاعدادات',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Menu Items
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildDrawerItem(
                        context,
                        icon: Icons.notifications_outlined,
                        title: 'إشعار',
                        hasSwitch: true,
                        isDarkMode: isDarkMode,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.dark_mode_outlined,
                        title: 'الوضع المظلم',
                        hasSwitch: true,
                        isDarkMode: isDarkMode,
                        isThemeToggle: true,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.star_outline,
                        title: 'معدل التطبيق',
                        isDarkMode: isDarkMode,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.share_outlined,
                        title: 'مشاركة التطبيق',
                        isDarkMode: isDarkMode,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.security_outlined,
                        title: 'سياسة الخصوصية',
                        isDarkMode: isDarkMode,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.description_outlined,
                        title: 'الشروط والأحكام',
                        isDarkMode: isDarkMode,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.info_outline,
                        title: 'سياسة ملفات تعريف الزيارات',
                        isDarkMode: isDarkMode,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.email_outlined,
                        title: 'اتصال',
                        isDarkMode: isDarkMode,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.comment_outlined,
                        title: 'تعليق',
                        isDarkMode: isDarkMode,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: Icons.logout_outlined,
                        title: 'تسجيل الخروج',
                        isDarkMode: isDarkMode,
                        isLogout: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required bool isDarkMode,
    bool hasSwitch = false,
    bool isThemeToggle = false,
    bool isLogout = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDarkMode ? Colors.white70 : Colors.black54,
          size: 24.sp,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        trailing: hasSwitch
            ? Switch(
                value: isThemeToggle ? isDarkMode : true,
                onChanged: (value) {
                  if (isThemeToggle) {
                    context.read<ThemeCubit>().toggleTheme();
                  }
                },
                activeColor: const Color(0xFF4CAF50),
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey.shade300,
              )
            : Icon(
                Icons.arrow_forward_ios,
                color: isDarkMode ? Colors.white70 : Colors.black54,
                size: 16.sp,
              ),
        onTap: () {
          if (isLogout) {
            _showLogoutDialog(context, isDarkMode);
          } else if (!hasSwitch) {
            // Handle other menu item taps
            Navigator.pop(context);
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        tileColor: isDarkMode ? Colors.transparent : Colors.transparent,
        hoverColor: isDarkMode ? Colors.white10 : Colors.grey.shade100,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, bool isDarkMode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: isDarkMode ? const Color(0xFF2D2D2D) : Colors.white,
          title: Text(
            'تسجيل الخروج',
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 18.sp,
            ),
          ),
          content: Text(
            'هل أنت متأكد من أنك تريد تسجيل الخروج؟',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.black87,
              fontSize: 14.sp,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'إلغاء',
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                // Add logout logic here
              },
              child: const Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}