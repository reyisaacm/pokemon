import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/storage_data_provider.dart';
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';

class StorageRepository {
  final StorageDataProvider provider;
  StorageRepository(this.provider);

  Future<PokemonListItemModel> getData() async {
    try {
      String storageData = await provider.read();
      // final jsonData = jsonDecode(storageData);
      PokemonListItemModel model = PokemonListItemModel.fromJson(storageData);

      return model;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }

  Future<PokemonListItemModel> writeData(PokemonListItemModel data) async {
    try {
      await provider.write(data.toJson());
      dynamic returnData = await getData();
      return returnData;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
