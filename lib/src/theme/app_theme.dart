import 'package:cameroon_hymn/src/utils/app_color_extention.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //
  // Light theme
  //

  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
    ],
  );

  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xffFFFFFF),
    onPrimary: Colors.black,
    secondary: const Color(0xffD6D3E6),
    onSecondary: Colors.black,
    error: const Color(0xffb00020),
    onError: Colors.white,
    background: const Color(0xff32303C),
    onBackground: const Color.fromARGB(170, 233, 234, 238),
    surface: const Color.fromARGB(117, 172, 166, 204),
    onSurface: const Color(0xffE9EAEE),
    accent: const Color(0xff473B8B),
    onAccent: Colors.white,
    onAccentSecondary: const Color(0xffA79BE9),
    accentSecondary: const Color(0xff473B8B),
  );

  //
  // Dark theme
  //

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
  );

  static final _darkAppColors = AppColorsExtension(
    primary: const Color.fromARGB(255, 3, 0, 7),
    onPrimary: Colors.white,
    secondary: const Color(0xff32303C),
    onSecondary: Colors.white,
    error: const Color(0xffcf6679),
    onError: Colors.black,
    background: const Color(0xffE9EAEE),
    onBackground: const Color.fromARGB(130, 50, 48, 60),
    surface: const Color.fromARGB(150, 94, 91, 113),
    onSurface: const Color(0xff32303C),
    accent: const Color(0xff473B8B),
    onAccent: Colors.white,
    onAccentSecondary: const Color(0xff473B8B),
    accentSecondary: const Color(0xffA79BE9),
  );
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}

class AppColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const red = Color(0xffcf6679);
}
