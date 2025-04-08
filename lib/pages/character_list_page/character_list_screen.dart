import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/load_characters_bloc/load_characters_bloc.dart';
import 'package:rick_and_morty/bloc/view_error_cubit/view_error_cubit.dart';
import 'package:rick_and_morty/models/character_result.dart';
import 'package:rick_and_morty/widgets/appbar_widget.dart';
import 'package:rick_and_morty/widgets/card_characters.dart';

@RoutePage()
class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  final ScrollController _scrollController = ScrollController();
  String nextPage = "";
  final List<CharacterResult> characterList = [];
  ValueNotifier<bool> showProgressNotify = ValueNotifier(false);
  bool loadingList = false;
  bool allLoading = false;

  @override
  void initState() {
    context.read<LoadCharactersBloc>().add(LoadCharactersList());
    _scrollController.addListener(_listController);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppbarWidget(title: "Список персонажей"),
        body: BlocConsumer<LoadCharactersBloc, LoadCharactersState>(
          listener: (context, state) {
            if (state is CharactersLoadException) {
              context.read<ViewErrorCubit>().showErrorMessage(
                message: state.messageError,
              );
            }
            if (state is CharactersLoadingPage) {
              setState(() {
                loadingList = true;
              });
            }
            if (state is CharactersLoaded) {
              log("CharactersLoaded");
              if (characterList.isNotEmpty) {
                characterList.clear();
              }
              characterList.addAll(state.characters);
              getNextUrl(state.nextUrl);
            }
            if (state is CharactersLoadedPage) {
              log("CharactersLoadedPage");
              characterList.addAll(state.characters);
              getNextUrl(state.nextUrl);
              setState(() {
                loadingList = false;
              });
            }
          },
          buildWhen: (previous, current) => current is CharactersLoaded,
          builder: (context, state) {
            if (state is CharactersLoaded) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    ListView.separated(
                      controller: _scrollController,
                      separatorBuilder:
                          (context, index) => SizedBox(height: 5.0),
                      itemCount: characterList.length,
                      itemBuilder: (context, index) {
                        return CardCharacters(
                          characterResult: characterList[index],
                          isFavouriteScreen: false,
                        );
                      },
                    ),
                    // if (allLoading)
                    if (loadingList)
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 5,
                        height: 30,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  ],
                ),
              );
            }
            if (state is CharactersLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(child: Text("Список пуст"));
          },
        ),
      ),
    );
  }

  void getNextUrl(String? url) {
    if (url != null) {
      nextPage = url;
    } else {
      nextPage = "";
      allLoading = true;
    }
  }

  void _listController() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loadingList) {
        if (nextPage.isNotEmpty) {
          log(nextPage);
          log("The End");
          context.read<LoadCharactersBloc>().add(
            ScrollLoadCharactersList(nextPage: nextPage),
          );
        }
      }
    }
  }
}
