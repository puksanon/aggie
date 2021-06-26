import 'package:aggie/theme/design_token.dart';
import 'package:aggie/utils/material_color_generator.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  final lightTheme = ThemeData(
    primarySwatch: generateMaterialColor(primary),
    brightness: Brightness.light,
    scaffoldBackgroundColor: white,
    primaryColor: white,
    accentColor: gray5,
    buttonTheme: ButtonThemeData(
        buttonColor: primary, textTheme: ButtonTextTheme.primary),
    textTheme: TextTheme(
        headline3: TextStyle(color: gray9, fontWeight: FontWeight.w700),
        headline5: TextStyle(color: gray9, fontWeight: FontWeight.w700),
        subtitle1: TextStyle(color: gray5, fontWeight: FontWeight.w700),
        subtitle2: TextStyle(color: gray9, fontWeight: FontWeight.w700),
        bodyText2: TextStyle(color: gray9),
        caption: TextStyle(color: gray5)),
  );

  ThemeManager() {
    _themeData = lightTheme;
  }
}
