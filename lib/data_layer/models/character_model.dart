import 'package:rick_and_morty/domain_layer/entities/character_entity.dart';

List<CharacterModel> characterListFromJson({required List<dynamic> jsonList}) =>
    List<CharacterModel>.from(
      jsonList.map(
        (character) =>
            CharacterModel.fromJson(character as Map<String, dynamic>),
      ),
    );

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.gender,
    required super.image,
    required super.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      image: json["image"],
      id: json["id"],
      name: json["name"],
      status: json["status"],
      created: DateTime.parse(json["created"]),
      gender: json["gender"],
      species: json["species"],
    );
  }
}
