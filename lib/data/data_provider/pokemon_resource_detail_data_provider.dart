import 'package:http/http.dart' as http;
import 'package:pokemon_flutter/data/interface/provider/i_resource_detail_provider.dart';
import 'package:pokemon_flutter/utils/dio_service.dart';

class PokemonResourceDetailDataProvider implements IResourceDetailProvider {
  @override
  Future<String> getResourceDetail(String url) async {
    try {
      final res = await http.get(Uri.parse(url));
      // final res = await dioService.get(url);

      return res.body;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
