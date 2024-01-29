import 'package:http/http.dart' as http;

class PokemonDetailsDataProvider {
  Future<String> getPokemonDetail(int id) async {
    try {
      final res =
          await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$id"));

      return res.body;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
