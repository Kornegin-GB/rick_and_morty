import 'dart:convert';

import 'package:rick_and_morty/models/character_info.dart';
import 'package:rick_and_morty/models/character_result.dart';

CharacterModel characterModelFromJson(String str) =>
    CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel {
  final CharacterInfo characterInfo;
  final List<CharacterResult> characterResults;

  CharacterModel({required this.characterInfo, required this.characterResults});

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
    characterInfo: CharacterInfo.fromJson(json["info"]),
    characterResults: List<CharacterResult>.from(
      json["results"].map((x) => CharacterResult.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "info": characterInfo.toJson(),
    "results": List<dynamic>.from(characterResults.map((x) => x.toJson())),
  };
}
