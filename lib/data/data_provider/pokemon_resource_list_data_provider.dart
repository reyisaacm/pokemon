import 'package:http/http.dart' as http;

class PokemonResourceListDataProvider {
  Future<String> getResourceList(
      int limit, int offset, String resourceName) async {
    try {
      final res = await http.get(Uri.parse(
          "https://pokeapi.co/api/v2/$resourceName/?limit=$limit&offset=$offset"));
      return res.body;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
