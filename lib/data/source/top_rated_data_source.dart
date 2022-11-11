import 'package:dio/dio.dart';

import 'package:movie_series/data/common/htttp_validate_respone.dart';

import 'package:movie_series/data/entity/top_rated_item.dart';

abstract class IRemoteTopRatedDataSource {
  Future<List<TopRatedItemEntity>> getTopRated();
}

class RemoteTopRatedDataSource
    with HttpValidateRespone
    implements IRemoteTopRatedDataSource {
  final Dio httpClient;
  RemoteTopRatedDataSource(this.httpClient);
  @override
  Future<List<TopRatedItemEntity>> getTopRated() async {
    final respone = await httpClient
        .get("movie/top_rated?api_key=caeeae4ccb1c5ddacd05161e7217a2e6");

    validateRespone(respone);
    List<TopRatedItemEntity> entity = [];

    for (var json in (respone.data['results'] as List)) {
      entity.add(TopRatedItemEntity.fromJson(json));
    }

    return entity;
  }
}
