part of 'theme_select_cubit.dart';

sealed class ThemeSelectState {}

final class ThemeSelectInitial extends ThemeSelectState {}

final class SelectTheme extends ThemeSelectState {
  final bool isLightTheme;

  SelectTheme({required this.isLightTheme});
}
