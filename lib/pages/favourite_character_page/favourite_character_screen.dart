import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/favourite_character_bloc/favourite_character_bloc.dart';
import 'package:rick_and_morty/widgets/appbar_widget.dart';
import 'package:rick_and_morty/widgets/card_characters.dart';

@RoutePage()
class FavouriteCharacterScreen extends StatelessWidget {
  const FavouriteCharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCharacterBloc, FavouriteCharacterState>(
      bloc:
          context.read<FavouriteCharacterBloc>()
            ..add(FavouriteCharacterLoading()),
      listener: (context, state) {
        //TODO: Выводить сообщение пользователю если ошибка
      },
      builder: (context, state) {
        if (state is FavouriteLoaded) {
          return Scaffold(
            appBar: AppbarWidget(title: "Избранное"),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 5.0),
                itemCount: state.characterResult.length,
                itemBuilder: (context, index) {
                  return CardCharacters(
                    characterResult: state.characterResult[index],
                    isFavouriteScreen: true,
                  );
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
