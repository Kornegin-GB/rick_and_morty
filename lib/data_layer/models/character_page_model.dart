import 'package:rick_and_morty/data_layer/models/character_model.dart';
import 'package:rick_and_morty/domain_layer/entities/character_page_entity.dart';

class CharacterPageModel extends CharacterPageEntity {
  CharacterPageModel({
    required super.count,
    required super.pages,
    required super.results,
    required super.next,
    required super.prev,
  });

  factory CharacterPageModel.fromJson(Map<String, dynamic> json) {
    return CharacterPageModel(
      count: json["info"]["count"],
      next: json["info"]["next"],
      pages: json["info"]["pages"],
      prev: json["info"]["prev"],
      results: characterListFromJson(jsonList: json["results"]),
    );
  }
}
