import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/themes/dark_theme.dart';
import 'package:rick_and_morty/core/themes/light_theme.dart';
import 'package:rick_and_morty/internal_layer/initialization_bloc.dart';
import 'package:rick_and_morty/routers/router.dart';

class RickAndMortyApp extends StatefulWidget {
  const RickAndMortyApp({super.key});

  @override
  State<RickAndMortyApp> createState() => _RickAndMortyAppState();
}

final _appRouter = AppRouter();

class _RickAndMortyAppState extends State<RickAndMortyApp> {
  @override
  Widget build(BuildContext context) {
    return InitializationBloc(
      child: MaterialApp.router(
        title: "Rick and Morty",
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
