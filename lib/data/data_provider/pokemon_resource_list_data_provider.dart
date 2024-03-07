import 'package:http/http.dart' as http;
import 'package:pokemon_flutter/utils/dio_service.dart';

class PokemonResourceListDataProvider {
  Future<String> getResourceList(
      int limit, int offset, String resourceName) async {
    try {
      final res = await http.get(Uri.parse(
          "https://pokeapi.co/api/v2/$resourceName/?limit=$limit&offset=$offset"));
      // final res = await DioService.instance
      return res.body;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
