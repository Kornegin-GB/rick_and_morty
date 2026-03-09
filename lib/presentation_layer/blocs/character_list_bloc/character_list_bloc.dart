import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/domain_layer/entities/character_entity.dart';
import 'package:rick_and_morty/domain_layer/entities/character_page_entity.dart';
import 'package:rick_and_morty/domain_layer/repositories/server_repository.dart';
import 'package:rick_and_morty/main.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CharacterListBloc() : super(CharacterListInitial()) {
    on<QueryLoadedListCharacter>((event, emit) async {
      final CharacterPageEntity characterPageEntity =
          await getIt<ServerRepository>().getListCharacter(page: 1);
      log("CharacterListBloc ${characterPageEntity.pages}");
      emit(
        CharacterListLoaded(
          characterList: characterPageEntity.results,
          pages: characterPageEntity.pages,
        ),
      );
    });

    on<ScrollPageListCharacter>((event, emit) async {
      final CharacterPageEntity characterPageEntity =
          await getIt<ServerRepository>().getListCharacter(page: event.page);
      log("ScrollPageListCharacter ${characterPageEntity.pages}");
      emit(
        ScrollCharacterListLoaded(characterList: characterPageEntity.results),
      );
    });
  }
}
