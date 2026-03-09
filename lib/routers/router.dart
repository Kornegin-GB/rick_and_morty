import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/routers/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: WrapAppRoute.page,
      path: "/",
      children: [AutoRoute(page: CharacterListRoute.page, initial: true)],
    ),
  ];
}
