part of 'load_characters_bloc.dart';

sealed class LoadCharactersEvent extends Equatable {
  const LoadCharactersEvent();
}

final class LoadCharactersList extends LoadCharactersEvent {
  @override
  List<Object?> get props => [];
}

final class ScrollLoadCharactersList extends LoadCharactersEvent {
  final String nextPage;

  const ScrollLoadCharactersList({required this.nextPage});

  @override
  List<Object?> get props => [nextPage];
}
