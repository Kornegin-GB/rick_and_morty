part of 'select_favourite_cubit.dart';

sealed class SelectFavouriteState {}

final class SelectFavouriteInitial extends SelectFavouriteState {}

final class SelectFavouriteCompleted extends SelectFavouriteState {
  final CharacterResult character;

  SelectFavouriteCompleted({required this.character});
}
