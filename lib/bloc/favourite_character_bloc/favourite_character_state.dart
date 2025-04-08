part of 'favourite_character_bloc.dart';

sealed class FavouriteCharacterState extends Equatable {
  const FavouriteCharacterState();
}

final class FavouriteCharacterInitial extends FavouriteCharacterState {
  @override
  List<Object> get props => [];
}

final class FavouriteLoaded extends FavouriteCharacterState {
  final List<CharacterResult> characterResult;

  const FavouriteLoaded({required this.characterResult});

  @override
  List<Object?> get props => [characterResult];
}

final class FavouriteLoading extends FavouriteCharacterState {
  @override
  List<Object?> get props => [];
}
