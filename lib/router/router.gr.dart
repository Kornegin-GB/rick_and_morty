// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:rick_and_morty/pages/character_list_page/character_list_screen.dart'
    as _i1;
import 'package:rick_and_morty/pages/favourite_character_page/favourite_character_screen.dart'
    as _i2;
import 'package:rick_and_morty/pages/main_page/main_screen.dart' as _i3;

/// generated route for
/// [_i1.CharacterListScreen]
class CharacterListRoute extends _i4.PageRouteInfo<void> {
  const CharacterListRoute({List<_i4.PageRouteInfo>? children})
    : super(CharacterListRoute.name, initialChildren: children);

  static const String name = 'CharacterListRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.CharacterListScreen();
    },
  );
}

/// generated route for
/// [_i2.FavouriteCharacterScreen]
class FavouriteCharacterRoute extends _i4.PageRouteInfo<void> {
  const FavouriteCharacterRoute({List<_i4.PageRouteInfo>? children})
    : super(FavouriteCharacterRoute.name, initialChildren: children);

  static const String name = 'FavouriteCharacterRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavouriteCharacterScreen();
    },
  );
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute({List<_i4.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainScreen();
    },
  );
}
