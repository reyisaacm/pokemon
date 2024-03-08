import 'package:pokemon_flutter/data/interface/provider/i_resource_detail_provider.dart';
import 'package:pokemon_flutter/data/interface/provider/i_resource_list_provider.dart';
import 'package:pokemon_flutter/data/interface/repository/i_berry_repository.dart';
import 'package:pokemon_flutter/models/pokemon_berry_model.dart';
import 'package:pokemon_flutter/models/enum/resource_type_enum.dart';
import 'package:pokemon_flutter/models/remote/berry/resource_detail_berry_response_model.dart';
import 'package:pokemon_flutter/models/remote/item/resource_detail_item_response_model.dart';
import 'package:pokemon_flutter/models/remote/resource_list_response_model.dart';
import 'package:pokemon_flutter/models/remote/resource_list_result_response_model.dart';

class PokemonBerryRepository implements IPokemonBerryRepository {
  final IResourceListProvider listProvider;
  final IResourceDetailProvider detailProvider;

  PokemonBerryRepository(this.listProvider, this.detailProvider);

  int _getFirmnessWeight(String firmness) {
    switch (firmness.toLowerCase()) {
      case 'very-soft':
        return 2;
      case 'soft':
        return 3;
      case 'hard':
        return 5;
      case 'very-hard':
        return 8;
      case 'super-hard':
        return 10;
      default:
        return 1;
    }
  }

  @override
  Future<List<PokemonBerryModel>> getList() async {
    try {
      final String listDataCount =
          await listProvider.getResourceList(1, 0, ResourceTypeEnum.berry.name);
      ResourceListResponseModel jsonListDataCount =
          ResourceListResponseModel.fromJson(listDataCount);
      final int limit = jsonListDataCount.count;
      final String listData = await listProvider.getResourceList(
          limit, 0, ResourceTypeEnum.berry.name);
      // final jsonDecoded = jsonDecode(listData);
      final ResourceListResponseModel listResourceData =
          ResourceListResponseModel.fromJson(listData);
      final List<ResourceListResultResponseModel> listObj =
          listResourceData.results;

      final List<PokemonBerryModel> listBerry = [];
      List<Future<String>> listDetailToFetch = [];
      List<Future<String>> listItemToFetch = [];
      List<ResourceDetailBerryResponseModel> listJsonDetailData = [];

      for (final ResourceListResultResponseModel a in listObj) {
        listDetailToFetch.add(detailProvider.getResourceDetail(a.url));
      }

      List<String> listDetail = await Future.wait(listDetailToFetch);

      for (final String a in listDetail) {
        ResourceDetailBerryResponseModel jsonDetailData =
            ResourceDetailBerryResponseModel.fromJson(a);
        listJsonDetailData.add(jsonDetailData);
        listItemToFetch
            .add(detailProvider.getResourceDetail(jsonDetailData.item.url));
      }

      List<String> listItemDetail = await Future.wait(listItemToFetch);
      for (int i = 0; i < listJsonDetailData.length; i++) {
        final String firmness = listJsonDetailData[i].firmness.name;
        final ResourceDetailItemResponseModel jsonItemDetail =
            ResourceDetailItemResponseModel.fromJson(listItemDetail[i]);

        final PokemonBerryModel data = PokemonBerryModel(
            id: listJsonDetailData[i].id,
            firmness: firmness,
            name: jsonItemDetail.name,
            imageUrl: jsonItemDetail.sprites.spritesDefault,
            weight: _getFirmnessWeight(firmness));
        listBerry.add(data);
      }

      return listBerry;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
