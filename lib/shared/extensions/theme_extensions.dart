import 'package:flutter/material.dart';
import 'package:bpmap_app/shared/theme/app_color_theme.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  AppColorTheme get appColors => theme.extension<AppColorTheme>()!;
}
