import 'package:rick_and_morty/data_layer/models/character_page_model.dart';
import 'package:rick_and_morty/domain_layer/entities/character_page_entity.dart';

class CharacterPageMapper {
  CharacterPageEntity characterPageToEntity(
    CharacterPageModel characterPageModel,
  ) => CharacterPageEntity(
    count: characterPageModel.count,
    pages: characterPageModel.pages,
    results: characterPageModel.results,
    next: characterPageModel.next,
    prev: characterPageModel.prev,
  );
}
