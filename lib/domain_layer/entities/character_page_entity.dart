import 'package:rick_and_morty/domain_layer/entities/character_entity.dart';

class CharacterPageEntity {
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  final List<CharacterEntity> results;

  CharacterPageEntity({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
    required this.results,
  });
}
