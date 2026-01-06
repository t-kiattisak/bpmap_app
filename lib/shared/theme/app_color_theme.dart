import 'package:flutter/material.dart';

class AppColorTheme extends ThemeExtension<AppColorTheme> {
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color iconPrimary;
  final Color border;
  final Color brandBlue;
  final Color brandLine;
  final Color error;
  final Color success;
  final Color warning;

  const AppColorTheme({
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.iconPrimary,
    required this.border,
    required this.brandBlue,
    required this.brandLine,
    required this.error,
    required this.success,
    required this.warning,
  });

  @override
  ThemeExtension<AppColorTheme> copyWith({
    Color? background,
    Color? surface,
    Color? textPrimary,
    Color? textSecondary,
    Color? iconPrimary,
    Color? border,
    Color? brandBlue,
    Color? brandLine,
    Color? error,
    Color? success,
    Color? warning,
  }) {
    return AppColorTheme(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      border: border ?? this.border,
      brandBlue: brandBlue ?? this.brandBlue,
      brandLine: brandLine ?? this.brandLine,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
    );
  }

  @override
  ThemeExtension<AppColorTheme> lerp(
    covariant ThemeExtension<AppColorTheme>? other,
    double t,
  ) {
    if (other is! AppColorTheme) {
      return this;
    }

    return AppColorTheme(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      border: Color.lerp(border, other.border, t)!,
      brandBlue: Color.lerp(brandBlue, other.brandBlue, t)!,
      brandLine: Color.lerp(brandLine, other.brandLine, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
    );
  }
}
