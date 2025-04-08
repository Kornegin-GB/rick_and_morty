import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/models/character_result.dart';

part 'checked_is_favourite_state.dart';

class CheckedIsFavouriteCubit extends Cubit<CheckedIsFavouriteState> {
  CheckedIsFavouriteCubit() : super(CheckedIsFavouriteInitial());

  Future<void> checkIsFavourite({required CharacterResult character}) async {
    if (character.isFavourite) {
      emit(AvailableFavourite());
    } else {
      emit(NotAvailableFavourite());
    }
  }
}
