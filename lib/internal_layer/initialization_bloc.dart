import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation_layer/blocs/character_list_bloc/character_list_bloc.dart';
import 'package:rick_and_morty/presentation_layer/blocs/system_message_cubit/system_message_cubit.dart';

class InitializationBloc extends StatelessWidget {
  const InitializationBloc({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SystemMessageCubit()),
        BlocProvider(create: (context) => CharacterListBloc()),
      ],
      child: child,
    );
  }
}
