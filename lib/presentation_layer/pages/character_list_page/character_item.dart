import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morty/domain_layer/entities/character_entity.dart';
import 'package:rick_and_morty/presentation_layer/pages/character_list_page/character_image.dart';
import 'package:rick_and_morty/presentation_layer/pages/character_list_page/character_info_item.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.characterEntity});

  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key("${characterEntity.id}"),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          CharacterImage(imageUrl: characterEntity.image),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CharacterInfoItem(title: "Имя", data: characterEntity.name),
                CharacterInfoItem(
                  title: "Статус",
                  data: characterEntity.status,
                ),
                CharacterInfoItem(title: "Пол", data: characterEntity.gender),
                CharacterInfoItem(
                  title: "Расса",
                  data: characterEntity.species,
                ),
                CharacterInfoItem(
                  title: "Создан",
                  data: DateFormat(
                    "dd.MM.yyyy",
                  ).format(characterEntity.created),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
