part of 'character_list_bloc.dart';

sealed class CharacterListEvent extends Equatable {
  const CharacterListEvent();
}

final class QueryLoadedListCharacter extends CharacterListEvent {
  @override
  List<Object?> get props => [];
}

final class ScrollPageListCharacter extends CharacterListEvent {
  final int page;

  const ScrollPageListCharacter({required this.page});

  @override
  List<Object?> get props => [page];
}
