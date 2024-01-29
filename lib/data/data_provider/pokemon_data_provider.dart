import 'package:http/http.dart' as http;

class PokemonDataProvider {
  Future<String> getPokemonList(int limit, int offset) async {
    try {
      final res = await http.get(Uri.parse(
          "https://pokeapi.co/api/v2/pokemon/?limit=$limit&offset=$offset"));
      return res.body;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
