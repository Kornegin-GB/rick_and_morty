import 'package:flutter/material.dart';
import 'package:rick_and_morty/themes/color_app.dart';

final themeLight = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorApp.colorMainLight,
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(backgroundColor: ColorApp.colorMainLight),
  scaffoldBackgroundColor: ColorApp.colorMainLight,
  useMaterial3: true,
  cardTheme: CardTheme(color: ColorApp.colorCardLight),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorApp.colorMainLight,
  ),
);
