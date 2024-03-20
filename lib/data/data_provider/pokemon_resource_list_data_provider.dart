import 'package:http/http.dart' as http;
import 'package:pokemon_flutter/data/interface/provider/i_resource_list_provider.dart';

class PokemonResourceListDataProvider implements IResourceListProvider {
  @override
  Future<String> getResourceList(
      int limit, int offset, String resourceName) async {
    try {
      final res = await http.get(Uri.parse(
          "https://pokeapi.co/api/v2/$resourceName/?limit=$limit&offset=$offset"));
      // final res = await dioService.get(
      //     "https://pokeapi.co/api/v2/$resourceName/?limit=$limit&offset=$offset");
      return res.body;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
