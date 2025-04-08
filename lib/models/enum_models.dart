enum Gender { female, male, unknown, genderless }

final genderValues = EnumValues({
  "Female": Gender.female,
  "Male": Gender.male,
  "unknown": Gender.unknown,
  "Genderless": Gender.genderless,
});

enum Status { alive, dead, unknown }

final statusValues = EnumValues({
  "Alive": Status.alive,
  "Dead": Status.dead,
  "unknown": Status.unknown,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
