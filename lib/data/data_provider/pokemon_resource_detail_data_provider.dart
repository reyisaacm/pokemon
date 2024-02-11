import 'package:http/http.dart' as http;

class PokemonResourceDetailDataProvider {
  Future<String> getResourceDetail(String url) async {
    try {
      final res = await http.get(Uri.parse(url));

      return res.body;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
