import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';
import 'package:pokemon_flutter/data/repository/pokemon_berry_repository.dart';

import '../fixtures/berry_fixtures.dart';

class MockPokemonBerryResourceListDataProvider
    extends PokemonResourceListDataProvider {
  @override
  Future<String> getResourceList(
      int limit, int offset, String resourceName) async {
    if (limit == 1) {
      return resourceListBerrySingle;
    } else {
      return resourceListBerryAll;
    }
  }
}

class MockPokemonBerryResourceDetailDataProvider
    extends PokemonResourceDetailDataProvider {
  @override
  Future<String> getResourceDetail(String url) async {
    if (url == "http://berry.url") {
      return resourceDetailBerry;
    } else {
      return resourceDetailBerryItem;
    }
  }
}

void main() {
  final MockPokemonBerryResourceListDataProvider providerList =
      MockPokemonBerryResourceListDataProvider();

  final MockPokemonBerryResourceDetailDataProvider providerDetail =
      MockPokemonBerryResourceDetailDataProvider();

  test(
    "should return all berry",
    () async {
      final repo = PokemonBerryRepository(providerList, providerDetail);
      final data = await repo.getList();
      expect(data.length, 64);
    },
  );
}
