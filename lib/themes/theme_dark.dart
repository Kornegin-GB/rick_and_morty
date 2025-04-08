import 'package:flutter/material.dart';
import 'package:rick_and_morty/themes/color_app.dart';

final themeDark = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorApp.colorMainDark,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(backgroundColor: ColorApp.colorMainDark),
  scaffoldBackgroundColor: ColorApp.colorMainDark,
  applyElevationOverlayColor: true,
  useMaterial3: true,
  cardTheme: CardTheme(color: ColorApp.colorCardDark),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorApp.colorMainDark,
  ),
);
