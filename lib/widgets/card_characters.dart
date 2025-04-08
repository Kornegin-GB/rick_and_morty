import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/checked_is_favourite_cubit/checked_is_favourite_cubit.dart';
import 'package:rick_and_morty/bloc/favourite_character_bloc/favourite_character_bloc.dart';
import 'package:rick_and_morty/bloc/load_characters_bloc/load_characters_bloc.dart';
import 'package:rick_and_morty/bloc/select_favourite_cubit/select_favourite_cubit.dart';
import 'package:rick_and_morty/models/character_result.dart';

class CardCharacters extends StatefulWidget {
  const CardCharacters({
    super.key,
    required this.characterResult,
    required this.isFavouriteScreen,
  });

  final CharacterResult characterResult;
  final bool isFavouriteScreen;

  @override
  State<CardCharacters> createState() => _CardCharactersState();
}

class _CardCharactersState extends State<CardCharacters> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectFavouriteCubit, SelectFavouriteState>(
      listener: (context, state) {
        if (state is SelectFavouriteCompleted) {
          if (state.character == widget.characterResult) {
            context.read<FavouriteCharacterBloc>().add(
              FavouriteCharacterLoading(),
            );
          }
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0).copyWith(right: 0.0),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              spacing: 10,
              children: [
                SizedBox(
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.characterResult.image,
                      errorListener: (value) {
                        log("[--- $value ---]");
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 25,
                        children: [
                          Text(
                            "name:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              widget.characterResult.name,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 21,
                        children: [
                          Text(
                            "status:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.characterResult.status.name),
                        ],
                      ),
                      Row(
                        spacing: 15,
                        children: [
                          Text(
                            "gender:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.characterResult.gender.name, maxLines: 2),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (widget.isFavouriteScreen) {
                      removeFavourite(character: widget.characterResult);
                      updateCharacter(false);
                    } else {
                      if (widget.characterResult.isFavourite) {
                        removeFavourite(character: widget.characterResult);
                        updateCharacter(false);
                      } else {
                        addFavourite(character: widget.characterResult);
                        updateCharacter(true);
                      }
                    }
                    context.read<CheckedIsFavouriteCubit>().checkIsFavourite(
                      character: widget.characterResult,
                    );
                  },
                  icon:
                      widget.isFavouriteScreen
                          ? Icon(Icons.delete)
                          : BlocBuilder<
                            CheckedIsFavouriteCubit,
                            CheckedIsFavouriteState
                          >(
                            bloc:
                                context.read<CheckedIsFavouriteCubit>()
                                  ..checkIsFavourite(
                                    character: widget.characterResult,
                                  ),
                            builder: (context, state) {
                              if (state is AvailableFavourite) {
                                return widget.characterResult.isFavourite
                                    ? Icon(Icons.star)
                                    : Icon(Icons.star_border);
                              }
                              if (state is NotAvailableFavourite) {
                                return widget.characterResult.isFavourite
                                    ? Icon(Icons.star)
                                    : Icon(Icons.star_border);
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addFavourite({required CharacterResult character}) {
    context.read<SelectFavouriteCubit>().saveCharacterToFavourite(
      character: character,
    );
  }

  void removeFavourite({required CharacterResult character}) {
    context.read<SelectFavouriteCubit>().removeCharacterToFavourite(
      character: character,
    );
  }

  void updateCharacter(bool addFavourite) {
    context
        .read<LoadCharactersBloc>()
        .list
        .firstWhere((element) => element.id == widget.characterResult.id)
        .isFavourite = addFavourite;
  }
}
