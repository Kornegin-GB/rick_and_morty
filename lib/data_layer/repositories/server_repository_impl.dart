import 'package:rick_and_morty/data_layer/api/server_api.dart';
import 'package:rick_and_morty/data_layer/mappers/character_page_mapper.dart';
import 'package:rick_and_morty/data_layer/models/character_page_model.dart';
import 'package:rick_and_morty/domain_layer/entities/character_page_entity.dart';
import 'package:rick_and_morty/domain_layer/repositories/server_repository.dart';

class ServerRepositoryImpl implements ServerRepository {
  final ServerApi serverApi;
  CharacterPageMapper mapper = CharacterPageMapper();

  ServerRepositoryImpl({required this.serverApi});

  @override
  Future<CharacterPageEntity> getListCharacter({required int page}) async {
    final CharacterPageModel characterPageModel = await serverApi
        .getListCharacter(page: page);
    return mapper.characterPageToEntity(characterPageModel);
  }
}
