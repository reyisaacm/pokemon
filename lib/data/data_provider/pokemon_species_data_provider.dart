import 'package:http/http.dart' as http;

class PokemonSpeciesDataProvider {
  Future<String> getSpecies(int id) async {
    try {
      final res = await http
          .get(Uri.parse("https://pokeapi.co/api/v2/pokemon-species/$id"));

      return res.body;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
