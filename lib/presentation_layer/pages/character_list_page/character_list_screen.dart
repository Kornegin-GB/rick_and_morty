import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/domain_layer/entities/character_entity.dart';
import 'package:rick_and_morty/presentation_layer/blocs/character_list_bloc/character_list_bloc.dart';
import 'package:rick_and_morty/presentation_layer/pages/character_list_page/character_item.dart';
import 'package:rick_and_morty/presentation_layer/widgets/wrap_pages_widget.dart';

@RoutePage()
class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  List<CharacterEntity> characterList = [];
  final ScrollController _controller = ScrollController();
  int fullPage = 0;
  int countPage = 0;

  @override
  void initState() {
    context.read<CharacterListBloc>().add(QueryLoadedListCharacter());
    _controller.addListener(scroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CharacterListBloc, CharacterListState>(
      listener: (context, state) {
        if (state is CharacterListLoaded) {
          characterList = state.characterList;
          fullPage = state.pages;
          countPage = 1;
        }
        if (state is ScrollCharacterListLoaded) {
          log("Скрол загружен");
          setState(() {
            characterList.addAll(state.characterList);
          });
        }
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(title: Text("Список персонажей"), centerTitle: true),
          body: BlocBuilder<CharacterListBloc, CharacterListState>(
            buildWhen: (previous, current) => current is CharacterListLoaded,
            builder: (context, state) {
              if (state is CharacterListLoaded) {
                return WrapPagesWidget(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: characterList.length,
                    itemBuilder: (context, index) =>
                        CharacterItem(characterEntity: characterList[index]),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  void scroll() {
    if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
        if (countPage <= fullPage) {
          countPage++;
          log("$countPage");
          context.read<CharacterListBloc>().add(
            ScrollPageListCharacter(page: countPage),
          );
        }
      }
    }
  }
}
