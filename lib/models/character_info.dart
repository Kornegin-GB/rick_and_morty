import 'dart:convert';

CharacterInfo characterInfoFromJson(String str) =>
    CharacterInfo.fromJson(json.decode(str));

String characterInfoToJson(CharacterInfo data) => json.encode(data.toJson());

class CharacterInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  CharacterInfo({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory CharacterInfo.fromJson(Map<String, dynamic> json) => CharacterInfo(
    count: json["count"],
    pages: json["pages"],
    next: json["next"] ?? "",
    prev: json["prev"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}
