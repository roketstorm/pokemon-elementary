import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon/pokemon.dart';
import 'package:pokemon/ui/pokemon_show/pokemon_show_model.dart';
import 'package:pokemon/ui/pokemon_show/pokemon_show_screen.dart';
import 'package:provider/src/provider.dart';
import 'package:relation/relation.dart';
import 'package:surf_logger/surf_logger.dart';

PokemonShowWM pokemonShowWMFactory(BuildContext context) {
  final model = context.read<PokemonShowModel>();
  return PokemonShowWM(model);
}

/// WidgetModel for PokemonShowScreen
class PokemonShowWM extends WidgetModel<PokemonShowScreen, PokemonShowModel> implements IPokemonShowWM {
  // Using relation for updating state
  @override
  final pokemon = StreamedState<Pokemon?>(null);

  PokemonShowWM(
    PokemonShowModel model,
  ) : super(model);

  /// Initial loading
  @override
  void initWidgetModel() {
    super.initWidgetModel();
    Logger.d("PokemonShowWidgetModel has been loaded");
    getRandomPokemon();
    Logger.d("Web request for Pokemon has been completed");
  }

  /// Fetch random Pokemon
  @override
  Future<void> getRandomPokemon() async {
    await pokemon.accept(null);
    final data = await model.getRandomPokemon();
    await pokemon.accept(data);
  }
}

abstract class IPokemonShowWM extends IWM {
  StreamedState<Pokemon?> get pokemon;

  Future<void> getRandomPokemon();
}
