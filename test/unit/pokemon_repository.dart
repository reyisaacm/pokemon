import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';

class MockPokemonResourceListDataProvider
    extends PokemonResourceListDataProvider {
  @override
  Future<String> getResourceList(
      int limit, int offset, String resourceName) async {
    // if (limit == 1) {
    //   return resourceListBerrySingle;
    // } else {
    //   return resourceListBerryAll;
    // }
    return "";
  }
}

void main() {}
