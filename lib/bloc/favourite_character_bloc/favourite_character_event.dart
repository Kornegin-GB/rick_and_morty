part of 'favourite_character_bloc.dart';

sealed class FavouriteCharacterEvent extends Equatable {
  const FavouriteCharacterEvent();
}

final class FavouriteCharacterLoading extends FavouriteCharacterEvent {
  @override
  List<Object?> get props => [];
}
