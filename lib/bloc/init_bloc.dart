import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/checked_is_favourite_cubit/checked_is_favourite_cubit.dart';
import 'package:rick_and_morty/bloc/favourite_character_bloc/favourite_character_bloc.dart';
import 'package:rick_and_morty/bloc/load_characters_bloc/load_characters_bloc.dart';
import 'package:rick_and_morty/bloc/select_favourite_cubit/select_favourite_cubit.dart';
import 'package:rick_and_morty/bloc/theme_select_cubit/theme_select_cubit.dart';
import 'package:rick_and_morty/bloc/view_error_cubit/view_error_cubit.dart';

class InitBloc {
  listBloc(BuildContext context, ThemeSelectCubit themeSelectCubit) {
    return [
      BlocProvider(create: (context) => LoadCharactersBloc()),
      BlocProvider(create: (context) => FavouriteCharacterBloc()),
      BlocProvider(create: (context) => ViewErrorCubit()),
      BlocProvider(create: (context) => SelectFavouriteCubit()),
      BlocProvider(create: (context) => CheckedIsFavouriteCubit()),
      BlocProvider(create: (context) => themeSelectCubit),
    ];
  }
}
