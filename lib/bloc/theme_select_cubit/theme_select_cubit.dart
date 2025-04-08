import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_select_state.dart';

class ThemeSelectCubit extends Cubit<ThemeSelectState> {
  ThemeSelectCubit() : super(ThemeSelectInitial());

  void initTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLightTheme = pref.getBool("lightTheme");
    if (isLightTheme != null) {
      emit(SelectTheme(isLightTheme: isLightTheme));
    } else {
      emit(SelectTheme(isLightTheme: true));
    }
  }

  void selectTheme(ThemeApp themeApp) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    emit(ThemeSelectInitial());
    if (themeApp == ThemeApp.light) {
      await pref.setBool("lightTheme", true);
      emit(SelectTheme(isLightTheme: true));
    }
    if (themeApp == ThemeApp.dark) {
      await pref.setBool("lightTheme", false);
      emit(SelectTheme(isLightTheme: false));
    }
  }
}

enum ThemeApp { light, dark }
