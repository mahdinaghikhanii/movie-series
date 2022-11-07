import 'package:dio/dio.dart';

import 'package:movie_series/data/common/htttp_validate_respone.dart';
import 'package:movie_series/data/entity/top_rated.dart';

abstract class ITopRatedDataSource {
  Future<List<TopRatedEntity>> getTopRated();
}

class TopRatedDataSource
    with HttpValidateRespone
    implements ITopRatedDataSource {
  final Dio httpClient;
  TopRatedDataSource(this.httpClient);
  @override
  Future<List<TopRatedEntity>> getTopRated() async {
    final respone = await httpClient
        .get("movie/top_rated?api_key=caeeae4ccb1c5ddacd05161e7217a2e6");

    validateRespone(respone.data);
    List<TopRatedEntity> entity = [];

    for (var json in (respone.data as List)) {
      entity.add(TopRatedEntity.fromJson(json));
    }
    return entity;
  }
}
