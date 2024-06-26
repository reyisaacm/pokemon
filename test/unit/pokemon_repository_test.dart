
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';
import 'package:pokemon_flutter/data/repository/pokemon_repository.dart';
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';

import '../fixtures/pokemon_detail_fixtures.dart';
import '../fixtures/pokemon_fixtures.dart';

class MockPokemonResourceListDataProvider
    extends PokemonResourceListDataProvider {
  @override
  Future<String> getResourceList(
      int limit, int offset, String resourceName) async {
    if (limit == 1) {
      return resourcePokemonListSingle;
    } else if (limit == 1302) {
      return resourcePokemonListAll;
    } else {
      return resourcePokemonListTen;
    }
  }
}

class MockPokemonDetailResourceDetailDataProvider
    extends PokemonResourceDetailDataProvider {
  @override
  Future<String> getResourceDetail(String resourceName) async {
    return detailPokemonData;
  }
}

void main() {
  final MockPokemonResourceListDataProvider providerList =
      MockPokemonResourceListDataProvider();

  final MockPokemonDetailResourceDetailDataProvider providerDetail =
      MockPokemonDetailResourceDetailDataProvider();
  final repo = PokemonRepository(providerList, providerDetail);

  test(
    "should return list",
    () async {
      final data = await repo.getList(10, 0);
      expect(data.length, 10);
    },
  );
  test("should return correct search", () async {
    final data = await repo.getListAll(10, 0, "bulbasaur");
    expect(data.length, 1);
    PokemonListItemModel item = data.first;
    expect(item.name, "bulbasaur");
  });
}
