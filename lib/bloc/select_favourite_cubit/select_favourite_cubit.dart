import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/models/character_result.dart';
import 'package:rick_and_morty/services/database/database_handler.dart';

part 'select_favourite_state.dart';

class SelectFavouriteCubit extends Cubit<SelectFavouriteState> {
  SelectFavouriteCubit() : super(SelectFavouriteInitial());
  final DatabaseHandler _databaseHandler = DatabaseHandler();

  void saveCharacterToFavourite({required CharacterResult character}) async {
    await _databaseHandler.saveCharacterToFavourite(character: character);
    emit(SelectFavouriteCompleted(character: character));
  }

  void removeCharacterToFavourite({required CharacterResult character}) async {
    await _databaseHandler.removeCharacterFromFavourite(character: character);
    emit(SelectFavouriteCompleted(character: character));
  }
}
