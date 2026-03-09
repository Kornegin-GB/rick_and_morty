import 'package:rick_and_morty/domain_layer/entities/character_page_entity.dart';

abstract class ServerRepository {
  Future<CharacterPageEntity> getListCharacter({required int page});
}
