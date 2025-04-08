import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/models/character_result.dart';
import 'package:rick_and_morty/services/answer_error.dart';
import 'package:rick_and_morty/services/database/database_handler.dart';
import 'package:rick_and_morty/services/server_api.dart';

part 'load_characters_event.dart';
part 'load_characters_state.dart';

class LoadCharactersBloc
    extends Bloc<LoadCharactersEvent, LoadCharactersState> {
  final ServerApi _serverApi = ServerApi();
  final DatabaseHandler _databaseHandler = DatabaseHandler();
  List<CharacterResult> list = [];
  List<CharacterResult> listFavourite = [];

  LoadCharactersBloc() : super(LoadCharactersInitial()) {
    on<LoadCharactersList>((event, emit) async {
      emit(CharactersLoading());
      try {
        CharacterModel characterModel = await _serverApi.loadCharactersList();
        list = characterModel.characterResults;
        listFavourite = await _databaseHandler.loadCharacterFromFavourite();
        updateCharactersList();
        emit(
          CharactersLoaded(
            characters: characterModel.characterResults,
            nextUrl: characterModel.characterInfo.next,
          ),
        );
      } on DioException catch (e) {
        log("[--- $e ---]");
        emit(
          CharactersLoadException(
            messageError: AnswerError.noConnectionToServer,
          ),
        );
      }
    });

    on<ScrollLoadCharactersList>((event, emit) async {
      emit(CharactersLoadingPage());
      if (event.nextPage.isNotEmpty) {
        try {
          CharacterModel characterModel = await _serverApi
              .scrollLoadCharactersList(nextPage: event.nextPage);
          list.addAll(characterModel.characterResults);
          updateCharactersList();
          emit(
            CharactersLoadedPage(
              characters: characterModel.characterResults,
              nextUrl: characterModel.characterInfo.next,
            ),
          );
        } on DioException catch (e) {
          log("[--- $e ---]");
          emit(
            CharactersLoadException(
              messageError: AnswerError.noConnectionToServer,
            ),
          );
        }
      }
    });
  }

  Future<void> updateCharactersList() async {
    if (listFavourite.isNotEmpty) {
      for (var favouriteCharacter in listFavourite) {
        if (list.contains(favouriteCharacter)) {
          list
              .firstWhere((character) => favouriteCharacter.id == character.id)
              .isFavourite = true;
        }
      }
    }
  }
}
