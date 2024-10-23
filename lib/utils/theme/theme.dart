import 'package:flutter/material.dart';
import 'package:flutter_framework_v1/utils/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme =
      ThemeData(textTheme: CustomTextTheme.lightTextTheme);
  static ThemeData darkTheme =
      ThemeData(textTheme: CustomTextTheme.darkTextTheme);
}
