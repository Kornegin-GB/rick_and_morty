import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/init_bloc.dart';
import 'package:rick_and_morty/bloc/theme_select_cubit/theme_select_cubit.dart';
import 'package:rick_and_morty/router/router.dart';
import 'package:rick_and_morty/themes/theme_dark.dart';
import 'package:rick_and_morty/themes/theme_light.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerList = RouterList().config();
    ThemeSelectCubit themeSelectCubit = ThemeSelectCubit();
    return MultiBlocProvider(
      providers: InitBloc().listBloc(context, themeSelectCubit),
      child: BlocBuilder<ThemeSelectCubit, ThemeSelectState>(
        bloc: themeSelectCubit..initTheme(),
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme:
                state is SelectTheme
                    ? state.isLightTheme
                        ? themeLight
                        : themeDark
                    : themeLight,
            routerConfig: routerList,
          );
        },
      ),
    );
  }
}
