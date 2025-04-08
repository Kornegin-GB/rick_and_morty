part of 'load_characters_bloc.dart';

sealed class LoadCharactersState extends Equatable {
  const LoadCharactersState();
}

final class LoadCharactersInitial extends LoadCharactersState {
  @override
  List<Object> get props => [];
}

final class CharactersLoading extends LoadCharactersState {
  @override
  List<Object?> get props => [];
}

final class CharactersLoadingPage extends LoadCharactersState {
  @override
  List<Object?> get props => [];
}

final class CharactersLoadedPage extends LoadCharactersState {
  final List<CharacterResult> characters;
  final String? nextUrl;

  const CharactersLoadedPage({required this.characters, required this.nextUrl});

  @override
  List<Object?> get props => [characters, nextUrl];
}

final class CharactersLoadException extends LoadCharactersState {
  final AnswerError messageError;

  const CharactersLoadException({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}

final class CharactersLoaded extends LoadCharactersState {
  final List<CharacterResult> characters;
  final String? nextUrl;

  const CharactersLoaded({required this.characters, required this.nextUrl});

  @override
  List<Object?> get props => [characters, nextUrl];
}
