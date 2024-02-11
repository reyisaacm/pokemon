
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';
import 'package:pokemon_flutter/models/berry_model.dart';

class PokemonBerryRepository {
  final PokemonResourceListDataProvider listDataProvider;
  final PokemonResourceDetailDataProvider detailDataProvider;

  PokemonBerryRepository(this.listDataProvider, this.detailDataProvider);

  Future<List<BerryModel>> getList(int limit, int offset) async {
    try {
      List<BerryModel> model = List.empty();

      return model;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
