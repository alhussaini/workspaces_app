import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight());
  bool get isDarkMode => state is ThemeDark;

  void toggleTheme() {
    if (state is ThemeDark) {
      emit(ThemeLight());
    } else {
      emit(ThemeDark());
    }
  }

  void setDarkMode() {
    emit(ThemeDark());
  }

  void setLightMode() {
    emit(ThemeLight());
  }
ThemeData getThemeData() {
    if (state is ThemeDark) {
      return ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'IBM Plex Sans Arabic',
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        primaryColor: const Color(0xFF2D2D2D),
        cardColor: const Color(0xFF2D2D2D),
        dividerColor: const Color(0xFF404040),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white70),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white70,
        ),
      );
    } else {
      return ThemeData(
        brightness: Brightness.light,
        fontFamily: 'IBM Plex Sans Arabic',
         scaffoldBackgroundColor: MyColors.backgroundColor,
      );
    }
  }
}
