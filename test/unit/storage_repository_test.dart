import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/data/data_provider/storage_data_provider.dart';
import 'package:pokemon_flutter/data/repository/storage_repository.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';

import '../fixtures/pokemon_detail_fixtures.dart';

class MockStorageDataProvider extends StorageDataProvider {
  @override
  Future<String> read() async {
    return detailPokemonModelDataJson;
  }

  @override
  Future<void> write(String data) async {}
}

void main() {
  final MockStorageDataProvider dataProvider = MockStorageDataProvider();

  final repo = StorageRepository(dataProvider);
  test("should return data", () async {
    final data = await repo.getData();
    final expectedResult =
        PokemonDetailModel.fromStorage(jsonDecode(detailPokemonModelDataJson));
    expect(data, expectedResult);
  });
}
