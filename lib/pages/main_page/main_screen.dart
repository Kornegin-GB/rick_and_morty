import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/view_error_cubit/view_error_cubit.dart';
import 'package:rick_and_morty/router/router.gr.dart';
import 'package:rick_and_morty/services/answer_error.dart';
import 'package:rick_and_morty/themes/color_app.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<String> _message = ValueNotifier("");
  final ValueNotifier<bool> _isShowMessage = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<ViewErrorCubit, ViewErrorState>(
      listener: (context, state) {
        if (state is ViewErrorMessage) {
          _message.value = errorText[state.errorMessage]!;
          _isShowMessage.value = true;
          log(errorText[state.errorMessage]!);
        }
      },
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Scaffold(
            body: Stack(
              children: [
                AutoTabsScaffold(
                  routes: [CharacterListRoute(), FavouriteCharacterRoute()],
                  bottomNavigationBuilder:
                      (context, tabsRouter) => BottomNavigationBar(
                        selectedItemColor: ColorApp.colorItemMenu,
                        currentIndex: tabsRouter.activeIndex,
                        onTap: (index) {
                          tabsRouter.setActiveIndex(index);
                        },
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.list),
                            label: "Список",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.star),
                            label: "Избранное",
                          ),
                        ],
                      ),
                ),
                Visibility(
                  visible: _isShowMessage.value,
                  child: Positioned(
                    top: 48,
                    right: 0,
                    left: 0,
                    height: 50,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          _message.value,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
