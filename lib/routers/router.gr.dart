// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/foundation.dart' as _i4;
import 'package:rick_and_morty/presentation_layer/pages/character_list_page/character_list_screen.dart'
    as _i1;
import 'package:rick_and_morty/presentation_layer/pages/wrap_app_screen.dart'
    as _i2;

/// generated route for
/// [_i1.CharacterListScreen]
class CharacterListRoute extends _i3.PageRouteInfo<CharacterListRouteArgs> {
  CharacterListRoute({_i4.Key? key, List<_i3.PageRouteInfo>? children})
    : super(
        CharacterListRoute.name,
        args: CharacterListRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'CharacterListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CharacterListRouteArgs>(
        orElse: () => const CharacterListRouteArgs(),
      );
      return _i1.CharacterListScreen(key: args.key);
    },
  );
}

class CharacterListRouteArgs {
  const CharacterListRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'CharacterListRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CharacterListRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i2.WrapAppScreen]
class WrapAppRoute extends _i3.PageRouteInfo<void> {
  const WrapAppRoute({List<_i3.PageRouteInfo>? children})
    : super(WrapAppRoute.name, initialChildren: children);

  static const String name = 'WrapAppRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.WrapAppScreen();
    },
  );
}
