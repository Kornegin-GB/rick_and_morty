import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/router/router.gr.dart';

@AutoRouterConfig()
class RouterList extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: "/",
      page: MainRoute.page,
      children: [
        AutoRoute(page: CharacterListRoute.page, path: "list"),
        AutoRoute(page: FavouriteCharacterRoute.page, path: "favourite"),
      ],
    ),
  ];
}
