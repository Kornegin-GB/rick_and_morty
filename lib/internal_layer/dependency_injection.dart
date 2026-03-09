import 'package:rick_and_morty/data_layer/api/server_api.dart';
import 'package:rick_and_morty/data_layer/repositories/server_repository_impl.dart';
import 'package:rick_and_morty/domain_layer/repositories/server_repository.dart';
import 'package:rick_and_morty/main.dart';

class DependencyInjection {
  void injection() {
    getIt.registerLazySingleton<ServerRepository>(
      () => ServerRepositoryImpl(serverApi: ServerApi()),
    );
  }
}
