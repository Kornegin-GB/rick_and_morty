import 'dart:convert';

import 'package:rick_and_morty/models/enum_models.dart';

CharacterResult characterResultFromJson(String str) =>
    CharacterResult.fromJson(json.decode(str));

String characterResultToJson(CharacterResult data) =>
    json.encode(data.toJson());

class CharacterResult {
  final int id;
  final String name;
  final Status status;
  final Gender gender;
  final String image;
  bool isFavourite;

  CharacterResult({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.image,
    required this.isFavourite,
  });

  factory CharacterResult.fromJson(Map<String, dynamic> json) =>
      CharacterResult(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        gender: genderValues.map[json["gender"]]!,
        image: json["image"],
        isFavourite: false,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": statusValues.reverse[status],
    "gender": genderValues.reverse[gender],
    "image": image,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterResult &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
