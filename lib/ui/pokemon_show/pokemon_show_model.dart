import 'package:elementary/elementary.dart';
import 'package:pokemon/models/pokemon/pokemon.dart';
import 'package:pokemon/models/pokemon/repository/pokemon_repository.dart';

class PokemonShowModel extends Model {
  final PokemonRepository _pokemonRepository;

  PokemonShowModel(this._pokemonRepository);

  /// Retrieve random Pokemon
  Future<Pokemon> getRandomPokemon() async {
    final pokemon = await _pokemonRepository.getPokemon();
    return pokemon;
  }
}