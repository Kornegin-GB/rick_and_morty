import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/internal_layer/dependency_injection.dart';
import 'package:rick_and_morty/internal_layer/rick_and_morty_app.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  DependencyInjection().injection();
  runApp(const RickAndMortyApp());
}
