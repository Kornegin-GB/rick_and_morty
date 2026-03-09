part of 'character_list_bloc.dart';

sealed class CharacterListState extends Equatable {
  const CharacterListState();
}

final class CharacterListInitial extends CharacterListState {
  @override
  List<Object> get props => [];
}

final class CharacterListLoaded extends CharacterListState {
  final List<CharacterEntity> characterList;
  final int pages;

  const CharacterListLoaded({required this.characterList, required this.pages});

  @override
  List<Object?> get props => [characterList, pages];
}

final class ScrollCharacterListLoaded extends CharacterListState {
  final List<CharacterEntity> characterList;

  const ScrollCharacterListLoaded({required this.characterList});

  @override
  List<Object?> get props => [characterList];
}
