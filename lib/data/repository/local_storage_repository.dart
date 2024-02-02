import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/local_storage_data_provider.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';

class LocalStorageRepository {
  final LocalStorageDataProvider provider;
  LocalStorageRepository(this.provider);

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

  void writeData(PokemonDetailModel data) async {
    try {
      provider.write(jsonEncode(data));
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
