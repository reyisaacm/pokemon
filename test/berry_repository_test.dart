import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon_flutter/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';
import 'package:pokemon_flutter/data/repository/pokemon_berry_repository.dart';
import 'package:pokemon_flutter/models/enum/resource_type_enum.dart';

import 'fixtures.dart';

class MockPokemonResourceListDataProvider
    extends PokemonResourceListDataProvider {
  @override
  Future<String> getResourceList(int limit, int offset, String resourceName) {
    if (limit == 1) {
      return Future.value(resourceListBerrySingle);
    } else {
      return Future.value(resourceListBerryAll);
    }
  }
}

class MockPokemonResourceDetailDataProvider
    extends PokemonResourceDetailDataProvider {
  @override
  Future<String> getResourceDetail(String url) {
    if (url == "http://berry.url") {
      return Future.value(resourceDetailBerry);
    } else {
      return Future.value(resourceDetailBerryItem);
    }
  }
}

void main() {
  final MockPokemonResourceListDataProvider repoList =
      MockPokemonResourceListDataProvider();

  final MockPokemonResourceDetailDataProvider repoDetail =
      MockPokemonResourceDetailDataProvider();

  test(
    "should return all berry",
    () async {
      final repo = PokemonBerryRepository(repoList, repoDetail);
      final data = await repo.getList();
      expect(data.length, 64);
    },
  );
}
