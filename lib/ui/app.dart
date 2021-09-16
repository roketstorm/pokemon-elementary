import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon/repository/pokemon_api_client.dart';
import 'package:pokemon/models/pokemon/repository/pokemon_repository.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/ui/pokemon_show/pokemon_show_model.dart';
import 'package:pokemon/ui/pokemon_show/pokemon_show_screen.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // Collecting dependecies
    final client = http.Client();
    final pokemonApiClient = PokemonApiClient(httpClient: client);
    final pokemonRepository =
        PokemonRepository(pokemonApiClient: pokemonApiClient);
    final pokemonShowModel = PokemonShowModel(pokemonRepository);

    return Provider(
      create: (_) => pokemonShowModel,
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        home: const PokemonShowScreen(),
      ),
    );
  }
}
