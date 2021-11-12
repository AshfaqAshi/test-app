import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/constants.dart';

class AppTheme {
  static int _primaryValue = 0xff1762AB;

  static ThemeData get defaultTheme {
    return ThemeData(
      primaryColor: primarySwatch,
      pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()}),
      brightness: Brightness.light,
    );
  }

  static MaterialColor primarySwatch = MaterialColor(_primaryValue, {
    50: Color(0xff2694FE),
    100: Color(0xff2286E7),
    200: Color(0xff1D76CC),
    300: Color(0xff196BBB),
    400: Color(0xff1D6EBC),
    500: Color(_primaryValue),
    600: Color(0xff135696),
    700: Color(0xff0D4D8A),
    800: Color(0xff0B4780),
    900: Color(0xff083E71)
  });

  static CustomColors colors = CustomColors();
}

class CustomColors{
   Color loginButtonColor=Color(0xffEDEAEA);
}
