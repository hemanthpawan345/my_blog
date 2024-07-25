import 'package:flutter/material.dart';
import 'package:my_blog/core/theme/app_pallete.dart';

class AppTheme {
  static _border({
    required double width,
    Color color = AppPallete.borderColor,
  }) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color,
          width: width,
        ),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: AppPallete.backgroundColor),
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(width: 3),
      focusedBorder: _border(width: 5, color: AppPallete.gradient2),
    ),
  );
}
