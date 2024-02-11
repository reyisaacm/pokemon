
import 'package:pokemon_flutter/data/data_provider/storage_data_provider.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';

class StorageRepository {
  final StorageDataProvider provider;
  StorageRepository(this.provider);

  Future<PokemonDetailModel?> getData() async {
    try {
      String storageData = await provider.read();
      // final jsonData = jsonDecode(storageData);
      if (storageData == "") {
        return null;
      } else {
        PokemonDetailModel model = PokemonDetailModel.fromJson(storageData);
        return model;
      }
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }

  Future<PokemonDetailModel> writeData(PokemonDetailModel data) async {
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
