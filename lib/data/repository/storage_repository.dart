import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/storage_data_provider.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';

class StorageRepository {
  final StorageDataProvider provider;
  StorageRepository(this.provider);

  Future<PokemonDetailModel> getData() async {
    try {
      String storageData = await provider.read();
      PokemonDetailModel model = jsonDecode(storageData);

      return model;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }

  Future<PokemonDetailModel> writeData(PokemonDetailModel data) async {
    try {
      provider.write(jsonEncode(data));
      return getData();
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
