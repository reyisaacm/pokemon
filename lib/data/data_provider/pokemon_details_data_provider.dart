import 'package:http/http.dart' as http;

class PokemonDetailsDataProvider {
  Future<String> getPokemonDetail(String url) async {
    try {
      final res = await http.get(Uri.parse(url));

      return res.body;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
