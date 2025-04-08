import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/models/character_result.dart';
import 'package:rick_and_morty/services/database/database_handler.dart';

part 'favourite_character_event.dart';
part 'favourite_character_state.dart';

class FavouriteCharacterBloc
    extends Bloc<FavouriteCharacterEvent, FavouriteCharacterState> {
  final DatabaseHandler _databaseHandler = DatabaseHandler();

  FavouriteCharacterBloc() : super(FavouriteCharacterInitial()) {
    on<FavouriteCharacterLoading>((event, emit) async {
      emit(FavouriteLoading());
      List<CharacterResult> characterList =
          await _databaseHandler.loadCharacterFromFavourite();
      characterList.sort((a, b) => a.name.compareTo(b.name));
      log("Список избранного получен успешно");
      emit(FavouriteLoaded(characterResult: characterList));
    });
  }
}
