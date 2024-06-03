import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.background,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.accent,
    required this.onAccent,
    required this.onAccentSecondary,
    required this.accentSecondary,
  });

  final Color primary;
  final Color onPrimary;
  final Color background;
  final Color secondary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color accent;
  final Color onAccent;
  final Color onAccentSecondary;
  final Color accentSecondary;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? background,
    Color? secondary,
    Color? onSecondary,
    Color? error,
    Color? onError,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? accent,
    Color? onAccent,
    Color? onAccentSecondary,
    Color? accentSecondary,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      background: background ?? this.background,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      onAccentSecondary: onAccentSecondary ?? this.onAccentSecondary,
      accentSecondary: accentSecondary ?? this.accentSecondary,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      onAccentSecondary:
          Color.lerp(onAccentSecondary, other.onAccentSecondary, t)!,
      accentSecondary: Color.lerp(accentSecondary, other.accentSecondary, t)!,
    );
  }
}
