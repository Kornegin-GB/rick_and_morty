import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/theme_select_cubit/theme_select_cubit.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key, required this.title});

  final String title;

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}

class _AppbarWidgetState extends State<AppbarWidget> {
  bool isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    final state = context.read<ThemeSelectCubit>().state;
    if (state is SelectTheme) {
      isLightTheme = state.isLightTheme;
    }
    ThemeData theme = Theme.of(context);
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      backgroundColor: theme.appBarTheme.backgroundColor,
      surfaceTintColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isLightTheme = !isLightTheme;
              if (isLightTheme) {
                context.read<ThemeSelectCubit>().selectTheme(ThemeApp.light);
              } else {
                context.read<ThemeSelectCubit>().selectTheme(ThemeApp.dark);
              }
            });
          },
          icon: Icon(isLightTheme ? Icons.sunny : Icons.nightlight),
        ),
      ],
    );
  }
}
